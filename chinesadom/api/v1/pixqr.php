<!DOCTYPE html>
<?php
include_once "./../../ad-min/services/crud.php";
global $mysqli;

$query = "SELECT * FROM config WHERE id = 1";
$configs = mysqli_query($mysqli, $query) or die(mysqli_error($mysqli));
$config = mysqli_fetch_assoc($configs);

$paymentCode = $_GET['paymentCode'] ?? '';
$querypc = "SELECT * FROM transacoes WHERE code = '" . mysqli_real_escape_string($mysqli, $paymentCode) . "'";
$trs = mysqli_query($mysqli, $querypc) or die(mysqli_error($mysqli));
$tr = mysqli_fetch_assoc($trs);
$tid = $tr['transacao_id'] ?? '';
$status = $tr['status'] ?? '';
?>
<html lang="pt-BR">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <title>Depósito PIX</title>
  <link rel="icon" href="Pix%20QR_arquivos/logo.png">
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    html, body {
      height: 100%;
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
      background: #1a0a12;
      color: #fff;
      overflow-x: hidden;
    }

    .page-wrapper {
      min-height: 100vh;
      max-width: 500px;
      margin: 0 auto;
      background: linear-gradient(180deg, #2d0f1e 0%, #1a0a12 100%);
      position: relative;
      padding-bottom: 80px;
    }

    /* Header */
    .header {
      display: flex;
      align-items: center;
      padding: 16px 20px;
      background: rgba(45, 15, 30, 0.95);
      backdrop-filter: blur(10px);
      position: sticky;
      top: 0;
      z-index: 100;
      border-bottom: 1px solid rgba(255,255,255,0.06);
    }

    .header .back-btn {
      width: 36px;
      height: 36px;
      border-radius: 50%;
      background: rgba(255,255,255,0.08);
      border: none;
      color: #fff;
      font-size: 20px;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: background 0.2s;
    }

    .header .back-btn:active {
      background: rgba(255,255,255,0.15);
    }

    .header .title {
      flex: 1;
      text-align: center;
      font-size: 17px;
      font-weight: 600;
      margin-right: 36px;
    }

    /* Status badge */
    .status-bar {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
      padding: 12px 20px;
      background: rgba(255, 193, 7, 0.08);
      border-bottom: 1px solid rgba(255, 193, 7, 0.1);
    }

    .status-bar .dot {
      width: 8px;
      height: 8px;
      border-radius: 50%;
      background: #ffc107;
      animation: pulse 1.5s ease-in-out infinite;
    }

    .status-bar span {
      font-size: 13px;
      color: #ffc107;
      font-weight: 500;
    }

    .status-bar.paid {
      background: rgba(76, 175, 80, 0.08);
      border-bottom-color: rgba(76, 175, 80, 0.1);
    }

    .status-bar.paid .dot {
      background: #4caf50;
      animation: none;
    }

    .status-bar.paid span {
      color: #4caf50;
    }

    @keyframes pulse {
      0%, 100% { opacity: 1; }
      50% { opacity: 0.3; }
    }

    /* Valor */
    .amount-section {
      text-align: center;
      padding: 24px 20px 8px;
    }

    .amount-label {
      font-size: 13px;
      color: rgba(255,255,255,0.5);
      margin-bottom: 6px;
    }

    .amount-value {
      font-size: 36px;
      font-weight: 700;
      color: #fff;
    }

    .amount-value small {
      font-size: 20px;
      font-weight: 500;
      color: rgba(255,255,255,0.6);
      margin-right: 4px;
    }

    /* QR Card */
    .qr-card {
      margin: 20px;
      background: #fff;
      border-radius: 16px;
      padding: 24px;
      text-align: center;
      position: relative;
      overflow: hidden;
    }

    .qr-card::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 4px;
      background: linear-gradient(90deg, #e91e63, #ff5722, #e91e63);
    }

    .qr-card .scan-text {
      font-size: 14px;
      color: #666;
      margin-bottom: 16px;
      line-height: 1.4;
    }

    .qr-image-wrap {
      width: 220px;
      height: 220px;
      margin: 0 auto;
      border-radius: 12px;
      border: 2px solid #f0f0f0;
      display: flex;
      align-items: center;
      justify-content: center;
      position: relative;
      overflow: hidden;
    }

    .qr-image-wrap img {
      width: 100%;
      height: 100%;
      object-fit: contain;
    }

    .qr-image-wrap .check-overlay {
      position: absolute;
      inset: 0;
      background: rgba(255,255,255,0.92);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 72px;
      animation: scaleIn 0.3s ease;
    }

    @keyframes scaleIn {
      from { transform: scale(0); opacity: 0; }
      to { transform: scale(1); opacity: 1; }
    }

    .qr-card .pix-logo {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 6px;
      margin-top: 14px;
      font-size: 12px;
      color: #999;
    }

    .qr-card .pix-logo svg {
      width: 16px;
      height: 16px;
    }

    /* Copy section */
    .copy-section {
      margin: 0 20px;
    }

    .copy-box {
      background: rgba(255,255,255,0.06);
      border: 1px solid rgba(255,255,255,0.1);
      border-radius: 12px;
      padding: 14px 16px;
      display: flex;
      align-items: center;
      gap: 12px;
    }

    .copy-box .code-text {
      flex: 1;
      font-size: 12px;
      color: rgba(255,255,255,0.6);
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      font-family: 'Courier New', monospace;
    }

    .copy-btn {
      background: linear-gradient(135deg, #e91e63, #c2185b);
      color: #fff;
      border: none;
      border-radius: 8px;
      padding: 10px 20px;
      font-size: 13px;
      font-weight: 600;
      cursor: pointer;
      white-space: nowrap;
      transition: transform 0.1s, opacity 0.2s;
    }

    .copy-btn:active {
      transform: scale(0.96);
    }

    .copy-btn.copied {
      background: linear-gradient(135deg, #4caf50, #388e3c);
    }

    /* Confirm button */
    .confirm-btn {
      display: block;
      width: calc(100% - 40px);
      margin: 20px auto;
      padding: 16px;
      background: linear-gradient(135deg, #e91e63, #c2185b);
      color: #fff;
      border: none;
      border-radius: 12px;
      font-size: 16px;
      font-weight: 600;
      cursor: pointer;
      transition: transform 0.1s, opacity 0.2s;
    }

    .confirm-btn:active {
      transform: scale(0.98);
    }

    .confirm-btn.paid {
      background: linear-gradient(135deg, #4caf50, #388e3c);
      pointer-events: none;
    }

    /* Instructions */
    .instructions {
      margin: 20px;
      padding: 16px;
      background: rgba(255,255,255,0.04);
      border-radius: 12px;
      border: 1px solid rgba(255,255,255,0.06);
    }

    .instructions .step {
      display: flex;
      align-items: flex-start;
      gap: 12px;
      padding: 8px 0;
    }

    .instructions .step + .step {
      border-top: 1px solid rgba(255,255,255,0.04);
    }

    .instructions .step-num {
      width: 24px;
      height: 24px;
      border-radius: 50%;
      background: rgba(233, 30, 99, 0.15);
      color: #e91e63;
      font-size: 12px;
      font-weight: 700;
      display: flex;
      align-items: center;
      justify-content: center;
      flex-shrink: 0;
      margin-top: 1px;
    }

    .instructions .step-text {
      font-size: 13px;
      color: rgba(255,255,255,0.6);
      line-height: 1.5;
    }

    /* Timer */
    .timer {
      text-align: center;
      padding: 8px 0 0;
      font-size: 12px;
      color: rgba(255,255,255,0.3);
    }

    /* Toast notification */
    .toast-notification {
      position: fixed;
      top: 80px;
      left: 50%;
      transform: translateX(-50%) translateY(-20px);
      background: rgba(0,0,0,0.85);
      color: #fff;
      padding: 12px 24px;
      border-radius: 8px;
      font-size: 14px;
      z-index: 9999;
      opacity: 0;
      transition: all 0.3s ease;
      pointer-events: none;
    }

    .toast-notification.show {
      opacity: 1;
      transform: translateX(-50%) translateY(0);
    }

    /* Bottom nav fake (matching casino) */
    .bottom-nav {
      position: fixed;
      bottom: 0;
      left: 50%;
      transform: translateX(-50%);
      width: 100%;
      max-width: 500px;
      background: #1a0a12;
      border-top: 1px solid rgba(255,255,255,0.06);
      display: flex;
      justify-content: space-around;
      padding: 8px 0 12px;
      z-index: 100;
    }

    .bottom-nav .nav-item {
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 4px;
      color: rgba(255,255,255,0.4);
      font-size: 10px;
      text-decoration: none;
      cursor: pointer;
      border: none;
      background: none;
      padding: 0;
    }

    .bottom-nav .nav-item.active {
      color: #e91e63;
    }

    .bottom-nav .nav-item svg {
      width: 22px;
      height: 22px;
    }
  </style>
</head>

<body>
  <div class="page-wrapper">
    <!-- Header -->
    <div class="header">
      <button class="back-btn" id="btn-voltar" title="Voltar">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M15 18l-6-6 6-6"/></svg>
      </button>
      <div class="title">Depósito PIX</div>
    </div>

    <!-- Status -->
    <div class="status-bar" id="status-bar">
      <div class="dot"></div>
      <span id="status-text">Aguardando pagamento</span>
    </div>

    <!-- Valor -->
    <div class="amount-section">
      <div class="amount-label">Valor do depósito</div>
      <div class="amount-value"><small>R$</small><span id="pix-value">0</span></div>
    </div>

    <!-- QR Code Card -->
    <div class="qr-card">
      <div class="scan-text">Escaneie o QR Code com o app do seu banco</div>
      <div class="qr-image-wrap" id="qr-wrap">
        <img id="qrcode-image" src="" alt="QR Code PIX">
      </div>
      <div class="pix-logo">
        <svg viewBox="0 0 512 512" fill="#32BCAD"><path d="M242.4 292.5C247.8 287.1 257.1 287.1 262.5 292.5L339.5 369.5C353.7 383.7 googled 383.7 397.9 369.5L430.6 336.8C462.5 304.9 462.5 252.3 430.6 220.4L398.1 187.9C383.7 173.5 383.7 150.4 398.1 136L462.5 71.6C466.9 67.2 466.9 60.1 462.5 55.7L405.3-1.5C400.9-5.9 393.8-5.9 389.4-1.5L324.8 63.1C310.6 77.3 287.5 77.3 273.3 63.1L240.6 30.4C208.7-1.5 156.1-1.5 124.2 30.4L91.5 63.1C59.6 95 59.6 147.6 91.5 179.5L124.2 212.2C138.4 226.4 138.4 249.5 124.2 263.7L59.8 328.1C55.4 332.5 55.4 339.6 59.8 344L117 401.2C121.4 405.6 128.5 405.6 132.9 401.2L197.3 336.8C211.7 322.4 234.8 322.4 249 336.8L316.4 404.2C330.6 418.4 353.7 418.4 367.9 404.2L395.6 376.5C409.8 362.3 409.8 339.2 395.6 325L318.6 248C305.8 235.2 305.8 214.5 318.6 201.7Z"/></svg>
        Pagamento via PIX
      </div>
    </div>

    <!-- Copy section -->
    <div class="copy-section">
      <div class="copy-box">
        <div class="code-text" id="code-display"></div>
        <button class="copy-btn" id="copy-button">COPIAR</button>
      </div>
    </div>

    <!-- Confirm -->
    <button class="confirm-btn" id="btn-confirmar">Ja fiz o pagamento</button>

    <!-- Instructions -->
    <div class="instructions">
      <div class="step">
        <div class="step-num">1</div>
        <div class="step-text">Abra o app do seu banco e escolha pagar com PIX</div>
      </div>
      <div class="step">
        <div class="step-num">2</div>
        <div class="step-text">Escaneie o QR Code ou copie e cole o código PIX</div>
      </div>
      <div class="step">
        <div class="step-num">3</div>
        <div class="step-text">Confirme o pagamento e aguarde a aprovação automática</div>
      </div>
    </div>

    <div class="timer">Este QR Code é válido para um único pagamento</div>
  </div>

  <!-- Bottom nav -->
  <div class="bottom-nav">
    <a class="nav-item" href="/" onclick="history.back();return false;">
      <svg viewBox="0 0 24 24" fill="currentColor"><path d="M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z"/></svg>
      <span>Início</span>
    </a>
    <a class="nav-item" href="/">
      <svg viewBox="0 0 24 24" fill="currentColor"><path d="M20 6h-2.18c.11-.31.18-.65.18-1 0-1.66-1.34-3-3-3-1.05 0-1.96.54-2.5 1.35l-.5.67-.5-.68C10.96 2.54 10.05 2 9 2 7.34 2 6 3.34 6 5c0 .35.07.69.18 1H4c-1.11 0-1.99.89-1.99 2L2 19c0 1.11.89 2 2 2h16c1.11 0 2-.89 2-2V8c0-1.11-.89-2-2-2z"/></svg>
      <span>Promoção</span>
    </a>
    <a class="nav-item active" href="javascript:void(0)">
      <svg viewBox="0 0 24 24" fill="currentColor"><path d="M21 18v1c0 1.1-.9 2-2 2H5c-1.11 0-2-.9-2-2V5c0-1.1.89-2 2-2h14c1.1 0 2 .9 2 2v1h-9c-1.11 0-2 .9-2 2v8c0 1.1.89 2 2 2h9zm-9-2h10V8H12v8zm4-2.5c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5 1.5.67 1.5 1.5-.67 1.5-1.5 1.5z"/></svg>
      <span>Depósito</span>
    </a>
    <a class="nav-item" href="/">
      <svg viewBox="0 0 24 24" fill="currentColor"><path d="M20 2H4c-1.1 0-1.99.9-1.99 2L2 22l4-4h14c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zM6 9h12v2H6V9zm8 5H6v-2h8v2zm4-6H6V6h12v2z"/></svg>
      <span>Suporte</span>
    </a>
    <a class="nav-item" href="/">
      <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/></svg>
      <span>Perfil</span>
    </a>
  </div>

  <!-- Toast -->
  <div class="toast-notification" id="toast"></div>

  <script>
    var paymentCode = '';
    var paymentCodeBase64 = '';

    // Parse URL params
    function getUrlParameter(name) {
      name = name.replace(/[\[\]]/g, "\\$&");
      var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)");
      var results = regex.exec(window.location.href);
      if (!results) return null;
      if (!results[2]) return '';
      return decodeURIComponent(results[2].replace(/\+/g, " "));
    }

    // Init QR
    paymentCodeBase64 = getUrlParameter('paymentCodeBase64');
    if (paymentCodeBase64) {
      paymentCodeBase64 = paymentCodeBase64.replace(/\s+/g, '');
      document.getElementById('qrcode-image').src = 'data:image/png;base64,' + paymentCodeBase64;
    }

    // Init code
    paymentCode = getUrlParameter('paymentCode');
    if (paymentCode) {
      document.getElementById('code-display').textContent = paymentCode;
    }

    // Init value
    var amount = getUrlParameter('valorPix');
    if (amount) {
      document.getElementById('pix-value').textContent = amount;
    }

    // Toast
    function showToast(msg, duration) {
      var t = document.getElementById('toast');
      t.textContent = msg;
      t.classList.add('show');
      setTimeout(function() { t.classList.remove('show'); }, duration || 2500);
    }

    // Copy
    document.getElementById('copy-button').addEventListener('click', function() {
      var btn = this;
      navigator.clipboard.writeText(paymentCode).then(function() {
        btn.textContent = 'COPIADO!';
        btn.classList.add('copied');
        showToast('Código PIX copiado!');
        setTimeout(function() {
          btn.textContent = 'COPIAR';
          btn.classList.remove('copied');
        }, 3000);
      }).catch(function() {
        // Fallback
        var input = document.createElement('textarea');
        input.value = paymentCode;
        document.body.appendChild(input);
        input.select();
        document.execCommand('copy');
        document.body.removeChild(input);
        btn.textContent = 'COPIADO!';
        btn.classList.add('copied');
        showToast('Código PIX copiado!');
        setTimeout(function() {
          btn.textContent = 'COPIAR';
          btn.classList.remove('copied');
        }, 3000);
      });
    });

    // Back
    document.getElementById('btn-voltar').addEventListener('click', function() {
      history.back();
    });

    document.getElementById('btn-confirmar').addEventListener('click', function() {
      history.back();
    });

    // Payment verification polling
    var formData = new FormData();
    formData.append("id", "<?= htmlspecialchars($tid) ?>");
    formData.append("gateway_default", "<?= htmlspecialchars($config['gateway_default']) ?>");

    function markAsPaid() {
      document.getElementById('status-bar').classList.add('paid');
      document.getElementById('status-text').textContent = 'Pagamento confirmado!';

      var wrap = document.getElementById('qr-wrap');
      var overlay = document.createElement('div');
      overlay.className = 'check-overlay';
      overlay.textContent = '\u2705';
      wrap.appendChild(overlay);

      var btn = document.getElementById('btn-confirmar');
      btn.textContent = 'Pagamento confirmado!';
      btn.classList.add('paid');

      showToast('Pagamento aprovado! Redirecionando...', 3000);

      setTimeout(function() {
        history.back();
      }, 3000);
    }

    function verifyTransaction() {
      fetch("atualizar_pagamento.php", {
        method: "POST",
        body: formData
      })
      .then(function(res) { return res.json(); })
      .then(function(data) {
        if (data.status === 'success') {
          clearInterval(intervalId);
          markAsPaid();
        }
      })
      .catch(function() {});
    }

    var intervalId = setInterval(verifyTransaction, 5000);

    // Check if already paid
    if ("<?= htmlspecialchars($status) ?>" === "pago") {
      markAsPaid();
    }
  </script>
</body>

</html>
