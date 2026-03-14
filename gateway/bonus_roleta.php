<?php
/**
 * Bônus da Roleta da Sorte
 * Credita R$150 no primeiro depósito de usuários que giraram a roleta
 */

function creditar_bonus_roleta($user_id)
{
    global $mysqli;

    // Verificar se o usuário tem bonus_roleta = 1 (elegível, aguardando primeiro depósito)
    $stmt = $mysqli->prepare("SELECT bonus_roleta, mobile FROM usuarios WHERE id = ?");
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();

        if ((int)$user['bonus_roleta'] === 1) {
            // Verificar se este é realmente o primeiro depósito pago
            $stmtCount = $mysqli->prepare("SELECT COUNT(*) as total FROM transacoes WHERE usuario = ? AND tipo = 'deposito' AND status = 'pago'");
            $stmtCount->bind_param("i", $user_id);
            $stmtCount->execute();
            $countResult = $stmtCount->get_result();
            $countData = $countResult->fetch_assoc();

            // Se tem exatamente 1 depósito pago (o atual), creditar o bônus
            if ((int)$countData['total'] <= 1) {
                $bonus = 150.00;
                $stmtBonus = $mysqli->prepare("UPDATE usuarios SET saldo = saldo + ?, bonus_roleta = 2 WHERE id = ?");
                $stmtBonus->bind_param("di", $bonus, $user_id);
                $stmtBonus->execute();

                // Log do bônus
                $logFile = $_SERVER['DOCUMENT_ROOT'] . '/logs/bonus_roleta_' . date('Y-m-d') . '.log';
                $logDir = dirname($logFile);
                if (!is_dir($logDir)) { @mkdir($logDir, 0777, true); }
                file_put_contents($logFile, date('Y-m-d H:i:s') . " - BONUS ROLETA CREDITADO | user_id=$user_id | mobile={$user['mobile']} | valor=R$150.00\n", FILE_APPEND);
            }
        }
    }
}
