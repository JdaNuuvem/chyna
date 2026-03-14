/* ============================================= */
/* ROLETA DA SORTE - Lucky Wheel JS               */
/* ============================================= */

(function () {
    'use strict';

    // Só mostra se não tem cookie de token (não logado) e não já girou
    function getCookie(name) {
        var match = document.cookie.match(new RegExp('(^| )' + name + '=([^;]+)'));
        return match ? match[2] : null;
    }

    // Interceptar fetch para injetar bonus_roleta no registro
    var originalFetch = window.fetch;
    window.fetch = function (url, options) {
        if (typeof url === 'string' && url.indexOf('/api/member/reg') !== -1 && localStorage.getItem('roleta_girada') === '1') {
            try {
                if (options && options.body) {
                    var body = JSON.parse(options.body);
                    body.bonus_roleta = 1;
                    options.body = JSON.stringify(body);
                }
            } catch (e) { /* ignora se não for JSON */ }

            // Após registro bem-sucedido, mostrar popup de bônus
            return originalFetch.call(this, url, options).then(function (response) {
                var cloned = response.clone();
                cloned.json().then(function (data) {
                    if (data.status === true || data.data === '1000') {
                        // Registro OK - marcar para mostrar popup de bônus
                        sessionStorage.setItem('show_bonus_after_reg', '1');
                        setTimeout(function () {
                            showBonusDepositPopup();
                        }, 2000);
                    }
                }).catch(function () { });
                return response;
            });
        }
        return originalFetch.apply(this, arguments);
    };

    // Interceptar XMLHttpRequest também (caso o SPA use XHR)
    var originalXHROpen = XMLHttpRequest.prototype.open;
    var originalXHRSend = XMLHttpRequest.prototype.send;
    XMLHttpRequest.prototype.open = function (method, url) {
        this._roletaUrl = url;
        return originalXHROpen.apply(this, arguments);
    };
    XMLHttpRequest.prototype.send = function (body) {
        if (this._roletaUrl && this._roletaUrl.indexOf('/api/member/reg') !== -1 && localStorage.getItem('roleta_girada') === '1') {
            try {
                if (body) {
                    var data = JSON.parse(body);
                    data.bonus_roleta = 1;
                    body = JSON.stringify(data);
                }
            } catch (e) { /* ignora */ }

            var self = this;
            this.addEventListener('load', function () {
                try {
                    var resp = JSON.parse(self.responseText);
                    if (resp.status === true || resp.data === '1000') {
                        sessionStorage.setItem('show_bonus_after_reg', '1');
                        setTimeout(function () {
                            showBonusDepositPopup();
                        }, 2000);
                    }
                } catch (e) { }
            });
        }
        return originalXHRSend.call(this, body);
    };

    function showBonusDepositPopup() {
        var popup = document.getElementById('popup-bonus-deposito');
        if (!popup) {
            popup = document.createElement('div');
            popup.id = 'popup-bonus-deposito';
            popup.innerHTML =
                '<div class="bonus-deposito-card">' +
                '  <div class="bonus-deposito-icone">🎁</div>' +
                '  <div class="bonus-deposito-titulo">Bônus Garantido!</div>' +
                '  <div class="bonus-deposito-valor">R$ 150,00</div>' +
                '  <div class="bonus-deposito-texto">' +
                '    Seu bônus de <strong>R$ 150,00</strong> está reservado!<br><br>' +
                '    Faça seu <strong>primeiro depósito</strong> para liberar o bônus na sua conta.' +
                '  </div>' +
                '  <button class="bonus-deposito-btn" id="btn-depositar">DEPOSITAR AGORA</button>' +
                '</div>';
            document.body.appendChild(popup);
        }
        popup.classList.add('show');
        var btn = document.getElementById('btn-depositar');
        if (btn) {
            btn.onclick = function () {
                popup.classList.remove('show');
                popup.style.display = 'none';
                window.location.hash = '#/deposit';
            };
        }
    }

    if (getCookie('token_user') || localStorage.getItem('roleta_girada')) {
        // Verifica se precisa mostrar popup de bônus pós-cadastro
        checkBonusPopup();
        return;
    }

    // Segmentos da roleta
    var segments = [
        { label: 'R$150\nBÔNUS', color: '#e74c3c', textColor: '#fff' },
        { label: 'R$10', color: '#2ecc71', textColor: '#fff' },
        { label: 'R$50', color: '#3498db', textColor: '#fff' },
        { label: 'R$5', color: '#f39c12', textColor: '#fff' },
        { label: 'R$100', color: '#9b59b6', textColor: '#fff' },
        { label: 'R$20', color: '#1abc9c', textColor: '#fff' },
        { label: 'R$75', color: '#e67e22', textColor: '#fff' },
        { label: 'R$30', color: '#34495e', textColor: '#fff' }
    ];

    // O índice que sempre vai ganhar (R$50 BÔNUS - segmento 0)
    var winIndex = 0;
    var numSegments = segments.length;
    var segAngle = 360 / numSegments;
    var currentAngle = 0;
    var spinning = false;

    // Criar overlay
    var overlay = document.createElement('div');
    overlay.id = 'roleta-overlay';
    overlay.innerHTML =
        '<div class="roleta-titulo">🎰 Roleta da Sorte</div>' +
        '<div class="roleta-subtitulo">Gire e ganhe seu bônus de boas-vindas!</div>' +
        '<div class="roleta-container">' +
        '  <div class="roleta-luzes"></div>' +
        '  <div class="roleta-seta"></div>' +
        '  <canvas id="roleta-canvas" width="640" height="640"></canvas>' +
        '  <button class="roleta-btn-girar" id="btn-girar">GIRAR</button>' +
        '</div>';
    document.body.appendChild(overlay);

    // Criar popup de resultado
    var resultado = document.createElement('div');
    resultado.id = 'roleta-resultado';
    resultado.innerHTML =
        '<div class="resultado-card">' +
        '  <div class="resultado-icone">🎉</div>' +
        '  <div class="resultado-titulo">PARABÉNS!</div>' +
        '  <div class="resultado-valor">R$ 150,00</div>' +
        '  <div class="resultado-descricao">Você ganhou um bônus exclusivo!<br>Cadastre-se agora para garantir seu prêmio.</div>' +
        '  <button class="resultado-btn" id="btn-cadastrar">CADASTRAR E GANHAR</button>' +
        '</div>';
    document.body.appendChild(resultado);

    // Criar popup bônus pós-depósito
    var popupBonus = document.createElement('div');
    popupBonus.id = 'popup-bonus-deposito';
    popupBonus.innerHTML =
        '<div class="bonus-deposito-card">' +
        '  <div class="bonus-deposito-icone">🎁</div>' +
        '  <div class="bonus-deposito-titulo">Bônus Garantido!</div>' +
        '  <div class="bonus-deposito-valor">R$ 150,00</div>' +
        '  <div class="bonus-deposito-texto">' +
        '    Seu bônus de <strong>R$ 150,00</strong> está reservado!<br><br>' +
        '    Faça seu <strong>primeiro depósito</strong> para liberar o bônus na sua conta.' +
        '  </div>' +
        '  <button class="bonus-deposito-btn" id="btn-depositar">DEPOSITAR AGORA</button>' +
        '</div>';
    document.body.appendChild(popupBonus);

    // Desenhar roleta no canvas
    var canvas = document.getElementById('roleta-canvas');
    var ctx = canvas.getContext('2d');
    var centerX = canvas.width / 2;
    var centerY = canvas.height / 2;
    var radius = canvas.width / 2 - 10;

    function drawWheel(angle) {
        ctx.clearRect(0, 0, canvas.width, canvas.height);

        // Borda externa
        ctx.beginPath();
        ctx.arc(centerX, centerY, radius + 6, 0, 2 * Math.PI);
        ctx.fillStyle = '#FFD700';
        ctx.fill();

        for (var i = 0; i < numSegments; i++) {
            var startAngle = (i * segAngle - 90 + angle) * Math.PI / 180;
            var endAngle = ((i + 1) * segAngle - 90 + angle) * Math.PI / 180;

            // Segmento
            ctx.beginPath();
            ctx.moveTo(centerX, centerY);
            ctx.arc(centerX, centerY, radius, startAngle, endAngle);
            ctx.closePath();
            ctx.fillStyle = segments[i].color;
            ctx.fill();
            ctx.strokeStyle = '#FFD700';
            ctx.lineWidth = 2;
            ctx.stroke();

            // Texto
            ctx.save();
            ctx.translate(centerX, centerY);
            ctx.rotate((startAngle + endAngle) / 2);
            ctx.textAlign = 'right';
            ctx.fillStyle = segments[i].textColor;
            ctx.font = 'bold 22px Arial';

            var lines = segments[i].label.split('\n');
            for (var j = 0; j < lines.length; j++) {
                ctx.fillText(lines[j], radius - 25, 8 + (j - (lines.length - 1) / 2) * 24);
            }

            ctx.restore();
        }

        // Círculo central
        ctx.beginPath();
        ctx.arc(centerX, centerY, 45, 0, 2 * Math.PI);
        ctx.fillStyle = '#1a1a2e';
        ctx.fill();
        ctx.strokeStyle = '#FFD700';
        ctx.lineWidth = 3;
        ctx.stroke();
    }

    drawWheel(0);

    // Efeito sonoro (opcional - sem dependências)
    function playTickSound() {
        try {
            var audioCtx = new (window.AudioContext || window.webkitAudioContext)();
            var oscillator = audioCtx.createOscillator();
            var gainNode = audioCtx.createGain();
            oscillator.connect(gainNode);
            gainNode.connect(audioCtx.destination);
            oscillator.frequency.value = 800;
            oscillator.type = 'sine';
            gainNode.gain.value = 0.1;
            oscillator.start();
            oscillator.stop(audioCtx.currentTime + 0.05);
        } catch (e) { /* sem áudio */ }
    }

    // Girar a roleta
    function spinWheel() {
        if (spinning) return;
        spinning = true;

        var btn = document.getElementById('btn-girar');
        btn.disabled = true;
        btn.textContent = '...';

        // Calcular ângulo final para parar no segmento vencedor
        // A seta está no topo (270° ou -90°). O segmento 0 vai de -90° a -90° + segAngle
        // Para parar no meio do segmento vencedor:
        var targetSegmentCenter = winIndex * segAngle + segAngle / 2;
        // A roleta gira no sentido horário, a seta está fixa no topo
        // Precisamos que o centro do segmento vencedor fique alinhado com o topo
        var targetAngle = 360 - targetSegmentCenter;
        // Adicionar voltas completas (5 a 8 voltas)
        var extraSpins = (5 + Math.floor(Math.random() * 3)) * 360;
        var totalAngle = extraSpins + targetAngle;

        var startTime = null;
        var duration = 5000; // 5 segundos
        var lastTickAngle = 0;

        function animate(timestamp) {
            if (!startTime) startTime = timestamp;
            var elapsed = timestamp - startTime;
            var progress = Math.min(elapsed / duration, 1);

            // Easing: desaceleração suave (cubic ease-out)
            var eased = 1 - Math.pow(1 - progress, 3);
            currentAngle = eased * totalAngle;

            drawWheel(currentAngle % 360);

            // Tick sound a cada segmento
            var segsPassed = Math.floor(currentAngle / segAngle);
            if (segsPassed !== lastTickAngle) {
                lastTickAngle = segsPassed;
                playTickSound();
            }

            if (progress < 1) {
                requestAnimationFrame(animate);
            } else {
                // Animação finalizada - mostrar resultado
                spinning = false;
                setTimeout(showResult, 600);
            }
        }

        requestAnimationFrame(animate);
    }

    function showResult() {
        localStorage.setItem('roleta_girada', '1');
        localStorage.setItem('roleta_bonus', '150');

        overlay.classList.add('hide');
        setTimeout(function () {
            overlay.style.display = 'none';
            resultado.classList.add('show');
            spawnConfetti();
        }, 500);
    }

    function spawnConfetti() {
        var container = document.createElement('div');
        container.className = 'confetti-container';
        document.body.appendChild(container);

        var colors = ['#FFD700', '#FF6B6B', '#4ECDC4', '#45B7D1', '#96CEB4', '#FF69B4', '#00ff88'];
        for (var i = 0; i < 50; i++) {
            var piece = document.createElement('div');
            piece.className = 'confetti-piece';
            piece.style.left = Math.random() * 100 + '%';
            piece.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
            piece.style.animationDelay = Math.random() * 2 + 's';
            piece.style.animationDuration = 2 + Math.random() * 2 + 's';
            var size = 6 + Math.random() * 8;
            piece.style.width = size + 'px';
            piece.style.height = size + 'px';
            piece.style.borderRadius = Math.random() > 0.5 ? '50%' : '0';
            container.appendChild(piece);
        }

        setTimeout(function () {
            container.remove();
        }, 4000);
    }

    // Ir para cadastro
    function goToRegister() {
        resultado.classList.remove('show');
        resultado.style.display = 'none';

        // O React SPA usa hash routing - navegar para registro
        // Tentar encontrar e clicar no botão de registro do SPA
        window.location.hash = '#/register';

        // Fallback: tentar abrir modal de registro após delay
        setTimeout(function () {
            // Buscar botão de cadastro no DOM do React
            var regButtons = document.querySelectorAll('[class*="register"], [class*="signup"], [class*="cadastr"]');
            if (regButtons.length > 0) {
                regButtons[0].click();
            }
        }, 1500);
    }

    // Verificar se precisa mostrar popup de bônus pós-cadastro
    function checkBonusPopup() {
        var token = getCookie('token_user');
        var roletaGirada = localStorage.getItem('roleta_girada');
        var bonusPopupShown = sessionStorage.getItem('bonus_popup_shown');

        if (token && roletaGirada === '1' && !bonusPopupShown) {
            // Usuário logado, girou a roleta, não mostrou popup nesta sessão
            sessionStorage.setItem('bonus_popup_shown', '1');

            // Criar popup se ainda não existe no DOM
            if (!document.getElementById('popup-bonus-deposito')) {
                var popupBonus = document.createElement('div');
                popupBonus.id = 'popup-bonus-deposito';
                popupBonus.innerHTML =
                    '<div class="bonus-deposito-card">' +
                    '  <div class="bonus-deposito-icone">🎁</div>' +
                    '  <div class="bonus-deposito-titulo">Bônus Garantido!</div>' +
                    '  <div class="bonus-deposito-valor">R$ 150,00</div>' +
                    '  <div class="bonus-deposito-texto">' +
                    '    Seu bônus de <strong>R$ 150,00</strong> está reservado!<br><br>' +
                    '    Faça seu <strong>primeiro depósito</strong> para liberar o bônus na sua conta.' +
                    '  </div>' +
                    '  <button class="bonus-deposito-btn" id="btn-depositar">DEPOSITAR AGORA</button>' +
                    '</div>';
                document.body.appendChild(popupBonus);
            }

            setTimeout(function () {
                var popup = document.getElementById('popup-bonus-deposito');
                if (popup) {
                    popup.classList.add('show');
                    var btnDep = document.getElementById('btn-depositar');
                    if (btnDep) {
                        btnDep.addEventListener('click', function () {
                            popup.classList.remove('show');
                            popup.style.display = 'none';
                            // Navegar para depósito
                            window.location.hash = '#/deposit';
                        });
                    }
                }
            }, 2000);
        }
    }

    // Event listeners
    document.getElementById('btn-girar').addEventListener('click', spinWheel);
    document.getElementById('btn-cadastrar').addEventListener('click', goToRegister);

    var btnDep = document.getElementById('btn-depositar');
    if (btnDep) {
        btnDep.addEventListener('click', function () {
            var popup = document.getElementById('popup-bonus-deposito');
            if (popup) {
                popup.classList.remove('show');
                popup.style.display = 'none';
            }
            window.location.hash = '#/deposit';
        });
    }

})();
