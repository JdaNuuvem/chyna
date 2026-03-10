<?php include 'partials/html.php' ?>

<?php
#======================================#
ini_set('display_errors', 0);
error_reporting(E_ALL);
#======================================#
session_start();
include_once "services/database.php";
include_once "services/funcao.php";
include_once "services/crud.php";
include_once "services/crud-adm.php";
include_once 'services/checa_login_adm.php';
include_once "services/CSRF_Protect.php";
$csrf = new CSRF_Protect();
#======================================#
checa_login_adm();
#======================================#
if ($_SESSION['data_adm']['status'] != '1') {
    echo "<script>setTimeout(function() { window.location.href = 'bloqueado.php'; }, 0);</script>";
    exit();
}

function get_amplopay_config()
{
    global $mysqli;
    $qry = "SELECT * FROM amplopay WHERE id=1";
    $result = mysqli_query($mysqli, $qry);
    if ($result && mysqli_num_rows($result) > 0) {
        return mysqli_fetch_assoc($result);
    }
    return ['public_key' => '', 'secret_key' => '', 'ativo' => 0];
}

function update_amplopay_config($data)
{
    global $mysqli;
    $qry = $mysqli->prepare("UPDATE amplopay SET public_key = ?, secret_key = ? WHERE id = 1");
    $qry->bind_param("ss", $data['public_key'], $data['secret_key']);
    return $qry->execute();
}

$toastType = null;
$toastMessage = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $data = [
        'public_key' => $_POST['public_key'],
        'secret_key' => $_POST['secret_key'],
    ];

    if (update_amplopay_config($data)) {
        $toastType = 'success';
        $toastMessage = 'Credenciais AmploPay atualizadas com sucesso!';
    } else {
        $toastType = 'error';
        $toastMessage = 'Erro ao atualizar as Credenciais. Tente novamente.';
    }
}

$config = get_amplopay_config();
?>

<head>
    <?php $title = "Configurações AmploPay";
    include 'partials/title-meta.php' ?>
    <link rel="stylesheet" href="assets/libs/jsvectormap/jsvectormap.min.css">
    <?php include 'partials/head-css.php' ?>
</head>

<body>
    <?php include 'partials/topbar.php' ?>
    <?php include 'partials/startbar.php' ?>

    <div class="page-wrapper">
        <div class="page-content">
            <div class="container-xxl">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Gerenciamento de Credenciais (AmploPay)</h4>
                            </div>

                            <div class="card-body">
                                <form method="POST" action="">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="card mb-4">
                                                <div class="card-body">
                                                    <h5 class="card-title"><i class="iconoir-user"></i> Chave Pública (x-public-key)</h5>
                                                    <input type="text" name="public_key" class="form-control"
                                                        value="<?= $config['public_key'] ?>" required>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="card mb-4">
                                                <div class="card-body">
                                                    <h5 class="card-title"><i class="iconoir-group"></i> Chave Privada (x-secret-key)</h5>
                                                    <input type="text" name="secret_key" class="form-control"
                                                        value="<?= $config['secret_key'] ?>" required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="text-center">
                                        <button type="submit" class="btn btn-success">Salvar Configurações</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="toastPlacement" class="toast-container position-fixed bottom-0 end-0 p-3"></div>

    <?php include 'partials/vendorjs.php' ?>
    <script src="assets/js/app.js"></script>

    <script>
        function showToast(type, message) {
            var toastPlacement = document.getElementById('toastPlacement');
            var toast = document.createElement('div');
            toast.className = `toast align-items-center bg-light border-0 fade show`;
            toast.setAttribute('role', 'alert');
            toast.setAttribute('aria-live', 'assertive');
            toast.setAttribute('aria-atomic', 'true');
            toast.innerHTML = `
                <div class="toast-header">
                    <img src="assets/images/logo-sm.png" alt="" height="20" class="me-1">
                    <h5 class="me-auto my-0">AmploPay</h5>
                    <small>Agora</small>
                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body">${message}</div>
            `;
            toastPlacement.appendChild(toast);
            var bootstrapToast = new bootstrap.Toast(toast);
            bootstrapToast.show();
            setTimeout(function () {
                bootstrapToast.hide();
                setTimeout(() => toast.remove(), 500);
            }, 3000);
        }
    </script>

    <?php if ($toastType && $toastMessage): ?>
        <script>
            showToast('<?= $toastType ?>', '<?= $toastMessage ?>');
        </script>
    <?php endif; ?>

</body>
</html>
