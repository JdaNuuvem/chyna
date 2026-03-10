-- Tabela para credenciais AmploPay
CREATE TABLE IF NOT EXISTS `amplopay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `public_key` varchar(255) NOT NULL,
  `secret_key` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Inserir registro padrão (substitua pelas suas credenciais reais)
INSERT INTO `amplopay` (`id`, `public_key`, `secret_key`, `ativo`)
VALUES (1, 'SUA_PUBLIC_KEY_AQUI', 'SUA_SECRET_KEY_AQUI', 1)
ON DUPLICATE KEY UPDATE id=id;

-- Adicionar 'amplopay' como opção de gateway na tabela config
-- Execute este UPDATE para definir AmploPay como gateway padrão:
-- UPDATE config SET gateway_default = 'amplopay' WHERE id = 1;
