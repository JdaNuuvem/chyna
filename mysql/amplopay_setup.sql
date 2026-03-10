-- Tabela para credenciais AmploPay
CREATE TABLE IF NOT EXISTS `amplopay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `public_key` varchar(255) NOT NULL,
  `secret_key` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Inserir credenciais AmploPay
INSERT INTO `amplopay` (`id`, `public_key`, `secret_key`, `ativo`)
VALUES (1, 'leonnardodom_fo2uc1v4y5v03lad', 'xpslhe9vxmz9u7qtsxy6wt0mywsua43jst5nn1zjkk2j9qwnidoiobssezzmgu2v', 1)
ON DUPLICATE KEY UPDATE
  public_key = 'leonnardodom_fo2uc1v4y5v03lad',
  secret_key = 'xpslhe9vxmz9u7qtsxy6wt0mywsua43jst5nn1zjkk2j9qwnidoiobssezzmgu2v';

-- Definir AmploPay como gateway padrão
UPDATE config SET gateway_default = 'amplopay' WHERE id = 1;
