-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 12/01/2026 às 20:38
-- Versão do servidor: 11.8.3-MariaDB-log
-- Versão do PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `u771498091_ownerbbb26`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `nome` text NOT NULL,
  `email` text NOT NULL,
  `contato` text DEFAULT NULL,
  `senha` text NOT NULL,
  `nivel` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `token_recover` text DEFAULT NULL,
  `avatar` text DEFAULT NULL,
  `2fa` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `admin_users`
--

INSERT INTO `admin_users` (`id`, `nome`, `email`, `contato`, `senha`, `nivel`, `status`, `token_recover`, `avatar`, `2fa`) VALUES
(1, 'Gustavo Tolentino', 'gustavotolentino321@gmail.com', '62991301856', '$2a$12$8Iuf6yQzbo/fwvS0W3hZluTIneAnr8erIgv/Z//BTLQ93INX63BeC', 1, 1, NULL, 'avatar-131677188367.png', NULL),
(5, 'Daniel Junior', 'daniel@bigbrotherpg', '62991301856', '$2a$12$8Iuf6yQzbo/fwvS0W3hZluTIneAnr8erIgv/Z//BTLQ93INX63BeC', 1, 1, NULL, 'avatar-131677188367.png', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `afiliados_config`
--

CREATE TABLE `afiliados_config` (
  `id` int(11) NOT NULL,
  `cpaLvl1` decimal(10,2) DEFAULT NULL,
  `cpaLvl2` decimal(10,2) DEFAULT NULL,
  `cpaLvl3` decimal(10,2) DEFAULT NULL,
  `chanceCpa` decimal(5,2) DEFAULT NULL,
  `revShareFalso` decimal(5,2) DEFAULT NULL,
  `revShareLvl1` decimal(5,2) DEFAULT NULL,
  `revShareLvl2` decimal(5,2) DEFAULT NULL,
  `revShareLvl3` decimal(5,2) DEFAULT NULL,
  `minDepForCpa` decimal(10,2) DEFAULT NULL,
  `minResgate` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `afiliados_config`
--

INSERT INTO `afiliados_config` (`id`, `cpaLvl1`, `cpaLvl2`, `cpaLvl3`, `chanceCpa`, `revShareFalso`, `revShareLvl1`, `revShareLvl2`, `revShareLvl3`, `minDepForCpa`, `minResgate`) VALUES
(1, 30.00, 25.00, 50.00, 80.00, 0.00, 50.00, 10.00, 5.00, 25.00, 20.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `afiliado_baus`
--

CREATE TABLE `afiliado_baus` (
  `id` int(11) NOT NULL,
  `afiliados` int(11) NOT NULL,
  `valor` float NOT NULL,
  `id_user` int(11) NOT NULL,
  `mem_count` int(11) NOT NULL,
  `status` enum('gerado','disponivel','aberto') NOT NULL DEFAULT 'gerado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `afiliado_baus`
--

INSERT INTO `afiliado_baus` (`id`, `afiliados`, `valor`, `id_user`, `mem_count`, `status`) VALUES
(8961, 1, 20, 448, 1, 'gerado'),
(8962, 1, 20, 448, 2, 'gerado'),
(8963, 1, 20, 448, 3, 'gerado'),
(8964, 1, 20, 448, 4, 'gerado'),
(8965, 1, 20, 448, 5, 'gerado'),
(8966, 1, 20, 448, 6, 'gerado'),
(8967, 1, 35, 448, 7, 'gerado'),
(8968, 1, 35, 448, 8, 'gerado'),
(8969, 1, 35, 448, 9, 'gerado'),
(8970, 1, 35, 448, 10, 'gerado'),
(8971, 1, 35, 448, 11, 'gerado'),
(8972, 1, 40, 448, 12, 'gerado'),
(8973, 1, 40, 448, 13, 'gerado'),
(8974, 1, 40, 448, 14, 'gerado'),
(8975, 1, 40, 448, 15, 'gerado'),
(8976, 1, 40, 448, 16, 'gerado'),
(8977, 1, 50, 448, 17, 'gerado'),
(8978, 1, 50, 448, 18, 'gerado'),
(8979, 1, 50, 448, 19, 'gerado'),
(8980, 1, 50, 448, 20, 'gerado'),
(8981, 1, 20, 449, 1, 'gerado'),
(8982, 1, 20, 449, 2, 'gerado'),
(8983, 1, 20, 449, 3, 'gerado'),
(8984, 1, 20, 449, 4, 'gerado'),
(8985, 1, 20, 449, 5, 'gerado'),
(8986, 1, 20, 449, 6, 'gerado'),
(8987, 1, 35, 449, 7, 'gerado'),
(8988, 1, 35, 449, 8, 'gerado'),
(8989, 1, 35, 449, 9, 'gerado'),
(8990, 1, 35, 449, 10, 'gerado'),
(8991, 1, 35, 449, 11, 'gerado'),
(8992, 1, 40, 449, 12, 'gerado'),
(8993, 1, 40, 449, 13, 'gerado'),
(8994, 1, 40, 449, 14, 'gerado'),
(8995, 1, 40, 449, 15, 'gerado'),
(8996, 1, 40, 449, 16, 'gerado'),
(8997, 1, 50, 449, 17, 'gerado'),
(8998, 1, 50, 449, 18, 'gerado'),
(8999, 1, 50, 449, 19, 'gerado'),
(9000, 1, 50, 449, 20, 'gerado'),
(9001, 1, 20, 450, 1, 'gerado'),
(9002, 1, 20, 450, 2, 'gerado'),
(9003, 1, 20, 450, 3, 'gerado'),
(9004, 1, 20, 450, 4, 'gerado'),
(9005, 1, 20, 450, 5, 'gerado'),
(9006, 1, 20, 450, 6, 'gerado'),
(9007, 1, 35, 450, 7, 'gerado'),
(9008, 1, 35, 450, 8, 'gerado'),
(9009, 1, 35, 450, 9, 'gerado'),
(9010, 1, 35, 450, 10, 'gerado'),
(9011, 1, 35, 450, 11, 'gerado'),
(9012, 1, 40, 450, 12, 'gerado'),
(9013, 1, 40, 450, 13, 'gerado'),
(9014, 1, 40, 450, 14, 'gerado'),
(9015, 1, 40, 450, 15, 'gerado'),
(9016, 1, 40, 450, 16, 'gerado'),
(9017, 1, 50, 450, 17, 'gerado'),
(9018, 1, 50, 450, 18, 'gerado'),
(9019, 1, 50, 450, 19, 'gerado'),
(9020, 1, 50, 450, 20, 'gerado');

-- --------------------------------------------------------

--
-- Estrutura para tabela `api12`
--

CREATE TABLE `api12` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `agent_code` varchar(255) DEFAULT NULL,
  `agent_secret` varchar(255) DEFAULT NULL,
  `agent_token` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `api12`
--

INSERT INTO `api12` (`id`, `url`, `agent_code`, `agent_secret`, `agent_token`, `ativo`) VALUES
(1, 'https://api.hypebet.shop/', 'betfacil', '2b09252e-2afc-4794-8489-4fb71e831295', '44443d45-cf6b-43ab-9aa5-ac6985234ba7', 0),
(1, 'https://api.hypebet.shop/', 'betfacil', '2b09252e-2afc-4794-8489-4fb71e831295', '44443d45-cf6b-43ab-9aa5-ac6985234ba7', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `api16`
--

CREATE TABLE `api16` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `agent_code` varchar(255) DEFAULT NULL,
  `agent_secret` varchar(255) DEFAULT NULL,
  `agent_token` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `api16`
--

INSERT INTO `api16` (`id`, `url`, `agent_code`, `agent_secret`, `agent_token`, `ativo`) VALUES
(1, 'https://api.ultragames.online', 'testa159', '54a75f64-d2bb-4834-a327-bfd569623196', '85ba9d9e-463b-48ef-93ca-c2434eda2376', 1),
(1, 'https://api.ultragames.online', 'testa159', '54a75f64-d2bb-4834-a327-bfd569623196', '85ba9d9e-463b-48ef-93ca-c2434eda2376', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `api38`
--

CREATE TABLE `api38` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `agent_code` varchar(255) DEFAULT NULL,
  `agent_secret` varchar(255) DEFAULT NULL,
  `agent_token` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `api38`
--

INSERT INTO `api38` (`id`, `url`, `agent_code`, `agent_secret`, `agent_token`, `ativo`) VALUES
(1, 'https://api.articogiro777.site', 'admin', 'e177c4ee-cf29-43b1-9e02-b7dc503051fd', '5f2dbdcb-a59d-42f8-9815-cb34a9723cd9', 1),
(1, 'https://api.articogiro777.site', 'admin', 'e177c4ee-cf29-43b1-9e02-b7dc503051fd', '5f2dbdcb-a59d-42f8-9815-cb34a9723cd9', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `img` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `banner`
--

INSERT INTO `banner` (`id`, `titulo`, `criado_em`, `img`, `status`) VALUES
(1, 'Banner 1', '2024-06-28 21:10:47', 'banner1.png.webp', 1),
(2, 'Banner 2', '2024-06-28 21:08:02', 'banner2.png.webp', 1),
(3, 'Banner 3', '2024-06-28 21:08:02', 'banner3.png.webp', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `bau`
--

CREATE TABLE `bau` (
  `id` int(11) NOT NULL,
  `num` text DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `is_get` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `nome_site` text DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `grupoplataforma` varchar(255) DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `avatar` text DEFAULT NULL,
  `telegram` text DEFAULT NULL,
  `instagram` text DEFAULT NULL,
  `whatsapp` text DEFAULT NULL,
  `suporte` text DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `sublogo` text DEFAULT NULL,
  `facebookads` text DEFAULT NULL,
  `rodapelogo` text DEFAULT NULL,
  `favicon` text DEFAULT NULL,
  `googleAnalytics` text DEFAULT NULL,
  `minplay` int(11) DEFAULT NULL,
  `minsaque` double DEFAULT NULL,
  `maxsaque` int(11) DEFAULT 1000,
  `saque_automatico` int(11) NOT NULL,
  `rollover` int(11) DEFAULT NULL,
  `mindep` text DEFAULT NULL,
  `jackpot` int(11) DEFAULT NULL,
  `numero_jackpot` int(11) DEFAULT NULL,
  `jackpot_custom` text DEFAULT NULL,
  `cor_padrao` varchar(45) NOT NULL,
  `background_padrao` varchar(50) DEFAULT NULL,
  `custom_css` longtext NOT NULL,
  `texto` varchar(45) NOT NULL,
  `img_seo` text DEFAULT NULL,
  `keyword` text DEFAULT NULL,
  `marquee` text DEFAULT NULL,
  `status_topheader` int(11) NOT NULL DEFAULT 0,
  `cor_topheader` varchar(48) DEFAULT '#ed1c24',
  `niveisbau` text DEFAULT NULL,
  `qntsbaus` int(11) DEFAULT NULL,
  `nvlbau` int(11) DEFAULT NULL,
  `pessoasbau` varchar(500) DEFAULT '1,2,3,4,5,6,7,8,9,10,15,20,25,30,35,40,45,50,55',
  `valoresbau` varchar(500) NOT NULL DEFAULT '10,10,10,10,20,20,20,20,30,30,30,30,40,40,40,40,50,50,50,50,100,100,100,100,200,200,200,200,500,500,500,500',
  `depositosbau` float NOT NULL DEFAULT 20,
  `apostasbau` float NOT NULL DEFAULT 20,
  `tema` int(11) DEFAULT NULL,
  `versao_app_android` text DEFAULT NULL,
  `versao_app_ios` text DEFAULT NULL,
  `mensagem_app` text DEFAULT NULL,
  `link_app_android` text DEFAULT NULL,
  `link_app_ios` text DEFAULT NULL,
  `broadcast` text DEFAULT NULL,
  `limite_saque` int(11) DEFAULT 0,
  `gateway_default` varchar(255) NOT NULL DEFAULT 'pixup',
  `popup_download` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `config`
--

INSERT INTO `config` (`id`, `nome`, `nome_site`, `descricao`, `grupoplataforma`, `logo`, `avatar`, `telegram`, `instagram`, `whatsapp`, `suporte`, `email`, `sublogo`, `facebookads`, `rodapelogo`, `favicon`, `googleAnalytics`, `minplay`, `minsaque`, `maxsaque`, `saque_automatico`, `rollover`, `mindep`, `jackpot`, `numero_jackpot`, `jackpot_custom`, `cor_padrao`, `background_padrao`, `custom_css`, `texto`, `img_seo`, `keyword`, `marquee`, `status_topheader`, `cor_topheader`, `niveisbau`, `qntsbaus`, `nvlbau`, `pessoasbau`, `valoresbau`, `depositosbau`, `apostasbau`, `tema`, `versao_app_android`, `versao_app_ios`, `mensagem_app`, `link_app_android`, `link_app_ios`, `broadcast`, `limite_saque`, `gateway_default`, `popup_download`) VALUES
(1, 'BIGBROTHERPG', 'BIGBROTHERPG', 'BIGBROTHERPG', 'W1', 'logo.webp', NULL, '', '', '', NULL, '', '', 'PIXEL AQUI', NULL, 'favicon.webp', 'PIXEL AQUI', 1, 20, 50000, 0, 2, '20,15,30,40,50,60,70,90,100', 5, 1, NULL, '#0096DD', '#010e24', '', '', '154504365733.png', 'Cassino, plataforma chinesa, casa pagante', 'Entre no canal do Telegram Baixe o app oficial: bigbrotherpg.site  Bônus de primeiro depósito para novos usuários: até R$ 3.777 Bônus por convite: R$ 10 por pessoa indicada Comissão de até 2%  Horários do envelope da chuva: 08h, 15h, 20h e 22h  Passo a passo: Acesse ? Eventos / Promoções ? Indique um amigo ? Receba e saque  Convide amigos, compartilhe e ganhe dinheiro todos os dias.', 0, '#0096dd', '10,10,10,10,20,20,20,20,30,30,30,30,40,40,40,40,50,50,50,50,100,100,100,100,200,200,200,200,500,500,500,500', 500, 5, '1,2,3,4,5,6,7,8,9,10,15,20,25,30,35,40,45,50,55,60,65,70', '20,20,20,20,20,20,35,35,35,35,35,40,40,40,40,40,50,50,50,50', 10, 50, 21, '5.8.8.1', '5.8.8.1', 'SAMBA  INDISPONIVEL', '#', '#', 'SWEET7', 20, 'amplopay', 'BIGBROTHERPG');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cupom`
--

CREATE TABLE `cupom` (
  `id` int(11) NOT NULL,
  `nome` text NOT NULL,
  `tipo` int(11) NOT NULL DEFAULT 1 COMMENT '1: recarga / 2:saldo',
  `valor` int(11) NOT NULL,
  `qtd` int(11) NOT NULL DEFAULT 0,
  `qtd_insert` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cupom`
--

INSERT INTO `cupom` (`id`, `nome`, `tipo`, `valor`, `qtd`, `qtd_insert`, `status`) VALUES
(1, 'VIP150', 1, 150, 0, 100, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cupom_usados`
--

CREATE TABLE `cupom_usados` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_cupom` int(11) NOT NULL,
  `valor` int(11) NOT NULL DEFAULT 0,
  `data_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `digitopay`
--

CREATE TABLE `digitopay` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `client_id` text DEFAULT NULL,
  `client_secret` text DEFAULT NULL,
  `atualizado` varchar(45) DEFAULT NULL,
  `ativo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `digitopay`
--

INSERT INTO `digitopay` (`id`, `url`, `client_id`, `client_secret`, `atualizado`, `ativo`) VALUES
(1, 'http://api.edbanking.com.br/', 'franklin017_684cae125dd53', 'aedd39018242e5163b637ebe64451a35615c3ad33b37b49a8faaedeb0322840e', NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `financeiro`
--

CREATE TABLE `financeiro` (
  `id` int(11) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `saldo` decimal(10,2) DEFAULT NULL,
  `bonus` decimal(10,2) DEFAULT NULL,
  `saldo_afiliados` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fiverscan`
--

CREATE TABLE `fiverscan` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `agent_code` text DEFAULT NULL,
  `agent_token` text DEFAULT NULL,
  `ativo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `fiverscan`
--

INSERT INTO `fiverscan` (`id`, `url`, `agent_code`, `agent_token`, `ativo`) VALUES
(1, 'https://api.payigaming.com.br', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `floats`
--

CREATE TABLE `floats` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `img` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `floats`
--

INSERT INTO `floats` (`id`, `titulo`, `criado_em`, `img`, `status`) VALUES
(1, 'Float 1', '2024-06-28 21:10:47', 'float1.png', 0),
(2, 'Float 2', '2024-06-28 21:08:02', 'float2.gif', 0),
(3, 'Float 3', '2024-06-28 21:08:02', 'float3.gif', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `games`
--

CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `game_code` text NOT NULL,
  `game_name` text NOT NULL,
  `banner` text DEFAULT NULL,
  `status` int(11) NOT NULL,
  `provider` text DEFAULT NULL,
  `popular` int(11) NOT NULL DEFAULT 0,
  `type` text DEFAULT NULL,
  `game_type` int(11) DEFAULT NULL,
  `distribution` varchar(255) NOT NULL DEFAULT 'apipg16',
  `ordem` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `games`
--

INSERT INTO `games` (`id`, `game_code`, `game_name`, `banner`, `status`, `provider`, `popular`, `type`, `game_type`, `distribution`, `ordem`) VALUES
(1, '126', 'Fortune Tiger', '/PlayFiver/Pgsoft/01.png', 1, '26595015200313', 1, 'slot', 0, 'apipg16', 1),
(2, '69', 'Bikine', '/PlayFiver/Pgsoft/69.png', 1, '26595015200313', 1, 'slot', 0, 'apipg16', 1),
(3, '68', 'Fortune Mouse', '/PlayFiver/Pgsoft/05.png', 1, '26595015200313', 1, 'slot', 0, 'apipg16', 1),
(4, '1543462', 'Fortune Rabbit', '/PlayFiver/Pgsoft/02.png', 1, '26595015200313', 1, 'slot', 0, 'apipg16', 1),
(5, '98', 'Fortune Ox', '/PlayFiver/Pgsoft/03.png', 1, '26595015200313', 1, 'slot', 0, 'apipg16', 1),
(6, '1879752', 'Fortune Snake	', '/PlayFiver/Pgsoft/07.png', 0, '26595015200313', 0, 'slot', 0, 'apipp38', 0),
(7, '1695365', 'Fortune Dragon', '/PlayFiver/Pgsoft/04.png', 1, '26595015200313', 1, 'slot', 0, 'apipg16', 1),
(8, '1682240', 'Cash Mania', '/PlayFiver/Pgsoft/1682240.png', 1, '26595015200313', 1, 'slot', 0, 'apipg16', 1),
(9, '42', 'Ganesha Gold', '/PlayFiver/Pgsoft/06.png', 1, '26595015200313', 1, 'slot', 0, 'apipg16', 1),
(10, '40', 'Jungle Delight', '/PlayFiver/Pgsoft/40.jpg', 1, '26595015200313', 1, 'slot', 0, 'apipg16', 1),
(11, '104', 'Wild Bandito', '/PlayFiver/Pgsoft/104.png', 1, '26595015200313', 1, 'slot', 0, 'apipg16', 1),
(12, '63', 'Dragon Tiger Luck', '/PlayFiver/Pgsoft/63.png', 1, '26595015200313', 1, 'slot', 0, 'apipg16', 1),
(13, 'piggy-gold', 'Piggy Gold', '/PlayFiver/Pgsoft/piggy-gold.png', 1, NULL, 0, 'slot', 0, 'apipg16', 0),
(14, '48', 'Double Fortune', '/PlayFiver/Pgsoft/double-fortune.png', 1, '26595015200313', 1, 'slot', 0, 'apipg16', 1),
(15, 'the-great-icescape', 'The Great Icescape', '/PlayFiver/Pgsoft/the-great-icescape.png', 0, NULL, 0, 'slot', 0, 'apipp38', 0),
(16, 'captains-bounty', 'Captain\'s Bounty', '/PlayFiver/Pgsoft/captains-bounty.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(17, '1451122', 'Dragon Hatch 2', '/PlayFiver/Pgsoft/dragon-hatch2.png', 0, NULL, 0, 'slot', 0, 'apipg16', 0),
(18, 'vampires-charm', 'Vampire\'s Charm', '/PlayFiver/Pgsoft/vampires-charm.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(19, 'gem-saviour-conquest', 'Gem Saviour Conquest', '/PlayFiver/Pgsoft/gem-saviour-conquest.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(20, 'mahjong-ways', 'Mahjong Ways', '/PlayFiver/Pgsoft/mahjong-ways.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(21, 'candy-burst', 'Candy Burst', '/PlayFiver/Pgsoft/candy-burst.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(22, 'mahjong-ways2', 'Mahjong Ways 2', '/PlayFiver/Pgsoft/mahjong-ways2.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(23, 'ganesha-fortune', 'Ganesha Fortune', '/PlayFiver/Pgsoft/ganesha-fortune.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(24, 'phoenix-rises', 'Phoenix Rises', '/PlayFiver/Pgsoft/phoenix-rises.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(25, 'wild-fireworks', 'Wild Fireworks', '/PlayFiver/Pgsoft/wild-fireworks.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(26, 'galactic-gems', 'Galactic Gems', '/PlayFiver/Pgsoft/galactic-gems.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(27, '87', 'Treasures of Aztec', '/PlayFiver/Pgsoft/treasures-aztec.png', 1, '26595015200313', 1, 'slot', 0, 'apipg16', 1),
(28, 'jewels-prosper', 'Jewels of Prosperity', '/PlayFiver/Pgsoft/jewels-prosper.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(29, 'gdn-ice-fire', 'Guardians of Ice and Fire', '/PlayFiver/Pgsoft/gdn-ice-fire.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(30, 'bali-vacation', 'Bali Vacation', '/PlayFiver/Pgsoft/bali-vacation.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(31, 'majestic-ts', 'Majestic Treasures', '/PlayFiver/Pgsoft/majestic-ts.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(32, 'jack-frosts', 'Jack Frost\'s Winter', '/PlayFiver/Pgsoft/jack-frosts.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(33, 'candy-bonanza', 'Candy Bonanza', '/PlayFiver/Pgsoft/candy-bonanza.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(34, 'heist-stakes', 'Heist Stakes', '/PlayFiver/Pgsoft/heist-stakes.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(35, 'lgd-monkey-kg', 'Legendary Monkey King', '/PlayFiver/Pgsoft/lgd-monkey-kg.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(36, 'buffalo-win', 'Buffalo Win', '/PlayFiver/Pgsoft/buffalo-win.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(37, 'crypt-fortune', 'Raider Jane\'s Crypt of Fortune', '/PlayFiver/Pgsoft/crypt-fortune.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(38, 'emoji-riches', 'Emoji Riches', '/PlayFiver/Pgsoft/emoji-riches.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(39, 'sprmkt-spree', 'Supermarket Spree', '/PlayFiver/Pgsoft/sprmkt-spree.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(40, 'spirit-wonder', 'Spirited Wonders', '/PlayFiver/Pgsoft/spirit-wonder.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(41, 'dest-sun-moon', 'Destiny of Sun & Moon', '/PlayFiver/Pgsoft/dest-sun-moon.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(42, 'garuda-gems', 'Garuda Gems', '/PlayFiver/Pgsoft/garuda-gems.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(43, 'rooster-rbl', 'Rooster Rumble', '/PlayFiver/Pgsoft/rooster-rbl.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(44, 'battleground', 'Battleground Royale', '/PlayFiver/Pgsoft/battleground.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(45, '125', 'Butterfly Blossom', '/PlayFiver/Pgsoft/btrfly-blossom.png', 1, '26595015200313', 1, 'slot', 0, 'apipg16', 1),
(46, 'prosper-ftree', 'Prosperity Fortune Tree', '/PlayFiver/Pgsoft/prosper-ftree.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(47, 'asgardian-rs', 'Asgardian Rising', '/PlayFiver/Pgsoft/asgardian-rs.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(48, 'alchemy-gold', 'Alchemy Gold', '/PlayFiver/Pgsoft/alchemy-gold.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(49, 'diner-delights', 'Diner Delights', '/PlayFiver/Pgsoft/diner-delights.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(50, 'midas-fortune', 'Midas Fortune', '/PlayFiver/Pgsoft/midas-fortune.png', 0, NULL, 0, 'slot', 0, 'apipp38', 0),
(51, 'bakery-bonanza', 'Bakery Bonanza', '/PlayFiver/Pgsoft/bakery-bonanza.png', 0, NULL, 0, 'slot', 0, 'apipp38', 0),
(52, 'songkran-spl', 'Songkran Splash', '/PlayFiver/Pgsoft/songkran-spl.png', 0, NULL, 0, 'slot', 0, 'apipp38', 0),
(53, 'dragon-hatch2', 'Dragon Hatch2', '/PlayFiver/Pgsoft/dragon-hatch2.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(54, 'cruise-royale', 'Cruise Royale', '/PlayFiver/Pgsoft/cruise-royale.png', 1, '26595015200313', 1, 'slot', 0, 'apipg16', 1),
(56, 'spr-golf-drive', 'Super Golf Drive', '/PlayFiver/Pgsoft/spr-golf-drive.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(57, 'anubis-wrath', 'Anubis Wrath', '/PlayFiver/Pgsoft/anubis-wrath.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(58, 'zombie-outbrk', 'Zombie Outbreak', '/PlayFiver/Pgsoft/zombie-outbrk.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(59, '1508783', 'Wild Ape 3258', '/PlayFiver/Pgsoft/1508783.png', 1, '26595015200313', 1, 'slot', 0, 'apipg16', 1),
(60, 'vswaysbook', 'Book of Golden Sands', '/PlayFiver/Pragmatic/vswaysbook.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(61, 'vs20mparty', 'Wild Hop and Drop', '/PlayFiver/Pragmatic/vs20mparty.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(62, 'vs10snakeeyes', 'Snakes e Ladders - Snake Eyes', '/PlayFiver/Pragmatic/vs10snakeeyes.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(63, 'vs5strh', 'Striking Hot 5', '/PlayFiver/Pragmatic/vs5strh.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 1),
(64, 'vswayslofhero', 'Legend of Heroes', '/PlayFiver/Pragmatic/vswayslofhero.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(65, 'vs20muertos', 'Muertos Multiplier Megaways', '/PlayFiver/Pragmatic/vs20muertos.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(66, 'vs10crownfire', 'Crown of Fire', '/PlayFiver/Pragmatic/vs10crownfire.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(67, 'vswaysstrwild', 'Candy Stars', '/PlayFiver/Pragmatic/vswaysstrwild.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(68, 'vs20trswild2', 'Black Bull', '/PlayFiver/Pragmatic/vs20trswild2.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(69, 'vswaysfltdrg', 'Floating Dragon Hold e Spin Megaways', '/PlayFiver/Pragmatic/vswaysfltdrg.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(70, 'vs10mmm', 'Magic Money Maze', '/PlayFiver/Pragmatic/vs10mmm.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(71, 'vs20underground', 'Down the Rails', '/PlayFiver/Pragmatic/vs20underground.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(72, 'vs20wolfie', 'Greedy Wolf', '/PlayFiver/Pragmatic/vs20wolfie.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(73, 'vs5firehot', 'Fire Hot 5', '/PlayFiver/Pragmatic/vs5firehot.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(74, 'vs40firehot', 'Fire Hot 40', '/PlayFiver/Pragmatic/vs40firehot.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(75, 'vs20fh', 'Fire Hot 20', '/PlayFiver/Pragmatic/vs20fh.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(76, 'vs100firehot', 'Fire Hot 100', '/PlayFiver/Pragmatic/vs100firehot.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(77, 'vs10txbigbass', 'Big Bass Splash', '/PlayFiver/Pragmatic/vs10txbigbass.png', 1, '26595015200310', 0, 'fish', 0, 'apipp38', 0),
(78, 'vs20octobeer', 'Octobeer Fortunes', '/PlayFiver/Pragmatic/vs20octobeer.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(79, 'vs40hotburnx', 'Hot To Burn Extreme', '/PlayFiver/Pragmatic/vs40hotburnx.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(80, 'vs243ckemp', 'Cheeky Emperor', '/PlayFiver/Pragmatic/vs243ckemp.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(81, 'vswaysjkrdrop', 'Tropical Tiki', '/PlayFiver/Pragmatic/vswaysjkrdrop.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(82, 'vs5sh', 'Shining Hot 5', '/PlayFiver/Pragmatic/vs5sh.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(83, 'vs40sh', 'Shining Hot 40', '/PlayFiver/Pragmatic/vs40sh.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(84, 'vs20sh', 'Shining Hot 20', '/PlayFiver/Pragmatic/vs20sh.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(85, 'vs10coffee', 'Coffee Wild', '/PlayFiver/Pragmatic/vs10coffee.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(86, 'vs100sh', 'Shining Hot 100', '/PlayFiver/Pragmatic/vs100sh.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(87, 'vs10egrich', 'Queen of Gods', '/PlayFiver/Pragmatic/vs10egrich.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(88, 'vs243koipond', 'Koi Pond', '/PlayFiver/Pragmatic/vs243koipond.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(89, 'vs40samurai3', 'Rise of Samurai 3', '/PlayFiver/Pragmatic/vs40samurai3.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(90, 'vs40cosmiccash', 'Cosmic Cash', '/PlayFiver/Pragmatic/vs40cosmiccash.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(91, 'vs25bomb', 'Bomb Bonanza', '/PlayFiver/Pragmatic/vs25bomb.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(92, 'vs1024mahjpanda', 'Mahjong Panda', '/PlayFiver/Pragmatic/vs1024mahjpanda.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(93, 'vs10spiritadv', 'Spirit of Adventure', '/PlayFiver/Pragmatic/vs10spiritadv.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(94, 'vs10firestrike2', 'Fire Strike 2', '/PlayFiver/Pragmatic/vs10firestrike2.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(95, 'vs40cleoeye', 'Eye of Cleopatra', '/PlayFiver/Pragmatic/vs40cleoeye.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(96, 'vs20gobnudge', 'Goblin Heist Powernudge', '/PlayFiver/Pragmatic/vs20gobnudge.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(97, 'vs20stickysymbol', 'The Great Stick-up', '/PlayFiver/Pragmatic/vs20stickysymbol.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(98, 'vswayszombcarn', 'Zombie Carnival', '/PlayFiver/Pragmatic/vswayszombcarn.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(99, 'vs50northgard', 'North Guardians', '/PlayFiver/Pragmatic/vs50northgard.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(100, 'vs20sugarrush', 'Sugar Rush', '/PlayFiver/Pragmatic/vs20sugarrush.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(101, 'vs20cleocatra', 'Cleocatra', '/PlayFiver/Pragmatic/vs20cleocatra.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 1),
(102, 'vs5littlegem', 'Little Gem Hold and Spin', '/PlayFiver/Pragmatic/vs5littlegem.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(103, 'vs20drtgold', 'Drill That Gold', '/PlayFiver/Pragmatic/vs20drtgold.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(104, 'vs20mustanggld2', 'Clover Gold', '/PlayFiver/Pragmatic/vs20mustanggld2.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(105, 'vs10chkchase', 'Chicken Chase', '/PlayFiver/Pragmatic/vs10chkchase.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(106, 'vswayswildwest', 'Wild West Gold Megaways', '/PlayFiver/Pragmatic/vswayswildwest.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(107, 'vs10bookazteck', 'Book of Aztec King', '/PlayFiver/Pragmatic/vs10bookazteck.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(108, 'vs50mightra', 'Might of Ra', '/PlayFiver/Pragmatic/vs50mightra.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(109, 'vs25bullfiesta', 'Bull Fiesta', '/PlayFiver/Pragmatic/vs25bullfiesta.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(110, 'vs20rainbowg', 'Rainbow Gold', '/PlayFiver/Pragmatic/vs20rainbowg.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(111, 'vs10tictac', 'Tic Tac Take', '/PlayFiver/Pragmatic/vs10tictac.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(112, 'vs243discolady', 'Disco Lady', '/PlayFiver/Pragmatic/vs243discolady.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(113, 'vs243queenie', 'Queenie', '/PlayFiver/Pragmatic/vs243queenie.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(114, 'vs20farmfest', 'Barn Festival', '/PlayFiver/Pragmatic/vs20farmfest.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(115, 'vs20bchprty', 'Wild Beach Party', '/PlayFiver/Pragmatic/vs20bchprty.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(116, 'vs20ultim5', 'The Ultimate 5', '/PlayFiver/Pragmatic/vs20ultim5.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(117, 'vs25copsrobbers', 'Cash Patrol', '/PlayFiver/Pragmatic/vs25copsrobbers.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(118, 'vs20colcashzone', 'Colossal Cash Zone', '/PlayFiver/Pragmatic/vs20colcashzone.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(119, 'vs20rockvegas', 'Rock Vegas Mega Hold e Spin', '/PlayFiver/Pragmatic/vs20rockvegas.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(120, 'vs20superx', 'Super X(tm)', '/PlayFiver/Pragmatic/vs20superx.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(121, 'vswayscryscav', 'Crystal Caverns Megaways(tm)', '/PlayFiver/Pragmatic/vswayscryscav.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(122, 'vs20smugcove', 'Smugglers Cove(tm)', '/PlayFiver/Pragmatic/vs20smugcove.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(123, 'vs4096magician', 'Magician s Secrets(tm)', '/PlayFiver/Pragmatic/vs4096magician.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(124, 'vs40wanderw', 'Wild Depths(tm)', '/PlayFiver/Pragmatic/vs40wanderw.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(125, 'vswaysxjuicy', 'Extra Juicy Megaways(tm)', '/PlayFiver/Pragmatic/vswaysxjuicy.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(126, 'vs25goldparty', 'Gold Party(r)', '/PlayFiver/Pragmatic/vs25goldparty.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(127, 'vs10runes', 'Gates of Valhalla(tm)', '/PlayFiver/Pragmatic/vs10runes.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(128, 'vs20amuleteg', 'Fortune of Giza(tm)', '/PlayFiver/Pragmatic/vs20amuleteg.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(129, 'vs25tigeryear', 'New Year Tiger Treasures (tm)', '/PlayFiver/Pragmatic/vs25tigeryear.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(130, 'vs243empcaishen', 'Emperor Caishen', '/PlayFiver/Pragmatic/vs243empcaishen.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(131, 'vs20pbonanza', 'Pyramid Bonanza', '/PlayFiver/Pragmatic/vs20pbonanza.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(132, 'vs20trsbox', 'Treasure Wild', '/PlayFiver/Pragmatic/vs20trsbox.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(133, 'vs243chargebull', 'Raging Bull', '/PlayFiver/Pragmatic/vs243chargebull.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(134, 'vswaysbankbonz', 'Cash Bonanza', '/PlayFiver/Pragmatic/vswaysbankbonz.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(135, 'vs576hokkwolf', 'Hokkaido Wolf', '/PlayFiver/Pragmatic/vs576hokkwolf.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(136, 'vs20phoenixf', 'Phoenix Forge', '/PlayFiver/Pragmatic/vs20phoenixf.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(137, 'vswaysaztecking', 'Aztec King Megaways', '/PlayFiver/Pragmatic/vswaysaztecking.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(138, 'vs10luckcharm', 'Lucky Grace And Charm', '/PlayFiver/Pragmatic/vs10luckcharm.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(139, 'vswayselements', 'Elemental Gems Megaways', '/PlayFiver/Pragmatic/vswayselements.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(140, 'vswayschilheat', 'Chilli Heat Megaways', '/PlayFiver/Pragmatic/vswayschilheat.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(141, 'vs20magicpot', 'The Magic Cauldron - Enchanted Brew', '/PlayFiver/Pragmatic/vs20magicpot.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(142, 'vs10amm', 'The Amazing Money Machine', '/PlayFiver/Pragmatic/vs10amm.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(143, 'vs117649starz', 'Starz Megaways', '/PlayFiver/Pragmatic/vs117649starz.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(144, 'vs10wildtut', 'Mysterious Egypt', '/PlayFiver/Pragmatic/vs10wildtut.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(145, 'vs10eyestorm', 'Eye of the Storm', '/PlayFiver/Pragmatic/vs10eyestorm.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(146, 'vs25gldox', 'Golden Ox', '/PlayFiver/Pragmatic/vs25gldox.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(147, 'vs40voodoo', 'Voodoo Magic', '/PlayFiver/Pragmatic/vs40voodoo.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(148, 'vs20bonzgold', 'Bonanza Gold', '/PlayFiver/Pragmatic/vs20bonzgold.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(149, 'vs10mayangods', 'John Hunter and the Mayan Gods', '/PlayFiver/Pragmatic/vs10mayangods.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(150, 'vs1024dtiger', 'The Dragon Tiger', '/PlayFiver/Pragmatic/vs1024dtiger.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(151, 'vs20xmascarol', 'Christmas Carol Megaways', '/PlayFiver/Pragmatic/vs20xmascarol.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(152, 'vs10goldfish', 'Fishin Reels', '/PlayFiver/Pragmatic/vs10goldfish.png', 1, NULL, 0, 'fish', 0, 'apipp38', 0),
(153, 'vs25bkofkngdm', 'Book of Kingdoms', '/PlayFiver/Pragmatic/vs25bkofkngdm.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(154, 'vs20goldfever', 'Gems Bonanza', '/PlayFiver/Pragmatic/vs20goldfever.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(155, 'vs25walker', 'Wild Walker', '/PlayFiver/Pragmatic/vs25walker.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(156, 'vs25samurai', 'Rise of Samurai', '/PlayFiver/Pragmatic/vs25samurai.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(157, 'vswayshive', 'Star Bounty', '/PlayFiver/Pragmatic/vswayshive.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(158, 'vswayswerewolf', 'Curse of the Werewolf Megaways', '/PlayFiver/Pragmatic/vswayswerewolf.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(159, 'vs9aztecgemsdx', 'Aztec Gems Deluxe', '/PlayFiver/Pragmatic/vs9aztecgemsdx.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(160, 'vs20gorilla', 'Jungle Gorilla', '/PlayFiver/Pragmatic/vs20gorilla.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(161, 'vs40streetracer', 'Street Racer', '/PlayFiver/Pragmatic/vs40streetracer.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(162, 'vs1fufufu', 'Fu Fu Fu', '/PlayFiver/Pragmatic/vs1fufufu.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(163, 'vs1600drago', 'Drago - Jewels of Fortune', '/PlayFiver/Pragmatic/vs1600drago.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(164, 'vs1money', 'Money Money Money', '/PlayFiver/Pragmatic/vs1money.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(166, 'vs40beowulf', 'Beowulf', '/PlayFiver/Pragmatic/vs40beowulf.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(167, 'vs4096jurassic', 'Jurassic Giants', '/PlayFiver/Pragmatic/vs4096jurassic.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(168, 'vs3train', 'Gold Train', '/PlayFiver/Pragmatic/vs3train.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(169, 'vs9hotroll', 'Hot Chilli', '/PlayFiver/Pragmatic/vs9hotroll.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(170, 'vs25queenofgold', 'Queen of Gold', '/PlayFiver/Pragmatic/vs25queenofgold.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(171, 'vs5spjoker', 'Super Joker', '/PlayFiver/Pragmatic/vs5spjoker.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(172, 'vs20egypt', 'Egyptian Fortunes', '/PlayFiver/Pragmatic/vs20egypttrs.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(173, 'vs18mashang', 'Treasure Horse', '/PlayFiver/Pragmatic/vs18mashang.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(174, 'vs50chinesecharms', 'Lucky Dragons', '/PlayFiver/Pragmatic/vs50chinesecharms.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(175, 'vs7monkeys', '7 Monkeys', '/PlayFiver/Pragmatic/vs7monkeys.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(176, 'vs25sea', 'Great Reef', '/PlayFiver/Pragmatic/vs25sea.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(177, 'vs20leprechaun', 'Leprechaun Song', '/PlayFiver/Pragmatic/vs20leprechaun.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(178, 'vs25dwarves_new', 'Dwarven Gold Deluxe', '/PlayFiver/Pragmatic/vs25dwarves_new.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(179, 'vs5hotburn', 'Hot to burn', '/PlayFiver/Pragmatic/vs5hotburn.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(180, 'vs9chen', 'Master Chen s Fortune', '/PlayFiver/Pragmatic/vs9chen.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(181, 'vs1tigers', 'Triple Tigers', '/PlayFiver/Pragmatic/vs1tigers.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(182, 'vs20godiva', 'Lady Godiva', '/PlayFiver/Pragmatic/vs20godiva.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(183, 'vs9madmonkey', 'Monkey Madness', '/PlayFiver/Pragmatic/vs9madmonkey.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(184, 'vs50kingkong', 'Mighty Kong', '/PlayFiver/Pragmatic/vs50kingkong.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(185, 'vs40frrainbow', 'Fruit Rainbow', '/PlayFiver/Pragmatic/vs40frrainbow.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(186, 'vs25newyear', 'Lucky New Year', '/PlayFiver/Pragmatic/vs25newyear.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(187, 'vs40madwheel', 'The Wild Machine', '/PlayFiver/Pragmatic/vs40madwheel.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(188, 'vs5trdragons', 'Triple Dragons', '/PlayFiver/Pragmatic/vs5trdragons.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(189, 'vs7776aztec', 'Aztec Bonanza', '/PlayFiver/Pragmatic/vs7776aztec.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(190, 'vs50hercules', 'Hercules Son of Zeus', '/PlayFiver/Pragmatic/vs50hercules.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(191, 'vs25journey', 'Journey to the West', '/PlayFiver/Pragmatic/vs25journey.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(192, 'vs20chicken', 'The Great Chicken Escape', '/PlayFiver/Pragmatic/vs20chicken.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(193, 'vs1fortunetree', 'Tree of Riches', '/PlayFiver/Pragmatic/vs1fortunetree.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(194, 'vs20wildpix', 'Wild Pixies', '/PlayFiver/Pragmatic/vs20wildpix.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(195, 'vs15fairytale', 'Fairytale Fortune', '/PlayFiver/Pragmatic/vs15fairytale.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(196, 'vs20santa', 'Santa', '/PlayFiver/Pragmatic/vs20santa.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(197, 'vs10vampwolf', 'Vampires vs Wolves', '/PlayFiver/Pragmatic/vs10vampwolf.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(198, 'vs50aladdin', '3 Genie Wishes', '/PlayFiver/Pragmatic/vs50aladdin.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(199, 'vs25safari', 'Hot Safari', '/PlayFiver/Pragmatic/vs25safari.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(200, 'vs20honey', 'Honey Honey Honey', '/PlayFiver/Pragmatic/vs20honey.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(201, 'vs20hercpeg', 'Hercules and Pegasus', '/PlayFiver/Pragmatic/vs20hercpeg.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(202, 'vs7fire88', 'Fire 88', '/PlayFiver/Pragmatic/vs7fire88.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(203, 'vs5aztecgems', 'Aztec Gems', '/PlayFiver/Pragmatic/vs5aztecgems.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(204, 'vs1dragon8', '888 Dragons', '/PlayFiver/Pragmatic/vs1dragon8.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(205, 'vs25dragonkingdom', 'Dragon Kingdom', '/PlayFiver/Pragmatic/vs25dragonkingdom.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(206, 'vs25goldrush', 'Gold Rush', '/PlayFiver/Pragmatic/vs25goldrush.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(207, 'vs25goldpig', 'Golden Pig', '/PlayFiver/Pragmatic/vs25goldpig.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(208, 'vs25gladiator', 'Wild Gladiator', '/PlayFiver/Pragmatic/vs25gladiator.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(209, 'vs5joker', 'Joker s Jewels', '/PlayFiver/Pragmatic/vs5joker.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(210, 'vs243caishien', 'Caishen s Cash', '/PlayFiver/Pragmatic/vs243caishien.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(211, 'vs7pigs', '7 Piggies', '/PlayFiver/Pragmatic/vs7pigs.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(212, 'vs20leprexmas', 'Leprechaun Carol', '/PlayFiver/Pragmatic/vs20leprexmas.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(213, 'vs8magicjourn', 'Magic Journey', '/PlayFiver/Pragmatic/vs8magicjourn.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(214, 'vs243fortseren', 'Greek Gods', '/PlayFiver/Pragmatic/vs243fortseren.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(215, 'vs25chilli', 'Chilli Heat', '/PlayFiver/Pragmatic/vs25chilli.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(216, 'vs20aladdinsorc', 'Aladdin and the Sorcerrer', '/PlayFiver/Pragmatic/vs20aladdinsorc.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(217, 'vs243fortune', 'Caishen s Gold', '/PlayFiver/Pragmatic/vs243fortune.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(218, 'vs10firestrike', 'Fire Strike', '/PlayFiver/Pragmatic/vs10firestrike.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(219, 'vs20kraken', 'Release the Kraken', '/PlayFiver/Pragmatic/vs20kraken.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(220, 'vs1masterjoker', 'Master Joker', '/PlayFiver/Pragmatic/vs1masterjoker.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(221, 'vs5super7', 'Super 7s', '/PlayFiver/Pragmatic/vs5super7.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 1),
(222, 'vs20wildboost', 'Wild Booster', '/PlayFiver/Pragmatic/vs20wildboost.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(223, 'vswayshammthor', 'Power of Thor Megaways', '/PlayFiver/Pragmatic/vswayshammthor.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(224, 'vs243lions', '5 Lions', '/PlayFiver/Pragmatic/vs243lions.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(225, 'vs243mwarrior', 'Monkey Warrior', '/PlayFiver/Pragmatic/vs243mwarrior.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(226, 'vs20doghouse', 'The Dog House', '/PlayFiver/Pragmatic/vs20doghouse.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(227, 'vs40pirate', 'Pirate Gold', '/PlayFiver/Pragmatic/vs40pirate.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(228, 'vs20rhino', 'Great Rhino', '/PlayFiver/Pragmatic/vs20rhino.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(229, 'vs25pandagold', 'Panda Fortune', '/PlayFiver/Pragmatic/vs25pandagold.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(230, 'vs4096bufking', 'Buffalo King', '/PlayFiver/Pragmatic/vs4096bufking.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(231, 'vs25pyramid', 'Pyramid King', '/PlayFiver/Pragmatic/vs25pyramid.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(232, 'vs5ultrab', 'Ultra Burn', '/PlayFiver/Pragmatic/vs5ultrab.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(233, 'vs5ultra', 'Ultra Hold and Spin', '/PlayFiver/Pragmatic/vs5ultra.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(234, 'vs25jokerking', 'Joker King', '/PlayFiver/Pragmatic/vs25jokerking.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(235, 'vs10returndead', 'Return of the Dead', '/PlayFiver/Pragmatic/vs10returndead.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(236, 'vs10madame', 'Madame Destiny', '/PlayFiver/Pragmatic/vs10madame.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(237, 'vs15diamond', 'Diamond Strike', '/PlayFiver/Pragmatic/vs15diamond.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(238, 'vs25aztecking', 'Aztec King', '/PlayFiver/Pragmatic/vs25aztecking.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(239, 'vs25wildspells', 'Wild Spells', '/PlayFiver/Pragmatic/vs25wildspells.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(240, 'vs10bbbonanza', 'Big Bass Bonanza', '/PlayFiver/Pragmatic/vs10bbbonanza.png', 1, '26595015200310', 0, 'fish', 0, 'apipp38', 0),
(241, 'vs10cowgold', 'Cowboys Gold', '/PlayFiver/Pragmatic/vs10cowgold.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(242, 'vs25tigerwar', 'The Tiger Warrior', '/PlayFiver/Pragmatic/vs25tigerwar.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(243, 'vs25mustang', 'Mustang Gold', '/PlayFiver/Pragmatic/vs25mustang.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(244, 'vs25hotfiesta', 'Hotfiesta', '/PlayFiver/Pragmatic/vs25hotfiesta.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(245, 'vs243dancingpar', 'Dance Party', '/PlayFiver/Pragmatic/vs243dancingpar.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(246, 'vs576treasures', 'Wild Wild Riches', '/PlayFiver/Pragmatic/vs576treasures.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(247, 'vs20hburnhs', 'Hot to Burn Hold and Spin', '/PlayFiver/Pragmatic/vs20hburnhs.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(248, 'vs20emptybank', 'Empty the Bank', '/PlayFiver/Pragmatic/vs20emptybank.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(249, 'vs20midas2', 'The Hand of Midas 2', '/PlayFiver/Pragmatic/vs20midas.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(250, 'vs20olympgate', 'Gates of Olympus', '/PlayFiver/Pragmatic/vs20olympgate.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(251, 'vswayslight', 'Lucky Lightning', '/PlayFiver/Pragmatic/vswayslight.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(252, 'vs20vegasmagic', 'Vegas Magic', '/PlayFiver/Pragmatic/vs20vegasmagic.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(253, 'vs20fruitparty', 'Fruit Party', '/PlayFiver/Pragmatic/vs20fruitparty.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(254, 'vs20fparty2', 'Fruit Party 2', '/PlayFiver/Pragmatic/vs20fparty2.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(255, 'vswaysdogs', 'The Dog House Megaways', '/PlayFiver/Pragmatic/vswaysdogs.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(256, 'vs50juicyfr', 'Juicy Fruits', '/PlayFiver/Pragmatic/vs50juicyfr.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(257, 'vs25pandatemple', 'Panda Fortune 2', '/PlayFiver/Pragmatic/vs25pandatemple.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(258, 'vswaysbufking', 'Buffalo King Megaways', '/PlayFiver/Pragmatic/vswaysbufking.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(259, 'vs40wildwest', 'Wild West Gold', '/PlayFiver/Pragmatic/vs40wildwest.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(260, 'vs20chickdrop', 'Chicken Drop', '/PlayFiver/Pragmatic/vs20chickdrop.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(261, 'vs40spartaking', 'Spartan King', '/PlayFiver/Pragmatic/vs40spartaking.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(262, 'vswaysrhino', 'Great Rhino Megaways', '/PlayFiver/Pragmatic/vswaysrhino.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(263, 'vs20sbxmas', 'Sweet Bonanza Xmas', '/PlayFiver/Pragmatic/vs20sbxmas.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(264, 'vs10fruity2', 'Extra Juicy', '/PlayFiver/Pragmatic/vs10fruity2.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(265, 'vs10egypt', 'Ancient Egypt', '/PlayFiver/Pragmatic/vs10egypt.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(266, 'vs5drhs', 'Dragon Hot Hold and Spin', '/PlayFiver/Pragmatic/vs5drhs.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(267, 'vs12bbb', 'Bigger Bass Bonanza', '/PlayFiver/Pragmatic/vs12bbb.png', 1, '26595015200310', 0, 'fish', 0, 'apipp38', 0),
(268, 'vs20tweethouse', 'The Tweety House', '/PlayFiver/Pragmatic/vs20tweethouse.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(269, 'vswayslions', '5 Lions Megaways', '/PlayFiver/Pragmatic/vswayslions.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(270, 'vswayssamurai', 'Rise of Samurai Megaways', '/PlayFiver/Pragmatic/vswayssamurai.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(271, 'vs50pixie', 'Pixie Wings', '/PlayFiver/Pragmatic/vs50pixie.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(272, 'vs10floatdrg', 'Floating Dragon', '/PlayFiver/Pragmatic/vs10floatdrg.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(273, 'vs20fruitsw', 'Sweet Bonanza', '/PlayFiver/Pragmatic/vs20fruitsw.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(274, 'vs20rhinoluxe', 'Great Rhino Deluxe', '/PlayFiver/Pragmatic/vs20rhinoluxe.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(275, 'vswaysmadame', 'Madame Destiny Megaways', '/PlayFiver/Pragmatic/vswaysmadame.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(276, 'vs1024temuj', 'Temujin Treasures', '/PlayFiver/Pragmatic/vs1024temuj.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(277, 'vs40pirgold', 'Pirate Gold Deluxe', '/PlayFiver/Pragmatic/vs40pirgold.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(278, 'vs25mmouse', 'Money Mouse', '/PlayFiver/Pragmatic/vs25mmouse.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(279, 'vs10threestar', 'Three Star Fortune', '/PlayFiver/Pragmatic/vs10threestar.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(280, 'vs1ball', 'Lucky Dragon Ball', '/PlayFiver/Pragmatic/vs1ball.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(281, 'vs243lionsgold', '5 Lions', '/PlayFiver/Pragmatic/vs243lionsgold.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(282, 'vs10egyptcls', 'Ancient Egypt Classic', '/PlayFiver/Pragmatic/vs10egyptcls.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(283, 'vs25davinci', 'Da Vinci Treasure', '/PlayFiver/Pragmatic/vs25davinci.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(284, 'vs7776secrets', 'Aztec Treasure', '/PlayFiver/Pragmatic/vs7776secrets.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(285, 'vs25wolfgold', 'Wolf Gold', '/PlayFiver/Pragmatic/vs25wolfgold.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(286, 'vs50safariking', 'Safari King', '/PlayFiver/Pragmatic/vs50safariking.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 1),
(287, 'vs25peking', 'Peking Luck', '/PlayFiver/Pragmatic/vs25peking.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(288, 'vs25asgard', 'Asgard', '/PlayFiver/Pragmatic/vs25asgard.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(289, 'vs25vegas', 'Vegas Nights', '/PlayFiver/Pragmatic/vs25vegas.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(290, 'vs25scarabqueen', 'John Hunter and the Tomb of the Scarab Queen', '/PlayFiver/Pragmatic/vs25scarabqueen.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(291, 'vs20starlight', 'Starlight Princess', '/PlayFiver/Pragmatic/vs20starlight.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(292, 'vs10bookoftut', 'John Hunter and the Book of Tut', '/PlayFiver/Pragmatic/vs10bookoftut.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(293, 'vs9piggybank', 'Piggy Bank Bills', '/PlayFiver/Pragmatic/vs9piggybank.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(294, 'vs5drmystery', 'Dragon Kingdom Mystery', '/PlayFiver/Pragmatic/vs5drmystery.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(295, 'vs20eightdragons', 'Eight Dragons', '/PlayFiver/Pragmatic/vs20eightdragons.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(296, 'vs1024lionsd', '5 Lions Dance', '/PlayFiver/Pragmatic/vs1024lionsd.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(297, 'vs25rio', 'Heart of Rio', '/PlayFiver/Pragmatic/vs25rio.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(298, 'vs10nudgeit', 'Rise of Giza PowerNudge', '/PlayFiver/Pragmatic/vs10nudgeit.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(299, 'vs10bxmasbnza', 'Christmas Big Bass Bonanza', '/PlayFiver/Pragmatic/vs10bxmasbnza.png', 1, '26595015200310', 0, 'fish', 0, 'apipp38', 0),
(300, 'vs20santawonder', 'Santa s Wonderland', '/PlayFiver/Pragmatic/vs20santawonder.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(301, 'vs10bblpop', 'Bubble Pop', '/PlayFiver/Pragmatic/vs10bblpop.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(302, 'vs25btygold', 'Bounty Gold', '/PlayFiver/Pragmatic/vs25btygold.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(303, 'vs88hockattack', 'Hockey Attack(tm)', '/PlayFiver/Pragmatic/vs88hockattack.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(304, 'vswaysbbb', 'Big Bass Bonanza Megaways(tm)', '/PlayFiver/Pragmatic/vswaysbbb.png', 1, NULL, 0, 'fish', 0, 'apipp38', 0),
(305, 'vs10bookfallen', 'Book of the Fallen', '/PlayFiver/Pragmatic/vs10bookfallen.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(306, 'vs40bigjuan', 'Big Juan', '/PlayFiver/Pragmatic/vs40bigjuan.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(307, 'vs20bermuda', 'John Hunter and the Quest for Bermuda Riches', '/PlayFiver/Pragmatic/vs20bermuda.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(308, 'vs10starpirate', 'Star Pirates Code', '/PlayFiver/Pragmatic/vs10starpirate.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(309, 'vswayswest', 'Mystic Chief', '/PlayFiver/Pragmatic/vswayswest.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(310, 'vs20daydead', 'Day of Dead', '/PlayFiver/Pragmatic/vs20daydead.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(311, 'vs20candvil', 'Candy Village', '/PlayFiver/Pragmatic/vs20candvil.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(312, 'vswayswwhex', 'Wild Wild Bananas', '/PlayFiver/Pragmatic/vswayswwhex.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(313, 'vs25spgldways', 'Secret City Gold', '/PlayFiver/Pragmatic/vs25spgldways.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(314, 'vswaysincwnd', 'Gold Oasis', '/PlayFiver/Pragmatic/vswaysincwnd.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(315, 'vswaysftropics', 'Frozen Tropics', '/PlayFiver/Pragmatic/vswaysftropics.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(316, 'vs20superlanche', 'Monster Superlanche', '/PlayFiver/Pragmatic/vs20superlanche.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(317, 'vs10fisheye', 'Fish Eye', '/PlayFiver/Pragmatic/vs10fisheye.png', 1, NULL, 0, 'fish', 0, 'apipp38', 0),
(318, 'vs20mochimon', 'Mochimon', '/PlayFiver/Pragmatic/vs20mochimon.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(319, 'vs20gatotfury', 'Gatot Kaca s Fury', '/PlayFiver/Pragmatic/vs20gatotfury.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(320, 'vs25archer', 'Fire Archer', '/PlayFiver/Pragmatic/vs25archer.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(321, 'vs12tropicana', 'Club Tropicana', '/PlayFiver/Pragmatic/vs12tropicana.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(322, 'vs10powerlines', 'Peak Power', '/PlayFiver/Pragmatic/vs10powerlines.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(323, 'vswaysmorient', 'Mystery of the Orient', '/PlayFiver/Pragmatic/vswaysmorient.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(324, 'vs20goldclust', 'Rabbit Garden', '/PlayFiver/Pragmatic/vs20goldclust.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(325, 'vs20sknights', 'The Knight King', '/PlayFiver/Pragmatic/vs20sknights.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(326, 'vs20framazon', 'Fruits of the Amazon', '/PlayFiver/Pragmatic/vs20framazon.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(327, 'vswaysredqueen', 'The Red Queen', '/PlayFiver/Pragmatic/vswaysredqueen.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(328, 'vs1024moonsh', 'Moonshot', '/PlayFiver/Pragmatic/vs1024moonsh.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(329, 'vs10bbhas', 'Big Bass - Hold e Spinner', '/PlayFiver/Pragmatic/vs10bbhas.png', 1, NULL, 0, 'fish', 0, 'apipp38', 0),
(330, 'vs20hotzone', 'African Elephant', '/PlayFiver/Pragmatic/vs20hotzone.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(331, 'vswaysmonkey', '3 Dancing Monkeys', '/PlayFiver/Pragmatic/vswaysmonkey.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(332, 'vswaysrsm', 'Wild Celebrity Bus Megaways', '/PlayFiver/Pragmatic/vswaysrsm.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(333, 'vs10gizagods', 'Gods of Giza', '/PlayFiver/Pragmatic/vs10gizagods.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(334, 'vswaysultrcoin', 'Cowboy Coins', '/PlayFiver/Pragmatic/vswaysultrcoin.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(335, 'vs10kingofdth', 'Kingdom of the Dead', '/PlayFiver/Pragmatic/vs10kingofdth.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(336, 'vs20mvwild', 'Jasmine Dreams', '/PlayFiver/Pragmatic/vs20mvwild.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(337, 'vs25holiday', 'Holiday Ride', '/PlayFiver/Pragmatic/vs25holiday.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(338, 'vs20stickywild', 'Wild Bison Charge', '/PlayFiver/Pragmatic/vs20stickywild.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(339, 'vs20excalibur', 'Excalibur Unleashed', '/PlayFiver/Pragmatic/vs20excalibur.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(340, 'vs25spotz', 'Knight Hot Spotz', '/PlayFiver/Pragmatic/vs25spotz.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(341, 'vs20clustwild', 'Sticky Bees', '/PlayFiver/Pragmatic/vs20clustwild.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(342, 'vs10fdrasbf', 'Floating Dragon - Dragon Boat Festival', '/PlayFiver/Pragmatic/vs10fdrasbf.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(343, 'vs4096robber', 'Robber Strike', '/PlayFiver/Pragmatic/vs4096robber.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(344, 'vs20lampinf', 'Lamp Of Infinity', '/PlayFiver/Pragmatic/vs20lampinf.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(345, 'vswaysfrbugs', 'Frogs e Bugs', '/PlayFiver/Pragmatic/vswaysfrbugs.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(346, 'vs9outlaw', 'Pirates Pub', '/PlayFiver/Pragmatic/vs9outlaw.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(347, 'vs20jewelparty', 'Jewel Rush', '/PlayFiver/Pragmatic/vs20jewelparty.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(348, 'vs20beefed', 'Fat Panda', '/PlayFiver/Pragmatic/vs20beefed.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(349, 'vs20hstgldngt', 'Heist for the Golden Nuggets', '/PlayFiver/Pragmatic/vs20hstgldngt.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(350, 'vs25jokrace', 'Joker Race', '/PlayFiver/Pragmatic/vs25jokrace.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(351, 'vs243nudge4gold', 'Hellvis Wild', '/PlayFiver/Pragmatic/vs243nudge4gold.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(352, 'vs50jucier', 'Sky Bounty', '/PlayFiver/Pragmatic/vs50jucier.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(353, 'vs20cashmachine', 'Cash Box', '/PlayFiver/Pragmatic/vs20cashmachine.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(354, 'vs20splmystery', 'Spellbinding Mystery', '/PlayFiver/Pragmatic/vs20splmystery.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(355, 'vs20doghousemh', 'The Dog House Multihold', '/PlayFiver/Pragmatic/vs20doghousemh.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(356, 'vs20wildparty', '3 Buzzing Wilds', '/PlayFiver/Pragmatic/vs20wildparty.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(357, 'vs20lobcrab', 'Lobster Bob s Crazy Crab Shack', '/PlayFiver/Pragmatic/vs20lobcrab.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(358, 'vs20supermania', 'Supermania', '/PlayFiver/Pragmatic/vs20supermania.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(359, 'vs10trail', 'Mustang Trail', '/PlayFiver/Pragmatic/vs10trail.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(360, 'vs20lvlup', 'Pub Kings', '/PlayFiver/Pragmatic/vs20lvlup.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(361, 'vs20saiman', 'Saiyan Mania', '/PlayFiver/Pragmatic/vs20saiman.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(362, 'vs20earthquake', 'Cyclops Smash', '/PlayFiver/Pragmatic/vs20earthquake.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(363, 'vswaysbbhas', 'Big Bass Hold e Spinner Megaways', '/PlayFiver/Pragmatic/vswaysbbhas.png', 1, NULL, 0, 'fish', 0, 'apipp38', 0),
(364, 'vs20forge', 'Forge of Olympus', '/PlayFiver/Pragmatic/vs20forge.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(365, 'vs20procount', 'Wisdom of Athena', '/PlayFiver/Pragmatic/vs20procount.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(366, 'vs1024mahjwins', 'Mahjong Wins', '/PlayFiver/Pragmatic/vs1024mahjwins.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(367, 'vs20maskgame', 'Cash Chips', '/PlayFiver/Pragmatic/vs20maskgame.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(368, 'vswaysraghex', 'Tundra s Fortune', '/PlayFiver/Pragmatic/vswaysraghex.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(369, 'vs10bhallbnza', 'Big Bass Halloween', '/PlayFiver/Pragmatic/vs10bhallbnza.png', 1, NULL, 0, 'fish', 0, 'apipp38', 0),
(370, 'vs40rainbowr', 'Rainbow Reels', '/PlayFiver/Pragmatic/vs40rainbowr.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(371, 'vs20gravity', 'Gravity Bonanza', '/PlayFiver/Pragmatic/vs20gravity.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(372, 'vs40infwild', 'Infective Wild', '/PlayFiver/Pragmatic/vs40infwild.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(373, 'vs20swordofares', 'Sword of Ares', '/PlayFiver/Pragmatic/vs20swordofares.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(374, 'vswaysfrywld', 'Spin e Score Megaways', '/PlayFiver/Pragmatic/vswaysfrywld.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(375, 'vswaysconcoll', 'Sweet PowerNudge(tm)', '/PlayFiver/Pragmatic/vswaysconcoll.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(376, 'vs20lcount', 'Gems of Serengeti(tm)', '/PlayFiver/Pragmatic/vs20lcount.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(377, 'vs20sparta', 'Shield of Sparta', '/PlayFiver/Pragmatic/vs20sparta.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(378, 'vs10bbkir', 'Big Bass Bonanza Keeping it Reel', '/PlayFiver/Pragmatic/vs10bbkir.png', 1, '26595015200310', 0, 'fish', 0, 'apipp38', 0),
(379, 'vswayspizza', 'Pizza Pizza Pizza', '/PlayFiver/Pragmatic/vswayspizza.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(380, 'vs20dugems', 'Hot Pepper(tm)', '/PlayFiver/Pragmatic/vs20dugems.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(381, 'vs20clspwrndg', 'Sweet PowerNudge', '/PlayFiver/Pragmatic/vs20clspwrndg.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(382, 'vswaysfuryodin', 'Fury of Odin Megaways(tm)', '/PlayFiver/Pragmatic/vswaysfuryodin.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(383, 'vs20sugarcoins', 'Viking Forge', '/PlayFiver/Pragmatic/vs20sugarcoins.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(384, 'vs20olympgrace', 'Grace of Ebisu', '/PlayFiver/Pragmatic/vs20olympgrace.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(385, 'vs20schristmas', 'Starlight Princess 1000', '/PlayFiver/Pragmatic/vs20starlightx.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(386, 'vswaysmoneyman', 'The Money Men Megaways', '/PlayFiver/Pragmatic/vswaysmoneyman.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(387, 'vs40demonpots', 'Demon Pots', '/PlayFiver/Pragmatic/vs40demonpots.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(388, 'vswaystut', 'John Hunter and the Book of Tut Megaways', '/PlayFiver/Pragmatic/vswaystut.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(389, 'vs10gdchalleng', '8 Golden Dragon Challenge', '/PlayFiver/Pragmatic/vs10gdchalleng.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(390, 'vs50dmdcascade', 'Diamond Cascade', '/PlayFiver/Pragmatic/vs50dmdcascade.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(391, 'vs20piggybank', 'Piggy Bankers', '/PlayFiver/Pragmatic/vs20piggybank.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(392, 'vs20bnnzdice', 'Sweet Bonanza Dice', '/PlayFiver/Pragmatic/vs20bnnzdice.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(393, 'vs5gemstone', 'Gemstone', '/PlayFiver/Pragmatic/vs5gemstone.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(394, 'vs20yisunshin', 'Yi Sun Shin', '/PlayFiver/Pragmatic/vs20yisunshin.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(395, 'vs20candyblitz', 'Candy Blitz', '/PlayFiver/Pragmatic/vs20candyblitz.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(396, 'vswaysstrlght', 'Fortunes of Aztec', '/PlayFiver/Pragmatic/vswaysstrlght.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(397, 'aviator', 'Aviator', '/PlayFiver/Spribe/Aviator.png', 1, '36595015200906', 0, 'block', 0, 'apipp38', 0),
(399, '12547', 'Atlantis', '/PlayFiver/Galaxsys/Atlantis.png', 1, 'GALAXSYS', 0, 'block', 0, '0', 0),
(400, '12544', 'Bingo Star', '/PlayFiver/Galaxsys/Bingo-Star.png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0),
(401, '12542', 'Maestro', '/PlayFiver/Galaxsys/Maestro.png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0),
(402, '12540', 'Turbo Mines', '/PlayFiver/Galaxsys/Turbo-Mines.png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0),
(403, '12537', 'Totem', '/PlayFiver/Galaxsys/Totem.png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0),
(404, '12536', 'Magic Dice', '/PlayFiver/Galaxsys/Magic-Dice.png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0),
(405, '12533', 'Scratch Map', '/PlayFiver/Galaxsys/Scratch-Map.png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0),
(406, '12532', 'Coin Flip', '/PlayFiver/Galaxsys/Coin-Flip.png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0),
(407, '12530', 'Roulette X', '/PlayFiver/Galaxsys/Roulette-X.png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0),
(408, '12528', 'Plinkoman', '/PlayFiver/Galaxsys/Plinkoman.png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0),
(409, '12526', 'Ninja Crash', '/PlayFiver/Galaxsys/Ninja-Crash.png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0),
(410, '12524', 'Mr.Thimble', '/PlayFiver/Galaxsys/Mr.Thimble.png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0),
(411, '12523', 'Jungle Wheel', '/PlayFiver/Galaxsys/Jungle-Wheel.png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0),
(412, '12522', 'Jungle Wheel', '/PlayFiver/Galaxsys/Jungle-Wheel.png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0),
(413, '12520', 'GoldenRA', '/PlayFiver/Galaxsys/GoldenRA.png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0),
(414, '12518', 'F Mines', '/PlayFiver/Galaxsys/F-Mines.png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0),
(415, '12516', 'Crasher', '/PlayFiver/Galaxsys/Crasher.png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0),
(416, '12515', 'Cash Show', '/PlayFiver/Galaxsys/Cash-Show.png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0),
(417, '12502', 'SicBo', '/PlayFiver/Galaxsys/SicBo.png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0),
(418, '12501', 'Rocketon', '/PlayFiver/Galaxsys/Rocketon.png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0),
(419, '12500', 'Penalty', '/PlayFiver/Galaxsys/Penalty.png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0),
(420, '12499', 'Keno Express', '/PlayFiver/Galaxsys/Keno-Express.png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0),
(421, '12510', 'Keno 8 (2 Minute)', '/PlayFiver/Galaxsys/Keno-8-(2-Minute).png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0),
(422, '12509', 'Keno 8 (1 Minute)', '/PlayFiver/Galaxsys/Keno-8-(1-Minute).png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0),
(423, '12508', 'Keno 10 (2 Minute)', '/PlayFiver/Galaxsys/Keno-10-(2-Minute).png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0);
INSERT INTO `games` (`id`, `game_code`, `game_name`, `banner`, `status`, `provider`, `popular`, `type`, `game_type`, `distribution`, `ordem`) VALUES
(424, '12507', 'Keno 10 (1 Minute)', '/PlayFiver/Galaxsys/Keno-10-(1-Minute).png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0),
(425, '12494', 'Hilo', '/PlayFiver/Galaxsys/Hilo.png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0),
(426, '12493', 'Crash', '/PlayFiver/Galaxsys/Crash.png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0),
(427, '12492', 'BlackJack', '/PlayFiver/Galaxsys/BlackJack.png', 1, 'GALAXSYS', 0, 'block', 0, 'apipp38', 0),
(428, '30', 'Power Stars', '/PlayFiver/Novomatic/Power-Stars.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(429, '3218', 'Queen of Hearts Deluxe', '/PlayFiver/Novomatic/Queen-of-Hearts-Deluxe.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(430, '103', 'Quest for Gold', '/PlayFiver/Novomatic/Quest-for-Gold.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(431, '102', 'Ramses II', '/PlayFiver/Novomatic/Ramses-II.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(432, '374', 'Red Lady', '/PlayFiver/Novomatic/Red-Lady.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(433, '114', 'Reel King', '/PlayFiver/Novomatic/Reel-King.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(434, '107', 'Rex', '/PlayFiver/Novomatic/Rex.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(435, '4571', 'River Queen', '/PlayFiver/Novomatic/River-Queen.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(436, '3210', 'Roaring Forties', '/PlayFiver/Novomatic/Roaring-Forties.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(437, '3211', 'Roaring Wilds', '/PlayFiver/Novomatic/Roaring-Wilds.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(438, '6657', 'Royal Dynasty', '/PlayFiver/Novomatic/Royal-Dynasty.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(439, '475', 'Royal Treasure', '/PlayFiver/Novomatic/Royal-Treasure.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(440, '95', 'Secret Elixir', '/PlayFiver/Novomatic/Secret-Elixir.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(441, '6878', 'Secret Treasure', '/PlayFiver/Novomatic/Secret-Treasure.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(442, '3149', 'Sizzling 6', '/PlayFiver/Novomatic/Sizzling-6.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(443, '3158', 'Supra Hot', '/PlayFiver/Novomatic/Supra-Hot.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(444, '547', 'The Money Game', '/PlayFiver/Novomatic/The-Money-Game.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(445, '6872', 'Totally Wild', '/PlayFiver/Novomatic/Totally-Wild.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(446, '6990', 'Ultra Hot Deluxe', '/PlayFiver/Novomatic/Ultra-Hot-Deluxe.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(447, '549', 'Unicorn Magic', '/PlayFiver/Novomatic/Unicorn-Magic.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(448, '4628', 'Wild Country', '/PlayFiver/Novomatic/Wild-Country.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(449, '90', 'Xtra Hot', '/PlayFiver/Novomatic/Xtra-Hot.png', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(450, '3204', 'Silver Fang', '/PlayFiver/Microgaming/Silver-Fang.png', 1, 'MICROGAMING', 0, 'slot', 0, 'apipp38', 0),
(451, '3203', 'Thunder Struck', '/PlayFiver/Microgaming/Thunder-Struck.png', 1, 'MICROGAMING', 0, 'slot', 0, 'apipp38', 0),
(452, '3202', 'Immortal Romance', '/PlayFiver/Microgaming/Immortal-Romance.png', 1, 'MICROGAMING', 0, 'slot', 0, 'apipp38', 0),
(453, '3201', 'Game Of Thrones', '/PlayFiver/Microgaming/Game-Of-Thrones.png', 1, 'MICROGAMING', 0, 'slot', 0, 'apipp38', 0),
(454, '4210', 'Burning Desire', '/PlayFiver/Microgaming/Burning-Desire.png', 1, 'MICROGAMING', 0, 'slot', 0, 'apipp38', 0),
(455, '4209', 'Alaskan Fishing', '/PlayFiver/Microgaming/Alaskan-Fishing.png', 1, 'MICROGAMING', 0, 'fish', 0, 'apipp38', 0),
(456, '4208', 'Agent Jane Blonde', '/PlayFiver/Microgaming/Agent-Jane-Blonde.png', 1, 'MICROGAMING', 0, 'slot', 0, 'apipp38', 0),
(457, '4191', 'Tomb Raider', '/PlayFiver/Microgaming/Tomb-Raider.png', 1, 'MICROGAMING', 0, 'slot', 0, 'apipp38', 0),
(458, '4190', 'Deck the Halls', '/PlayFiver/Microgaming/Deck-the-Halls.png', 1, 'MICROGAMING', 0, 'slot', 0, 'apipp38', 0),
(459, '4240', 'Six Acrobats', '/PlayFiver/Microgaming/Six-Acrobats.png', 1, 'MICROGAMING', 0, 'slot', 0, 'apipp38', 0),
(460, '4239', 'Beautiful Bones', '/PlayFiver/Microgaming/Beautiful-Bones.png', 1, 'MICROGAMING', 0, 'slot', 0, 'apipp38', 0),
(461, '4218', 'Monster Wheels', '/PlayFiver/Microgaming/Monster-Wheels.png', 1, 'MICROGAMING', 0, 'slot', 0, 'apipp38', 0),
(462, '4260', 'Mermaids Millions', '/PlayFiver/Microgaming/Mermaids-Millions.png', 1, 'MICROGAMING', 0, 'slot', 0, 'apipp38', 0),
(463, '4264', 'King Tusk', '/PlayFiver/Microgaming/King-Tusk.png', 1, 'MICROGAMING', 0, 'slot', 0, 'apipp38', 0),
(464, '4263', 'Secret Romance', '/PlayFiver/Microgaming/Secret-Romance.png', 1, 'MICROGAMING', 0, 'slot', 0, 'apipp38', 0),
(465, '4275', 'High Lander', '/PlayFiver/Microgaming/High-Lander.png', 1, 'MICROGAMING', 0, 'slot', 0, 'apipp38', 0),
(466, '4273', 'Cool Wolf', '/PlayFiver/Microgaming/Cool-Wolf.png', 1, 'MICROGAMING', 0, 'slot', 0, 'apipp38', 0),
(467, '6712', 'Break Away', '/PlayFiver/Microgaming/Break-Away.png', 1, 'MICROGAMING', 0, 'slot', 0, 'apipp38', 0),
(468, '6905', 'Ancient Fortunes Zeus', '/PlayFiver/Microgaming/Ancient-Fortunes-Zeus.png', 1, 'MICROGAMING', 0, 'slot', 0, 'apipp38', 0),
(469, '6904', 'Tarzan Jewels of Opar', '/PlayFiver/Microgaming/Tarzan-Jewels-of-Opar.png', 1, 'MICROGAMING', 0, 'slot', 0, 'apipp38', 0),
(470, '6903', 'Emperor of the Sea', '/PlayFiver/Microgaming/Emperor-of-the-Sea.png', 1, 'MICROGAMING', 0, 'slot', 0, 'apipp38', 0),
(471, '6937', 'Age Of Conquest', '/PlayFiver/Microgaming/Age-Of-Conquest.png', 1, 'MICROGAMING', 0, 'slot', 0, 'apipp38', 0),
(472, '7000', 'Avalon', '/PlayFiver/Microgaming/Avalon.png', 1, 'MICROGAMING', 0, 'slot', 0, 'apipp38', 0),
(473, '6999', 'Titans of the Sun Theia', '/PlayFiver/Microgaming/Titans-of-the-Sun-Theia.png', 1, 'MICROGAMING', 0, 'slot', 0, 'apipp38', 0),
(474, '7049', '9 Masks of Fire', '/PlayFiver/Microgaming/9-Masks-of-Fire.png', 1, 'MICROGAMING', 0, 'slot', 0, 'apipp38', 0),
(475, '7057', '9 Pots of Gold', '/PlayFiver/Microgaming/9-Pots-of-Gold.png', 1, 'MICROGAMING', 0, 'slot', 0, 'apipp38', 0),
(476, '7708', 'Assassin Moon', '/PlayFiver/Microgaming/Assassin-Moon.png', 1, 'MICROGAMING', 0, 'slot', 0, 'apipp38', 0),
(477, '6789', 'Hot Hot Fruit', '/PlayFiver/Habanero/Hot-Hot-Fruit.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(478, '6811', 'Nuwa', '/PlayFiver/Habanero/Nuwa.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(479, '6893', 'Hot Hot Halloween', '/PlayFiver/Habanero/Hot-Hot-Halloween.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(480, '6933', 'Happy Ape', '/PlayFiver/Habanero/Happy-Ape.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(481, '6932', 'Panda Panda', '/PlayFiver/Habanero/Panda-Panda.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(482, '6931', 'Lucky Fortune Cat', '/PlayFiver/Habanero/Lucky-Fortune-Cat.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(483, 'SGReturnToTheFeature', 'Return to the Future', '/PlayFiver/Habanero/SGReturnToTheFeature.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(484, 'SGTabernaDeLosMuertosUltra', 'Tevena de los Muirtos Ultra', '/PlayFiver/Habanero/SGTabernaDeLosMuertosUltra.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(485, 'SGTotemTowers', 'Totem towers', '/PlayFiver/Habanero/SGTotemTowers.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(486, 'SGChristmasGiftRush', 'Christmas Kipoot Rush', '/PlayFiver/Habanero/SGChristmasGiftRush.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(487, 'SGOrbsOfAtlantis', 'Overs of Atlantis', '/PlayFiver/Habanero/SGOrbsOfAtlantis.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(488, 'SGBeforeTimeRunsOut', 'Before Time Runner Out', '/PlayFiver/Habanero/SGBeforeTimeRunsOut.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(489, 'SGTechnoTumble', 'Techno tumble', '/PlayFiver/Habanero/SGTechnoTumble.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(490, 'SGHappyApe', 'Happy ape', '/PlayFiver/Habanero/SGHappyApe.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(491, 'SGTabernaDeLosMuertos', 'Tevena di los Muertos', '/PlayFiver/Habanero/SGTabernaDeLosMuertos.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(492, 'SGNaughtySanta', 'Notty Santa', '/PlayFiver/Habanero/SGNaughtySanta.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(494, 'SGHeySushi', 'Hey sushi', '/PlayFiver/Habanero/SGHeySushi.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(495, 'SGKnockoutFootballRush', 'Knockout football rush', '/PlayFiver/Habanero/SGKnockoutFootballRush.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(496, 'SGColossalGems', 'Closal Gems', '/PlayFiver/Habanero/SGColossalGems.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(497, 'SGHotHotHalloween', 'hot hot halloween', '/PlayFiver/Habanero/SGHotHotHalloween.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(498, 'SGLuckyFortuneCat', 'Lucky fortune cat', '/PlayFiver/Habanero/SGLuckyFortuneCat.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(499, 'SGHotHotFruit', 'hot hot fruit', '/PlayFiver/Habanero/SGHotHotFruit.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(500, 'SGMountMazuma', 'Mount Majuma', '/PlayFiver/Habanero/SGMountMazuma.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(501, 'SGWildTrucks', 'Wild Trucks', '/PlayFiver/Habanero/SGWildTrucks.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(502, 'SGLuckyLucky', 'Lucky Lucky', '/PlayFiver/Habanero/SGLuckyLucky.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(503, 'SGKnockoutFootball', 'Knockout football', '/PlayFiver/Habanero/SGKnockoutFootball.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(504, 'SGJump', 'Jump!', '/PlayFiver/Habanero/SGJump.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(505, 'SGPumpkinPatch', 'Pumpkin patch', '/PlayFiver/Habanero/SGPumpkinPatch.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(506, 'SGWaysOfFortune', 'Way of Fortune', '/PlayFiver/Habanero/SGWaysOfFortune.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(507, 'SGFourDivineBeasts', 'For Devine Beasts', '/PlayFiver/Habanero/SGFourDivineBeasts.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(508, 'SGPandaPanda', 'Panda panda', '/PlayFiver/Habanero/SGPandaPanda.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(509, 'SGOceansCall', 'Ocean s Call', '/PlayFiver/Habanero/SGOceansCall.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(510, 'SGScruffyScallywags', 'Scruffy Skellywex', '/PlayFiver/Habanero/SGScruffyScallywags.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(511, 'SGNuwa', 'Nuwa', '/PlayFiver/Habanero/SGNuwa.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(512, 'SGTheKoiGate', 'Koi gate', '/PlayFiver/Habanero/SGTheKoiGate.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(513, 'SGFaCaiShen', 'Pacaishen', '/PlayFiver/Habanero/SGFaCaiShen.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(514, 'SG12Zodiacs', '12 zodiacs', '/PlayFiver/Habanero/SG12Zodiacs.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(515, 'SGFireRooster', 'Fire rooster', '/PlayFiver/Habanero/SGFireRooster.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(516, 'SGFenghuang', 'Phoenix', '/PlayFiver/Habanero/SGFenghuang.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(517, 'SGBirdOfThunder', 'Bird of Thunder', '/PlayFiver/Habanero/SGBirdOfThunder.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(518, 'SGTheDeadEscape', 'The Dead Escape', '/PlayFiver/Habanero/SGTheDeadEscape.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(519, 'SGBombsAway', 'Bombs Away', '/PlayFiver/Habanero/SGBombsAway.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(520, 'SGGoldRush', 'Gold rush', '/PlayFiver/Habanero/SGGoldRush.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(521, 'SGRuffledUp', 'Ruffled up', '/PlayFiver/Habanero/SGRuffledUp.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(522, 'SGRomanEmpire', 'Roman empire', '/PlayFiver/Habanero/SGRomanEmpire.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(523, 'SGCoyoteCrash', 'Coyote crash', '/PlayFiver/Habanero/SGCoyoteCrash.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(524, 'SGWickedWitch', 'Wickt Location', '/PlayFiver/Habanero/SGWickedWitch.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(525, 'SGDragonsThrone', 'Dragon s Throne', '/PlayFiver/Habanero/SGDragonsThrone.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(526, 'SGBuggyBonus', 'Buggy bonus', '/PlayFiver/Habanero/SGBuggyBonus.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(527, 'SGGlamRock', 'Glam rock', '/PlayFiver/Habanero/SGGlamRock.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(528, 'SGSuperTwister', 'Super twister', '/PlayFiver/Habanero/SGSuperTwister.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(529, 'SGTreasureTomb', 'Treasure Tomb', '/PlayFiver/Habanero/SGTreasureTomb.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(530, 'SGJugglenaut', 'Jugglenut', '/PlayFiver/Habanero/SGJugglenaut.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(531, 'SGGalacticCash', 'Glactic Cash', '/PlayFiver/Habanero/SGGalacticCash.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(532, 'SGZeus2', 'Zeus 2', '/PlayFiver/Habanero/SGZeus2.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(533, 'SGTheDragonCastle', 'Dragon castle', '/PlayFiver/Habanero/SGTheDragonCastle.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(534, 'SGKingTutsTomb', 'King Teeth Tomb', '/PlayFiver/Habanero/SGKingTutsTomb.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(535, 'SGCarnivalCash', 'Carnival cash', '/PlayFiver/Habanero/SGCarnivalCash.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(536, 'SGTreasureDiver', 'Treasure diver', '/PlayFiver/Habanero/SGTreasureDiver.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(537, 'SGLittleGreenMoney', 'Little Green Money', '/PlayFiver/Habanero/SGLittleGreenMoney.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(538, 'SGMonsterMashCash', 'Monster Mash Cash', '/PlayFiver/Habanero/SGMonsterMashCash.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(539, 'SGShaolinFortunes100', 'Xiaolin Fortune 100', '/PlayFiver/Habanero/SGShaolinFortunes100.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(540, 'SGShaolinFortunes243', 'Xiaolin Fortune', '/PlayFiver/Habanero/SGShaolinFortunes243.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(541, 'SGWeirdScience', 'Weird Science', '/PlayFiver/Habanero/SGWeirdScience.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(542, 'SGBlackbeardsBounty', 'Blackbeards Bounty', '/PlayFiver/Habanero/SGBlackbeardsBounty.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(543, 'SGDrFeelgood', 'Dr. Feelgood', '/PlayFiver/Habanero/SGDrFeelgood.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(544, 'SGVikingsPlunder', 'Vikings plunder', '/PlayFiver/Habanero/SGVikingsPlunder.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(545, 'SGDoubleODollars', 'Double O Dollars', '/PlayFiver/Habanero/SGDoubleODollars.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(546, 'SGSpaceFortune', 'Space fortune', '/PlayFiver/Habanero/SGSpaceFortune.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(547, 'SGPamperMe', 'Pamper me', '/PlayFiver/Habanero/SGPamperMe.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(548, 'SGZeus', 'Zeus', '/PlayFiver/Habanero/SGZeus.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(549, 'SGEgyptianDreams', 'Egyptian Dreams', '/PlayFiver/Habanero/SGEgyptianDreams.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(550, 'SGBarnstormerBucks', 'Barnstormer Bucks', '/PlayFiver/Habanero/SGBarnstormerBucks.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(551, 'SGSuperStrike', 'Super strike', '/PlayFiver/Habanero/SGSuperStrike.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(552, 'SGJungleRumble', 'Jungle rumble', '/PlayFiver/Habanero/SGJungleRumble.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(553, 'SGArcticWonders', 'Arctic Wonders', '/PlayFiver/Habanero/SGArcticWonders.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(554, 'SGTowerOfPizza', 'Tower of Pizza', '/PlayFiver/Habanero/SGTowerOfPizza.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(555, 'SGMummyMoney', 'Mummy money', '/PlayFiver/Habanero/SGMummyMoney.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(556, 'SGBikiniIsland', 'bikini island', '/PlayFiver/Habanero/SGBikiniIsland.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(557, 'SGQueenOfQueens1024', 'Queen of Queens II', '/PlayFiver/Habanero/SGQueenOfQueens1024.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(558, 'SGDragonsRealm', 'Dragon s Realm', '/PlayFiver/Habanero/SGDragonsRealm.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(559, 'SGAllForOne', 'All for one', '/PlayFiver/Habanero/SGAllForOne.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(560, 'SGFlyingHigh', 'Flying high', '/PlayFiver/Habanero/SGFlyingHigh.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(561, 'SGMrBling', 'Mr. Bling', '/PlayFiver/Habanero/SGMrBling.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(562, 'SGMysticFortune', 'Mystic Fortune', '/PlayFiver/Habanero/SGMysticFortune.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(563, 'SGQueenOfQueens243', 'Queen of queens', '/PlayFiver/Habanero/SGQueenOfQueens243.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(564, 'SGGrapeEscape', 'The Graph Escape', '/PlayFiver/Habanero/SGGrapeEscape.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(565, 'SGGoldenUnicorn', 'Golden unicorn', '/PlayFiver/Habanero/SGGoldenUnicorn.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(566, 'SGFrontierFortunes', 'Frontier Fortune', '/PlayFiver/Habanero/SGFrontierFortunes.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(567, 'SGIndianCashCatcher', 'Indian Cash Catcher', '/PlayFiver/Habanero/SGIndianCashCatcher.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(568, 'SGSkysTheLimit', 'Skys the Limit', '/PlayFiver/Habanero/SGSkysTheLimit.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(569, 'SGTheBigDeal', 'The Big Deal', '/PlayFiver/Habanero/SGTheBigDeal.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(570, 'SGCashosaurus', 'Cashosaurus', '/PlayFiver/Habanero/SGCashosaurus.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(571, 'SGDiscoFunk', 'Disco funk', '/PlayFiver/Habanero/SGDiscoFunk.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(572, 'SGCalaverasExplosivas', 'Calaveras Explociba', '/PlayFiver/Habanero/SGCalaverasExplosivas.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(573, 'SGNineTails', 'Nine Tales', '/PlayFiver/Habanero/SGNineTails.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(574, 'SGMysticFortuneDeluxe', 'Mystic Fortune Deluxe', '/PlayFiver/Habanero/SGMysticFortuneDeluxe.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(575, 'SGLuckyDurian', 'Lucky durian', '/PlayFiver/Habanero/SGLuckyDurian.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(576, 'SGDiscoBeats', 'Disco beat', '/PlayFiver/Habanero/SGDiscoBeats.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(577, 'SGLanternLuck', 'Lantern lucky', '/PlayFiver/Habanero/SGLanternLuck.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(578, 'SGBombRunner', 'Boom runner', '/PlayFiver/Habanero/SGBombRunner.png', 1, 'HABANERO', 0, 'slot', 0, 'apipp38', 0),
(579, '7820', 'Xmas Joker', '/PlayFiver/Playngo/Xmas-Joker.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(580, '7819', 'Wild Blood', '/PlayFiver/Playngo/Wild-Blood.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(581, '7818', 'Sticky Joker', '/PlayFiver/Playngo/Sticky-Joker.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(582, '7817', 'Star Joker', '/PlayFiver/Playngo/Star-Joker.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(583, '7816', 'Space Race', '/PlayFiver/Playngo/Space-Race.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(584, '7815', 'Sizzling Spins', '/PlayFiver/Playngo/Sizzling-Spins.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(585, '7814', 'Scroll of Dead', '/PlayFiver/Playngo/Scroll-of-Dead.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(586, '7813', 'Saxon', '/PlayFiver/Playngo/Saxon.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(587, '7812', 'Sails of Gold', '/PlayFiver/Playngo/Sails-of-Gold.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(588, '7811', 'Royal Masquerade', '/PlayFiver/Playngo/Royal-Masquerade.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(589, '7810', 'Rise of Merlin', '/PlayFiver/Playngo/Rise-of-Merlin.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(590, '7809', 'Rise of Athena', '/PlayFiver/Playngo/Rise-of-Athena.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(591, '7820', 'Xmas Joker', '/PlayFiver/Playngo/Xmas-Joker.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(592, '7819', 'Wild Blood', '/PlayFiver/Playngo/Wild-Blood.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(593, '7818', 'Sticky Joker', '/PlayFiver/Playngo/Sticky-Joker.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(594, '7817', 'Star Joker', '/PlayFiver/Playngo/Star-Joker.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(595, '7816', 'Space Race', '/PlayFiver/Playngo/Space-Race.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(596, '7815', 'Sizzling Spins', '/PlayFiver/Playngo/Sizzling-Spins.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(597, '7814', 'Scroll of Dead', '/PlayFiver/Playngo/Scroll-of-Dead.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(598, '7813', 'Saxon', '/PlayFiver/Playngo/Saxon.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(599, '7812', 'Sails of Gold', '/PlayFiver/Playngo/Sails-of-Gold.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(600, '7811', 'Royal Masquerade', '/PlayFiver/Playngo/Royal-Masquerade.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(601, '7809', 'Rise of Athena', '/PlayFiver/Playngo/Rise-of-Athena.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(602, '7820', 'Xmas Joker', '/PlayFiver/Playngo/Xmas-Joker.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(603, '7819', 'Wild Blood', '/PlayFiver/Playngo/Wild-Blood.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(604, '7818', 'Sticky Joker', '/PlayFiver/Playngo/Sticky-Joker.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(605, '7817', 'Star Joker', '/PlayFiver/Playngo/Star-Joker.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(606, '7816', 'Space Race', '/PlayFiver/Playngo/Space-Race.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(607, '7815', 'Sizzling Spins', '/PlayFiver/Playngo/Sizzling-Spins.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(608, '7814', 'Scroll of Dead', '/PlayFiver/Playngo/Scroll-of-Dead.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(609, '7813', 'Saxon', '/PlayFiver/Playngo/Saxon.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(610, '7812', 'Sails of Gold', '/PlayFiver/Playngo/Sails-of-Gold.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(611, '7811', 'Royal Masquerade', '/PlayFiver/Playngo/Royal-Masquerade.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(612, '7809', 'Rise of Athena', '/PlayFiver/Playngo/Rise-of-Athena.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(613, '7808', 'Riches of RA', '/PlayFiver/Playngo/Riches-of-RA.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(614, '7807', 'Rich Wilde and the Amulet of Dead', '/PlayFiver/Playngo/Rich-Wilde-and-the-Amulet-of-Dead.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(615, '7806', 'Prosperity Palace', '/PlayFiver/Playngo/Prosperity-Palace.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(616, '7805', 'Prism of Gems', '/PlayFiver/Playngo/Prism-of-Gems.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(617, '7804', 'Photo Safari', '/PlayFiver/Playngo/Photo-Safari.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(618, '7803', 'Pearl Lagoon', '/PlayFiver/Playngo/Pearl-Lagoon.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(619, '7802', 'New Year Riches', '/PlayFiver/Playngo/New-Year-Riches.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(620, '7801', 'Mystery Joker', '/PlayFiver/Playngo/Mystery-Joker.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(621, '7800', 'MultiFruit 81', '/PlayFiver/Playngo/MultiFruit-81.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(622, '7799', 'Miner Donkey Trouble', '/PlayFiver/Playngo/Miner-Donkey-Trouble.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(623, '7798', 'Lord Merlin and the Lady of the Lake', '/PlayFiver/Playngo/Lord-Merlin-and-the-Lady-of-the-Lake.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(624, '7797', 'Legacy of Dead', '/PlayFiver/Playngo/Legacy-of-Dead.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(625, '7796', 'Irish Gold', '/PlayFiver/Playngo/Irish-Gold.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(626, '7795', 'House of Doom', '/PlayFiver/Playngo/House-of-Doom.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(627, '7794', 'Happy Halloween', '/PlayFiver/Playngo/Happy-Halloween.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(628, '7793', 'Golden Legend', '/PlayFiver/Playngo/Golden-Legend.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(629, '7792', 'Gold Trophy', '/PlayFiver/Playngo/Gold-Trophy.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(630, '7791', 'Ghost of Dead', '/PlayFiver/Playngo/Ghost-of-Dead.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(631, '7790', 'Fu Er Dai', '/PlayFiver/Playngo/Fu-Er-Dai.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(632, '7789', 'Dragonship', '/PlayFiver/Playngo/Dragonship.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(633, '7788', 'Doom of Egypt', '/PlayFiver/Playngo/Doom-of-Egypt.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(634, '7787', 'Disco Diamonds', '/PlayFiver/Playngo/Disco-Diamonds.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(635, '7786', 'Dawn of Egypt', '/PlayFiver/Playngo/Dawn-of-Egypt.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(636, '7785', 'Danish Flip', '/PlayFiver/Playngo/Danish-Flip.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(637, '7784', 'Crystal Sun', '/PlayFiver/Playngo/Crystal-Sun.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(638, '7783', 'CopsnRobbers', '/PlayFiver/Playngo/CopsnRobbers.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(639, '7782', 'Coils of Cash', '/PlayFiver/Playngo/Coils-of-Cash.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(640, '7781', 'Charlie Chance', '/PlayFiver/Playngo/Charlie-Chance.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(641, '7780', 'Cat Wilde and the Doom of Dead', '/PlayFiver/Playngo/Cat-Wilde-and-the-Doom-of-Dead.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(642, '7779', 'Book of Dead', '/PlayFiver/Playngo/Book-of-Dead.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(643, '7778', 'Blinged', '/PlayFiver/Playngo/Blinged.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(644, '7777', 'Aztec Idols', '/PlayFiver/Playngo/Aztec-Idols.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(645, '7776', '5xMagic', '/PlayFiver/Playngo/5xMagic.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(646, '7775', '3 Clown Monty', '/PlayFiver/Playngo/3-Clown-Monty.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(647, '8107', 'Blazin Bullfrog', '/PlayFiver/Playngo/Blazin-Bullfrog.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(648, '8106', 'Big win 777', '/PlayFiver/Playngo/Big-win-777.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(649, '8127', 'Leprechauns Vault', '/PlayFiver/Playngo/Leprechauns-Vault.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(650, '8142', 'Athena Ascending', '/PlayFiver/Playngo/Athena-Ascending.png', 1, 'PLAYNGO', 0, 'slot', 0, 'apipp38', 0),
(651, '72', 'Twin Spin', '/PlayFiver/NetEnt/Twin-Spin.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(652, '7194', 'Twin Spin Deluxe', '/PlayFiver/NetEnt/Twin-Spin-Deluxe.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(653, '7109', 'Twin Spin MegaWays', '/PlayFiver/NetEnt/Twin-Spin-MegaWays.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(654, '7108', 'Vegas Night Life', '/PlayFiver/NetEnt/Vegas-Night-Life.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(656, '7160', 'Vikings', '/PlayFiver/NetEnt/Vikings.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(657, '7165', 'Wild Bazaar', '/PlayFiver/NetEnt/Wild-Bazaar.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(658, '7107', 'Wilderland', '/PlayFiver/NetEnt/Wilderland.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(659, '7154', 'Wild Turkey', '/PlayFiver/NetEnt/Wild-Turkey.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(661, '7150', 'Wild Worlds', '/PlayFiver/NetEnt/Wild-Worlds.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(662, '7123', 'Wings of Riches', '/PlayFiver/NetEnt/Wings-of-Riches.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(663, '7102', 'Wonderland Protector', '/PlayFiver/NetEnt/Wonderland-Protector.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(664, '441', 'King of Slots', '/PlayFiver/NetEnt/King-of-Slots.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(665, '7178', 'Lost Relics', '/PlayFiver/NetEnt/Lost-Relics.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(666, '7188', 'Lucky Angler', '/PlayFiver/NetEnt/Lucky-Angler.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(667, '533', 'Magic Portals', '/PlayFiver/NetEnt/Magic-Portals.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(668, '4164', 'Motorhead', '/PlayFiver/NetEnt/Motorhead.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(669, '7174', 'Mr Green: Grand Tour', '/PlayFiver/NetEnt/Mr-Green_-Grand-Tour.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(670, '7173', 'Mr Green: Moonlight', '/PlayFiver/NetEnt/Mr-Green_-Moonlight.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(671, '7125', 'Ozzy Osbourne', '/PlayFiver/NetEnt/Ozzy-Osbourne.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(673, '7186', 'Planet of the Apes', '/PlayFiver/NetEnt/Planet-of-the-Apes.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(674, '7127', 'Reel Rush 2', '/PlayFiver/NetEnt/Reel-Rush-2.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(675, '26', 'Reel Rush', '/PlayFiver/NetEnt/Reel-Rush.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(676, '7106', 'Riches of Midgard', '/PlayFiver/NetEnt/Riches-of-Midgard.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(677, '7122', 'Rise of Maya', '/PlayFiver/NetEnt/Rise-of-Maya.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(678, '7152', 'Robin Hood', '/PlayFiver/NetEnt/Robin-Hood.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(679, '7124', 'Santa vs Rudolf', '/PlayFiver/NetEnt/Santa-vs-Rudolf.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(680, '7197', 'Scruffy Duck', '/PlayFiver/NetEnt/Scruffy-Duck.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(681, '7187', 'Secret Of The Stones', '/PlayFiver/NetEnt/Secret-Of-The-Stones.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(682, '4163', 'Secrets of Atlantis', '/PlayFiver/NetEnt/Secrets-of-Atlantis.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(683, '179', 'StarBurst', '/PlayFiver/NetEnt/StarBurst.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(684, '7112', 'Street Fighter II: The World Warrior', '/PlayFiver/NetEnt/Street-Fighter-II_-The-World-Warrior.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(685, '7157', 'Strolling Staxx', '/PlayFiver/NetEnt/Strolling-Staxx.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(686, '7111', 'Super Striker', '/PlayFiver/NetEnt/Super-Striker.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(687, '7053', 'Sweety Honey Fruity', '/PlayFiver/NetEnt/Sweety-Honey-Fruity.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(688, '7172', 'Swipe & Roll', '/PlayFiver/NetEnt/Swipe-&-Roll.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(689, '7130', 'The Wish Master', '/PlayFiver/NetEnt/The-Wish-Master.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(690, '7110', 'Trollpot 5000', '/PlayFiver/NetEnt/Trollpot-5000.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(691, '7158', 'Turn Your Fortune', '/PlayFiver/NetEnt/Turn-Your-Fortune.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(692, '7055', 'Twin Happiness', '/PlayFiver/NetEnt/Twin-Happiness.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(693, '7170', 'Jumanji', '/PlayFiver/NetEnt/Jumanji.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(694, '7133', 'King of 3 Kingdoms', '/PlayFiver/NetEnt/King-of-3-Kingdoms.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(695, '7126', 'Long Pao', '/PlayFiver/NetEnt/Long-Pao.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(696, '7128', 'Magic Maid Cafe', '/PlayFiver/NetEnt/Magic-Maid-Cafe.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(697, '544', 'Reel Steal', '/PlayFiver/NetEnt/Reel-Steal.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(698, '489', 'Jimi Hendrix', '/PlayFiver/NetEnt/Jimi-Hendrix.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(699, '7159', 'Jingle Spin', '/PlayFiver/NetEnt/Jingle-Spin.png', 1, 'NETENT', 0, 'slot', 0, 'apipp38', 0),
(752, 'hand_of_gold', 'HAND OF GOLD', '/PlayFiver/Playson/hand_of_gold.png', 1, 'PLAYSON', 0, 'slot', 0, 'apipp38', 0),
(753, 'legend_of_cleopatra', 'LEGEND OF CLEOPATRA', '/PlayFiver/Playson/legend_of_cleopatra.png', 1, 'PLAYSON', 0, 'slot', 0, 'apipp38', 0),
(754, '40_joker_staxx', '40 JOKER STAXX', '/PlayFiver/Playson/40_joker_staxx.png', 1, 'PLAYSON', 0, 'slot', 0, 'apipp38', 0),
(755, 'burning_wins', 'BURNING WINS', '/PlayFiver/Playson/burning_wins.png', 1, 'PLAYSON', 0, 'slot', 0, 'apipp38', 0),
(756, 'book_of_gold', 'BOOK OF GOLD', '/PlayFiver/Playson/book_of_gold.png', 1, 'PLAYSON', 0, 'slot', 0, 'apipp38', 0),
(757, '100_joker_staxx', '100 JOKER STAXX', '/PlayFiver/Playson/100_joker_staxx.png', 1, 'PLAYSON', 0, 'slot', 0, 'apipp38', 0),
(758, 'book_of_gold_classic', 'BOOK OF GOLD CLASSIC', '/PlayFiver/Playson/book_of_gold_classic.png', 1, 'PLAYSON', 0, 'slot', 0, 'apipp38', 0),
(759, 'buffalo_xmas', 'BUFFALO XMAS', '/PlayFiver/Playson/buffalo_xmas.png', 1, 'PLAYSON', 0, 'slot', 0, 'apipp38', 0),
(761, '1hl323e1lxuqdrkr', 'AUTO_MEGA_ROULETTE', '/PlayFiver/Pragmaticlive/1hl323e1lxuqdrkr.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(762, '1hl65ce1lxuqdrkr', 'MEGA_ROULETTE', '/PlayFiver/Pragmaticlive/1hl65ce1lxuqdrkr.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(763, '5bzl2835s5ruvweg', 'AUTO_ROULETTE', '/PlayFiver/Pragmaticlive/5bzl2835s5ruvweg.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(764, 'autorwra311autor', 'SPEED_AUTO_ROULETTE', '/PlayFiver/Pragmaticlive/autorwra311autor.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(765, 'chroma229rwltr22', 'ROULETTE_RUBY', '/PlayFiver/Pragmaticlive/chroma229rwltr22.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(766, 'fl9knouu0yjez2wi', 'SPEED_ROULETTE_1', '/PlayFiver/Pragmaticlive/fl9knouu0yjez2wi.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(767, 'g03y1t9vvuhrfytl', 'ROULETTE_AZURE', '/PlayFiver/Pragmaticlive/g03y1t9vvuhrfytl.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(768, 'lucky6roulettea3', 'LUCKY_6_ROULETTE', '/PlayFiver/Pragmaticlive/lucky6roulettea3.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(769, 'p8l1j84prrmxzyic', 'TURKISH_ROULETTE', '/PlayFiver/Pragmaticlive/p8l1j84prrmxzyic.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(770, 'r20speedrtwo201s', 'SPEED_ROULETTE_2', '/PlayFiver/Pragmaticlive/r20speedrtwo201s.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(771, 'rmycjoqq18k2r161', 'ROULETTE_INDIAN', '/PlayFiver/Pragmaticlive/rmycjoqq18k2r161.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(772, 'romania233rwl291', 'ROMANIAN_ROULETTE', '/PlayFiver/Pragmaticlive/romania233rwl291.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(773, 'roulerw234rwl292', 'SPANISH_ROULETTE', '/PlayFiver/Pragmaticlive/roulerw234rwl292.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(774, 's2x6b4jdeqza2ge2', 'GERMAN_ROULETTE', '/PlayFiver/Pragmaticlive/s2x6b4jdeqza2ge2.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(775, 't4jzencinod6iqwi', 'RUSSIAN_ROULETTE', '/PlayFiver/Pragmaticlive/t4jzencinod6iqwi.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(776, 'v1c52fgw7yy02upz', 'ROULETTE_ITALIA_TRICOLORE', '/PlayFiver/Pragmaticlive/v1c52fgw7yy02upz.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(777, 'yqpz3ichst2xg439', 'ROULETTE_MACAO', '/PlayFiver/Pragmaticlive/yqpz3ichst2xg439.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(778, '2q57e43m4ivqwaq3', 'SPEED_BACCARAT_6', '/PlayFiver/Pragmaticlive/2q57e43m4ivqwaq3.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(779, '886ewimul28yw14j', 'SPEED_BACCARAT_5', '/PlayFiver/Pragmaticlive/886ewimul28yw14j.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(780, '9j3eagurfwmml7z2', 'BACCARAT_2', '/PlayFiver/Pragmaticlive/9j3eagurfwmml7z2.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(781, 'b0jf7rlboleibnap', 'SPEED_BACCARAT_14', '/PlayFiver/Pragmaticlive/b0jf7rlboleibnap.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(782, 'bcapuntobanco001', 'PUNTO_BANCO_ITALIA_TRICOLORE', '/PlayFiver/Pragmaticlive/bcapuntobanco001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(783, 'bcpirpmfpeobc191', 'BACCARAT_7', '/PlayFiver/Pragmaticlive/bcpirpmfpeobc191.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(784, 'bcpirpmfpeobc192', 'BACCARAT_8', '/PlayFiver/Pragmaticlive/bcpirpmfpeobc192.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(785, 'bcpirpmfpeobc193', 'SPEED_BACCARAT_15', '/PlayFiver/Pragmaticlive/bcpirpmfpeobc193.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(786, 'bcpirpmfpeobc194', 'SPEED_BACCARAT_10', '/PlayFiver/Pragmaticlive/bcpirpmfpeobc194.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(787, 'bcpirpmfpeobc196', 'SPEED_BACCARAT_9', '/PlayFiver/Pragmaticlive/bcpirpmfpeobc196.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(788, 'bcpirpmfpeobc197', 'SPEED_BACCARAT_7', '/PlayFiver/Pragmaticlive/bcpirpmfpeobc197.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(789, 'bcpirpmfpeobc198', 'SPEED_BACCARAT_8', '/PlayFiver/Pragmaticlive/bcpirpmfpeobc198.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(790, 'bcpirpmfpeobc199', 'SUPER_8_BACCARAT', '/PlayFiver/Pragmaticlive/bcpirpmfpeobc199.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(791, 'bcpirpmfpobc1910', 'FORTUNE_6_BACCARAT', '/PlayFiver/Pragmaticlive/bcpirpmfpobc1910.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(792, 'bcpirpmfpobc1912', 'BACCARAT_9', '/PlayFiver/Pragmaticlive/bcpirpmfpobc1912.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(793, 'cbcf6qas8fscb221', 'SPEED_BACCARAT_12', '/PlayFiver/Pragmaticlive/cbcf6qas8fscb221.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(794, 'cbcf6qas8fscb222', 'BACCARAT_3', '/PlayFiver/Pragmaticlive/cbcf6qas8fscb222.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(795, 'cbcf6qas8fscb224', 'SPEED_BACCARAT_11', '/PlayFiver/Pragmaticlive/cbcf6qas8fscb224.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(796, 'h22z8qhp17sa0vkh', 'BACCARAT_1', '/PlayFiver/Pragmaticlive/h22z8qhp17sa0vkh.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(797, 'kkqnazmd8ttq7fgd', 'SPEED_BACCARAT_2', '/PlayFiver/Pragmaticlive/kkqnazmd8ttq7fgd.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(798, 'm88hicogrzeod202', 'SPEED_BACCARAT_13', '/PlayFiver/Pragmaticlive/m88hicogrzeod202.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(799, 'mbc371rpmfmbc371', 'MEGA_BACCARAT', '/PlayFiver/Pragmaticlive/mbc371rpmfmbc371.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(800, 'ne074fgn4bd1150i', 'BACCARAT_5', '/PlayFiver/Pragmaticlive/ne074fgn4bd1150i.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(801, 'oq808ojps709qqaf', 'BACCARAT_6', '/PlayFiver/Pragmaticlive/oq808ojps709qqaf.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(802, 'pwnhicogrzeodk79', 'SPEED_BACCARAT_1', '/PlayFiver/Pragmaticlive/pwnhicogrzeodk79.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(803, 's8s9f0quk3ygiyb1', 'SPEED_BACCARAT_3', '/PlayFiver/Pragmaticlive/s8s9f0quk3ygiyb1.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(804, 'lc419kkmr2sxfpbk', 'MEGA_SIC_BO', '/PlayFiver/Pragmaticlive/lc419kkmr2sxfpbk.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(805, 'sba71kkmr2ssba71', 'SICBO', '/PlayFiver/Pragmaticlive/sba71kkmr2ssba71.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(806, 'md500q83g7cdefw1', 'MEGA_WHEEL', '/PlayFiver/Pragmaticlive/md500q83g7cdefw1.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(807, 'ge49e4os88bp4bi5', 'DRAGON_TIGER', '/PlayFiver/Pragmaticlive/ge49e4os88bp4bi5.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(808, 'pbvzrfk1fyft4dwe', 'SWEET_BONANZA_CANDYLAND', '/PlayFiver/Pragmaticlive/pbvzrfk1fyft4dwe.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(809, 'jzbzy021lg8xy9i2', 'ANDAR_BAHAR', '/PlayFiver/Pragmaticlive/jzbzy021lg8xy9i2.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(810, 'bigbassnewbb1320', 'BIG_BASS_CRASH', '/PlayFiver/Pragmaticlive/bigbassnewbb1320.png', 1, '26595015200105', 0, 'fish', 0, 'apipp38', 0),
(811, 'spacemanyxe123nh', 'SPACEMAN', '/PlayFiver/Pragmaticlive/spacemanyxe123nh.png', 1, '26595015200105', 0, 'block', 0, 'apipp38', 0),
(813, 'WildTriads', 'WildTriads', '/PlayFiver/Toptrend/WildTriads.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(814, 'GoldenDragon', 'Golden Dragon', '/PlayFiver/Toptrend/GoldenDragon.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(815, 'ReelsOfFortune', 'Reels Of Fortune', '/PlayFiver/Toptrend/ReelsOfFortune.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(816, 'GoldenAmazon', 'Golden Amazon', '/PlayFiver/Toptrend/GoldenAmazon.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(817, 'MonkeyLuck', 'MonkeyLuck', '/PlayFiver/Toptrend/MonkeyLuck.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(818, 'LeagueOfChampions', 'League Of Champions', '/PlayFiver/Toptrend/LeagueOfChampions.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(819, 'MadMonkeyH5', 'MadMonkey', '/PlayFiver/Toptrend/MadMonkeyH5.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(820, 'DynastyEmpire', 'Dynasty Empire', '/PlayFiver/Toptrend/DynastyEmpire.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(821, 'SuperKids', 'SuperKids', '/PlayFiver/Toptrend/SuperKids.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(822, 'HotVolcanoH5', 'HotVolcano', '/PlayFiver/Toptrend/HotVolcanoH5.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(823, 'Huluwa', 'Huluwa', '/PlayFiver/Toptrend/Huluwa.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(824, 'LegendOfLinkH5', 'LegendOfLink', '/PlayFiver/Toptrend/LegendOfLinkH5.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(825, 'DetectiveBlackCat', 'DetectiveBlackCat', '/PlayFiver/Toptrend/DetectiveBlackCat.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(826, 'ChilliGoldH5', 'Chilli Gold', '/PlayFiver/Toptrend/ChilliGoldH5.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(827, 'SilverLionH5', 'Silver Lion', '/PlayFiver/Toptrend/SilverLionH5.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(828, 'ThunderingZeus', 'ThunderingZeus', '/PlayFiver/Toptrend/ThunderingZeus.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(829, 'DragonPalaceH5', 'Dragon Palace', '/PlayFiver/Toptrend/DragonPalaceH5.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(830, 'MadMonkey2', 'MadMonkey', '/PlayFiver/Toptrend/MadMonkey2.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(831, 'MedusaCurse', 'Medusa Curse', '/PlayFiver/Toptrend/MedusaCurse.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(832, 'BattleHeroes', 'Battle Heroes', '/PlayFiver/Toptrend/BattleHeroes.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(833, 'NeptunesGoldH5', 'Neptunes Gold', '/PlayFiver/Toptrend/NeptunesGoldH5.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(834, 'HeroesNeverDie', 'Heroes Never Die', '/PlayFiver/Toptrend/HeroesNeverDie.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(835, 'WildWildWitch', 'Wild Wild Witch', '/PlayFiver/Toptrend/WildWildWitch.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(836, 'WildKartRacers', 'Wild Kart Racers', '/PlayFiver/Toptrend/WildKartRacers.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(837, 'KingDinosaur', 'KingDinosaur', '/PlayFiver/Toptrend/KingDinosaur.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(838, 'GoldenGenie', 'GoldenGenie', '/PlayFiver/Toptrend/GoldenGenie.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(839, 'UltimateFighter', 'UltimateFighter', '/PlayFiver/Toptrend/UltimateFighter.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(840, 'EverlastingSpins', 'EverlastingSpins', '/PlayFiver/Toptrend/EverlastingSpins.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(841, 'Zoomania', 'Zoomania', '/PlayFiver/Toptrend/Zoomania.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(842, 'LaserCats', 'Laser Cats', '/PlayFiver/Toptrend/LaserCats.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(843, 'DiamondFortune', 'DiamondFortune', '/PlayFiver/Toptrend/DiamondFortune.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(844, 'GoldenClaw', 'GoldenClaw', '/PlayFiver/Toptrend/GoldenClaw.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(845, 'PandaWarrior', 'PandaWarrior', '/PlayFiver/Toptrend/PandaWarrior.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(846, 'RoyalGoldenDragon', 'RoyalGoldenDragon', '/PlayFiver/Toptrend/RoyalGoldenDragon.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(847, 'MegaMaya', 'MegaMaya', '/PlayFiver/Toptrend/MegaMaya.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(848, 'MegaPhoenix', 'MegaPhoenix', '/PlayFiver/Toptrend/MegaPhoenix.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(849, 'DolphinGoldH5', 'DolphinGold', '/PlayFiver/Toptrend/DolphinGoldH5.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(850, 'DragonKingH5', 'DragonKing', '/PlayFiver/Toptrend/DragonKingH5.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(851, 'LuckyPandaH5', 'LuckyPanda', '/PlayFiver/Toptrend/LuckyPandaH5.png', 1, 'TOPTREND', 0, 'slot', 0, 'apipp38', 0),
(852, 'btball5x20', 'Crazy Basketball', '/PlayFiver/Dreamtech/btball5x20.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(853, 'dnp', 'DragonPhoenix Prosper', '/PlayFiver/Dreamtech/dnp.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(854, 'crystal', 'Glory of Heroes', '/PlayFiver/Dreamtech/crystal.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(855, 'fls', 'FULUSHOU', '/PlayFiver/Dreamtech/fls.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(856, 'fourss', 'Four Holy Beasts', '/PlayFiver/Dreamtech/fourss.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(857, 'casino', '3D Slot', '/PlayFiver/Dreamtech/casino.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(858, 'crazy5x243', 'Crazy GO GO GO', '/PlayFiver/Dreamtech/crazy5x243.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(859, 'rocknight', 'RocknRoll Night', '/PlayFiver/Dreamtech/rocknight.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(860, 'bluesea', 'Blue Sea', '/PlayFiver/Dreamtech/bluesea.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(861, 'circus', 'Crazy Circus', '/PlayFiver/Dreamtech/circus.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(862, 'bikini', 'Bikini Party', '/PlayFiver/Dreamtech/bikini.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(863, 'foryouth5x25', 'SO YOUNG', '/PlayFiver/Dreamtech/foryouth5x25.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(864, 'fourbeauty', 'Four Beauties', '/PlayFiver/Dreamtech/fourbeauty.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(865, 'sweethouse', 'Candy House', '/PlayFiver/Dreamtech/sweethouse.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(866, 'legend5x25', 'Legend of the King', '/PlayFiver/Dreamtech/legend5x25.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(867, 'opera', 'Beijing opera', '/PlayFiver/Dreamtech/opera.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(868, 'bigred', 'Big Red', '/PlayFiver/Dreamtech/bigred.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(869, 'wrathofthor', 'Wrath of Thor', '/PlayFiver/Dreamtech/wrathofthor.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(870, 'boxingarena', 'Boxing Arena', '/PlayFiver/Dreamtech/boxingarena.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(871, 'fantasyforest', 'Elf Kingdom', '/PlayFiver/Dreamtech/fantasyforest.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(872, 'egyptian', 'Egyptian Empire', '/PlayFiver/Dreamtech/egyptian.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(873, 'hotpotfeast', 'Hotpot Feast', '/PlayFiver/Dreamtech/hotpotfeast.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(874, 'magician', 'Magician', '/PlayFiver/Dreamtech/magician.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(875, 'galaxywars', 'Galaxy Wars', '/PlayFiver/Dreamtech/galaxywars.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(876, 'easyrider', 'Easy Rider', '/PlayFiver/Dreamtech/easyrider.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(877, 'goldjade5x50', 'Jin Yu Man Tang', '/PlayFiver/Dreamtech/goldjade5x50.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(878, 'shokudo', 'shokudo', '/PlayFiver/Dreamtech/shokudo.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(879, 'train', 'Treasure Hunt Trip', '/PlayFiver/Dreamtech/train.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(880, 'lovefighters', 'Love Fighters', '/PlayFiver/Dreamtech/lovefighters.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(881, 'genie', 'Aladdin s Wish', '/PlayFiver/Dreamtech/genie.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(882, 'garden', 'Little Big Garden', '/PlayFiver/Dreamtech/garden.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(883, 'alchemist', 'Crazy Alchemist', '/PlayFiver/Dreamtech/alchemist.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(884, 'dinosaur5x25', 'Dinosaur World', '/PlayFiver/Dreamtech/dinosaur5x25.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(885, 'tombshadow', 'Tomb Shadow', '/PlayFiver/Dreamtech/tombshadow.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(886, 'clash', 'Clash of Three kingdoms', '/PlayFiver/Dreamtech/clash.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(887, 'magicbean', 'Magic Bean Legend', '/PlayFiver/Dreamtech/magicbean.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(888, 'secretdate', 'Secret Date', '/PlayFiver/Dreamtech/secretdate.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(889, 'bacteria', 'Germ Lab', '/PlayFiver/Dreamtech/bacteria.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(890, 'baseball', 'Baseball Frenzy', '/PlayFiver/Dreamtech/baseball.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(891, 'mysticalstones', 'Mystical Stones', '/PlayFiver/Dreamtech/mysticalstones.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(892, 'sincity', 'Sin City', '/PlayFiver/Dreamtech/sincity.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(893, 'wheel', 'Secrets of The Pentagram', '/PlayFiver/Dreamtech/wheel.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0);
INSERT INTO `games` (`id`, `game_code`, `game_name`, `banner`, `status`, `provider`, `popular`, `type`, `game_type`, `distribution`, `ordem`) VALUES
(894, 'westwild', 'West Wild', '/PlayFiver/Dreamtech/westwild.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(895, 'halloween', 'Witch Winnings', '/PlayFiver/Dreamtech/halloween.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(896, 'bloodmoon', 'Blood Wolf legend', '/PlayFiver/Dreamtech/bloodmoon.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(897, 'dragonball2', 'Heroes of the East', '/PlayFiver/Dreamtech/dragonball2.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(898, 'muaythai', 'Muaythai', '/PlayFiver/Dreamtech/muaythai.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(899, 'sailor', 'Sailor Princess', '/PlayFiver/Dreamtech/sailor.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(900, 'nightclub', 'Infinity Club', '/PlayFiver/Dreamtech/nightclub.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(901, 'nezha', 'Nezha Legend', '/PlayFiver/Dreamtech/nezha.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(902, 'bird', 'Bird Island', '/PlayFiver/Dreamtech/bird.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(903, 'honor', 'Field Of Honor', '/PlayFiver/Dreamtech/honor.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(904, 'train2', 'Treasure Hunt Trip 2', '/PlayFiver/Dreamtech/train2.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(905, 'shiningstars', 'ShiningStars', '/PlayFiver/Dreamtech/shiningstars.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(906, 'tgow2plus', 'Cai Shen Dao Plus', '/PlayFiver/Dreamtech/tgow2plus.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(907, 'peeping', 'Peeping', '/PlayFiver/Dreamtech/peeping.png', 1, 'DREAMTECH', 0, 'slot', 0, 'apipp38', 0),
(908, 'greatwall', 'The Great Wall Treasure', '/PlayFiver/Evoplay/greatwall.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(909, 'chinesenewyear', 'Chinese New Year', '/PlayFiver/Evoplay/chinesenewyear.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(910, 'jewellerystore', 'Jewelry store', '/PlayFiver/Evoplay/jewellerystore.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(911, 'redcliff', 'Red cliff', '/PlayFiver/Evoplay/redcliff.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(912, 'ElvenPrincesses', 'Elven Princess', '/PlayFiver/Evoplay/ElvenPrincesses.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(913, 'robinzon', 'Robinson', '/PlayFiver/Evoplay/robinzon.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(914, 'aeronauts', 'Aeronauts', '/PlayFiver/Evoplay/aeronauts.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(915, 'monsterlab', 'Monster rap', '/PlayFiver/Evoplay/monsterlab.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(916, 'TriptotheFuture', 'Trip to the Future', '/PlayFiver/Evoplay/TriptotheFuture.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(917, 'NukeWorld', 'Nook World', '/PlayFiver/Evoplay/NukeWorld.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(918, 'legendofkaan', 'Legend of Khan', '/PlayFiver/Evoplay/legendofkaan.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(919, 'LivingTales', 'Night of the Living Tales', '/PlayFiver/Evoplay/LivingTales.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(920, 'IceMania', 'Ice mania', '/PlayFiver/Evoplay/IceMania.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(921, 'ValleyOfDreams', 'Valley of Dreams', '/PlayFiver/Evoplay/ValleyOfDreams.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(922, 'FruitNova', 'Fruit Nova', '/PlayFiver/Evoplay/FruitNova.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(923, 'TreeOfLight', 'Tree of light', '/PlayFiver/Evoplay/TreeOfLight.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(924, 'TempleOfDead', 'Temple of the dead', '/PlayFiver/Evoplay/TempleOfDead.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(925, 'RunesOfDestiny', 'Runes of Destiny', '/PlayFiver/Evoplay/RunesOfDestiny.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(926, 'EllensFortune', 'Ellen Fortune', '/PlayFiver/Evoplay/EllensFortune.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(927, 'UnlimitedWishes', 'Unlimited Wishes', '/PlayFiver/Evoplay/UnlimitedWishes.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(928, 'FoodFeast', 'Food fist', '/PlayFiver/Evoplay/FoodFeast.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(929, 'EpicLegends', 'Epic legends', '/PlayFiver/Evoplay/EpicLegends.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(930, 'SweetSugar', 'Sweet sugar', '/PlayFiver/Evoplay/SweetSugar.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(931, 'CycleofLuck', 'Cycle of Luck', '/PlayFiver/Evoplay/CycleofLuck.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(932, 'GangsterNight', 'Gangster night', '/PlayFiver/Evoplay/GangsterNight.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(933, 'GoldOfSirens', 'Gold of sirens', '/PlayFiver/Evoplay/GoldOfSirens.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(934, 'BloodyBrilliant', 'Bloody brilliant', '/PlayFiver/Evoplay/BloodyBrilliant.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(935, 'TempleOfDeadBonusBuy', 'Temple of the Dead BB', '/PlayFiver/Evoplay/TempleOfDeadBonusBuy.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(936, 'ShadowOfLuxor', 'Shadow of Luxor', '/PlayFiver/Evoplay/ShadowOfLuxor.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(937, 'CycleofLuckBonusBuy', 'Cycle of Luck BB', '/PlayFiver/Evoplay/CycleofLuckBonusBuy.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(938, 'AnubisMoon', 'Anubis moon', '/PlayFiver/Evoplay/AnubisMoon.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(939, 'FruitDisco', 'Fruit disco', '/PlayFiver/Evoplay/FruitDisco.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(940, 'FruitSuperNova30', 'Fruit Super Nova 30', '/PlayFiver/Evoplay/FruitSuperNova30.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(941, 'CurseOfThePharaoh', 'Curse of the Pharaoh', '/PlayFiver/Evoplay/CurseOfThePharaoh.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(942, 'GoldOfSirensBonusBuy', 'Gold of Sirens BB', '/PlayFiver/Evoplay/GoldOfSirensBonusBuy.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(943, 'FruitSuperNova60', 'Fruit Super Nova 60', '/PlayFiver/Evoplay/FruitSuperNova60.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(944, 'CurseofthePharaohBonusBuy', 'Curse of the Pharaoh BB', '/PlayFiver/Evoplay/CurseofthePharaohBonusBuy.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(945, 'FruitSuperNova100', 'Fruit Super Nova 100', '/PlayFiver/Evoplay/FruitSuperNova100.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(946, 'FruitSuperNova80', 'Whoft Super Nova 80', '/PlayFiver/Evoplay/FruitSuperNova80.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(947, 'DragonsTavern', 'Dragons Tavern', '/PlayFiver/Evoplay/DragonsTavern.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(948, 'ChristmasReachBonusBuy', 'Christmas Riti BB', '/PlayFiver/Evoplay/ChristmasReachBonusBuy.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(949, 'WildOverlords', 'Wild overlord', '/PlayFiver/Evoplay/WildOverlords.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(950, 'DragonsTavernBonusBuy', 'Dragons Tavern BB', '/PlayFiver/Evoplay/DragonsTavernBonusBuy.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(951, 'BudaiReels', 'Budai reels', '/PlayFiver/Evoplay/BudaiReels.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(952, 'BudaiReelsBonusBuy', 'Budai Lils BB', '/PlayFiver/Evoplay/BudaiReelsBonusBuy.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(953, 'MoneyMinter', 'Money minter', '/PlayFiver/Evoplay/MoneyMinter.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(954, 'TheGreatestCatch', 'The Greatest Catch', '/PlayFiver/Evoplay/TheGreatestCatch.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(955, 'TreeOfLightBB', 'Tree of Light BB', '/PlayFiver/Evoplay/TreeOfLightBB.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(956, 'WolfHiding', 'Wolf Hiding', '/PlayFiver/Evoplay/WolfHiding.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(957, 'CaminoDeChili', 'Camino de Chili', '/PlayFiver/Evoplay/CaminoDeChili.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(958, 'CandyDreamsSweetPlanet', 'candy dreams', '/PlayFiver/Evoplay/CandyDreamsSweetPlanet.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(959, 'WildOverlordsBonusBuy', 'Wild Overlord BB', '/PlayFiver/Evoplay/WildOverlordsBonusBuy.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(960, 'TempleOfThunder', 'Temple of Thunder', '/PlayFiver/Evoplay/TempleOfThunder.png', 1, 'EVOPLAY', 0, 'slot', 0, 'apipp38', 0),
(961, 'sun_of_egypt', 'SUN OF EGYPT', '/PlayFiver/Booongo/sun_of_egypt.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(962, 'sun_of_egypt_2', 'SUN OF EGYPT 2', '/PlayFiver/Booongo/sun_of_egypt_2.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(963, 'happy_fish', 'HAPPY FISH', '/PlayFiver/Booongo/happy_fish.png', 1, 'BOOONGO', 0, 'fish', 0, 'apipp38', 0),
(964, 'queen_of_the_sun', 'QUEEN OF THE SUN', '/PlayFiver/Booongo/queen_of_the_sun.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(965, 'tiger_jungle', 'TIGER JUNGLE', '/PlayFiver/Booongo/tiger_jungle.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(966, 'black_wolf', 'BLACK WOLF', '/PlayFiver/Booongo/black_wolf.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(967, 'hit_the_gold', 'HIT THE GOLD', '/PlayFiver/Booongo/hit_the_gold.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(968, 'candy_boom', 'CANDY BOOM', '/PlayFiver/Booongo/candy_boom.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(969, 'scarab_riches', 'SCARAB RICHES', '/PlayFiver/Booongo/scarab_riches.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(970, 'golden_dancing_lion', 'GOLDEN DANCING LION', '/PlayFiver/Booongo/golden_dancing_lion.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(971, 'dragon_pearls', 'DRAGON PEARLS', '/PlayFiver/Booongo/dragon_pearls.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(972, '3_coins', '3 COINS', '/PlayFiver/Booongo/3_coins.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(973, 'super_rich_god', 'SUPER RICH GOD', '/PlayFiver/Booongo/super_rich_god.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(974, '15_dragon_pearls', '15 DRAGON PEARLS', '/PlayFiver/Booongo/15_dragon_pearls.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(975, 'aztec_sun', 'AZTEC SUN', '/PlayFiver/Booongo/aztec_sun.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(976, 'scarab_temple', 'SCARAB TEMPLE', '/PlayFiver/Booongo/scarab_temple.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(977, 'gods_temple_deluxe', 'GODS TEMPLE DELUXE', '/PlayFiver/Booongo/gods_temple_deluxe.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(978, 'book_of_sun', 'BOOK OF SUN', '/PlayFiver/Booongo/book_of_sun.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(979, '777_gems', '777 GEMS', '/PlayFiver/Booongo/777_gems.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(980, 'book_of_sun_multichance', 'BOOK OF SUN MULTICHANCE', '/PlayFiver/Booongo/book_of_sun_multichance.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(981, 'olympian_gods', 'OLYMPIAN GODS', '/PlayFiver/Booongo/olympian_gods.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(982, '777_gems_respin', '777 GEMS RESPIN', '/PlayFiver/Booongo/777_gems_respin.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(983, 'tigers_gold', 'TIGERS GOLD', '/PlayFiver/Booongo/tigers_gold.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(984, 'moon_sisters', 'MOON SISTERS', '/PlayFiver/Booongo/moon_sisters.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(985, 'book_of_sun_choice', 'BOOK OF SUN CHOICE', '/PlayFiver/Booongo/book_of_sun_choice.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(986, 'super_marble', 'SUPER MARBLE', '/PlayFiver/Booongo/super_marble.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(987, 'buddha_fortune', 'BUDDHA FORTUNE', '/PlayFiver/Booongo/buddha_fortune.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(988, 'great_panda', 'GREAT PANDA', '/PlayFiver/Booongo/great_panda.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(989, '15_golden_eggs', '15 GOLDEN EGGS', '/PlayFiver/Booongo/15_golden_eggs.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(990, 'thunder_of_olympus', 'THUNDER OF OLYMPUS', '/PlayFiver/Booongo/thunder_of_olympus.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(991, 'eye_of_gold', 'EYE OF GOLD', '/PlayFiver/Booongo/eye_of_gold.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(992, 'tiger_stone', 'TIGER STONE', '/PlayFiver/Booongo/tiger_stone.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(993, 'magic_apple', 'MAGIC APPLE', '/PlayFiver/Booongo/magic_apple.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(994, 'wolf_saga', 'WOLF SAGA', '/PlayFiver/Booongo/wolf_saga.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(995, 'magic_ball', 'MAGIC BALL', '/PlayFiver/Booongo/magic_ball.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(996, 'scarab_boost', 'SCARAB BOOST', '/PlayFiver/Booongo/scarab_boost.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(997, 'wukong', 'WUKONG', '/PlayFiver/Booongo/wukong.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(998, 'pearl_diver', 'PEARL DIVER', '/PlayFiver/Booongo/pearl_diver.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(999, '3_coins_egypt', '3 COINS EGYPT', '/PlayFiver/Booongo/3_coins_egypt.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(1000, 'ganesha_boost', 'GANESHA BOOST', '/PlayFiver/Booongo/ganesha_boost.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(1001, 'wolf_night', 'WOLF NIGHT', '/PlayFiver/Booongo/wolf_night.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(1002, 'book_of_wizard', 'BOOK OF WIZARD', '/PlayFiver/Booongo/book_of_wizard.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(1003, 'lord_fortune_2', 'LORD FORTUNE 2', '/PlayFiver/Booongo/lord_fortune_2.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(1004, 'gold_express', 'GOLD EXPRESS', '/PlayFiver/Booongo/gold_express.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(1005, 'book_of_wizard_crystal', 'BOOK OF WIZARD CRYSTAL', '/PlayFiver/Booongo/book_of_wizard_crystal.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(1006, 'pearl_diver_2', 'PEARL DIVER 2', '/PlayFiver/Booongo/pearl_diver_2.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(1007, 'sun_of_egypt_3', 'SUN OF EGYPT 3', '/PlayFiver/Booongo/sun_of_egypt_3.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(1008, 'caishen_wealth', 'CAISHEN WEALTH', '/PlayFiver/Booongo/caishen_wealth.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(1009, 'aztec_fire', 'AZTEC FIRE', '/PlayFiver/Booongo/aztec_fire.png', 1, 'BOOONGO', 0, 'slot', 0, 'apipp38', 0),
(1010, '67', 'Golden eggs', '/PlayFiver/Cq9/67.png', 1, 'CQ9', 0, 'slot', 0, 'apipp38', 0),
(1011, '161', 'Hercules', '/PlayFiver/Cq9/161.png', 1, 'CQ10', 0, 'slot', 0, 'apipp38', 0),
(1012, '16', 'Super 5', '/PlayFiver/Cq9/16.png', 1, 'CQ11', 0, 'slot', 0, 'apipp38', 0),
(1013, '72', 'Happy Rich Year', '/PlayFiver/Cq9/72.png', 1, 'CQ12', 0, 'slot', 0, 'apipp38', 0),
(1014, '1', 'Fruit King', '/PlayFiver/Cq9/1.png', 1, 'CQ13', 0, 'slot', 0, 'apipp38', 0),
(1015, '163', 'Neja Advent', '/PlayFiver/Cq9/163.png', 1, 'CQ14', 0, 'slot', 0, 'apipp38', 0),
(1016, '26', '777', '/PlayFiver/Cq9/26.png', 1, 'CQ15', 0, 'slot', 0, 'apipp38', 0),
(1017, '50', 'Good fortune', '/PlayFiver/Cq9/50.png', 1, 'CQ16', 0, 'slot', 0, 'apipp38', 0),
(1018, '31', 'God of war', '/PlayFiver/Cq9/31.png', 1, 'CQ17', 0, 'slot', 0, 'apipp38', 0),
(1019, '64', 'Zeus', '/PlayFiver/Cq9/64.png', 1, 'CQ18', 0, 'slot', 0, 'apipp38', 0),
(1020, '69', 'Pasaycen', '/PlayFiver/Cq9/69.png', 1, 'CQ19', 0, 'slot', 0, 'apipp38', 0),
(1021, '89', 'Thor', '/PlayFiver/Cq9/89.png', 1, 'CQ20', 0, 'slot', 0, 'apipp38', 0),
(1022, '46', 'Wolf moon', '/PlayFiver/Cq9/46.png', 1, 'CQ21', 0, 'slot', 0, 'apipp38', 0),
(1023, '139', 'Fire chibi', '/PlayFiver/Cq9/139.png', 1, 'CQ22', 0, 'slot', 0, 'apipp38', 0),
(1024, '15', 'Gu Gu Gu', '/PlayFiver/Cq9/15.png', 1, 'CQ23', 0, 'slot', 0, 'apipp38', 0),
(1025, '140', 'Fire Chibi 2', '/PlayFiver/Cq9/140.png', 1, 'CQ24', 0, 'slot', 0, 'apipp38', 0),
(1026, '8', 'So Sweet', '/PlayFiver/Cq9/8.png', 1, 'CQ25', 0, 'slot', 0, 'apipp38', 0),
(1027, '147', 'Flower fortune', '/PlayFiver/Cq9/147.png', 1, 'CQ26', 0, 'slot', 0, 'apipp38', 0),
(1028, '113', 'Flying Kai Shen', '/PlayFiver/Cq9/113.png', 1, 'CQ27', 0, 'slot', 0, 'apipp38', 0),
(1029, '58', 'Gu Gu Gu 2', '/PlayFiver/Cq9/58.png', 1, 'CQ28', 0, 'slot', 0, 'apipp38', 0),
(1030, '128', 'Wheel money', '/PlayFiver/Cq9/128.png', 1, 'CQ29', 0, 'slot', 0, 'apipp38', 0),
(1031, '5', 'Mr Rich', '/PlayFiver/Cq9/5.png', 1, 'CQ30', 0, 'slot', 0, 'apipp38', 0),
(1032, '180', 'Gu Gu Gu 3', '/PlayFiver/Cq9/180.png', 1, 'CQ31', 0, 'slot', 0, 'apipp38', 0),
(1033, '118', 'SkullSkull', '/PlayFiver/Cq9/118.png', 1, 'CQ32', 0, 'slot', 0, 'apipp38', 0),
(1034, '148', 'Fortune totem', '/PlayFiver/Cq9/148.png', 1, 'CQ33', 0, 'slot', 0, 'apipp38', 0),
(1035, '144', 'Diamond treasure', '/PlayFiver/Cq9/144.png', 1, 'CQ34', 0, 'slot', 0, 'apipp38', 0),
(1036, '19', 'Hot spin', '/PlayFiver/Cq9/19.png', 1, 'CQ35', 0, 'slot', 0, 'apipp38', 0),
(1037, '112', 'Pyramid radar', '/PlayFiver/Cq9/112.png', 1, 'CQ36', 0, 'slot', 0, 'apipp38', 0),
(1038, '160', 'Pa Kai Shen2', '/PlayFiver/Cq9/160.png', 1, 'CQ37', 0, 'slot', 0, 'apipp38', 0),
(1039, '47', 'Pharaoh gold', '/PlayFiver/Cq9/47.png', 1, 'CQ38', 0, 'slot', 0, 'apipp38', 0),
(1040, '13', 'Sakura legend', '/PlayFiver/Cq9/13.png', 1, 'CQ39', 0, 'slot', 0, 'apipp38', 0),
(1041, '34', 'Gopher s War', '/PlayFiver/Cq9/34.png', 1, 'CQ40', 0, 'slot', 0, 'apipp38', 0),
(1042, '59', 'Summer mood', '/PlayFiver/Cq9/59.png', 1, 'CQ41', 0, 'slot', 0, 'apipp38', 0),
(1043, '95', 'Football boots', '/PlayFiver/Cq9/95.png', 1, 'CQ42', 0, 'slot', 0, 'apipp38', 0),
(1044, '57', 'The Beast War', '/PlayFiver/Cq9/57.png', 1, 'CQ43', 0, 'slot', 0, 'apipp38', 0),
(1045, '17', 'Great lion', '/PlayFiver/Cq9/17.png', 1, 'CQ44', 0, 'slot', 0, 'apipp38', 0),
(1046, '20', '888', '/PlayFiver/Cq9/20.png', 1, 'CQ45', 0, 'slot', 0, 'apipp38', 0),
(1047, '182', 'Thor 2', '/PlayFiver/Cq9/182.png', 1, 'CQ46', 0, 'slot', 0, 'apipp38', 0),
(1048, '66', 'Fire 777', '/PlayFiver/Cq9/66.png', 1, 'CQ47', 0, 'slot', 0, 'apipp38', 0),
(1049, '2', 'God of Chess', '/PlayFiver/Cq9/2.png', 1, 'CQ48', 0, 'slot', 0, 'apipp38', 0),
(1050, '21', 'Big wolf', '/PlayFiver/Cq9/21.png', 1, 'CQ49', 0, 'slot', 0, 'apipp38', 0),
(1051, '197', 'Dragon s Treasure', '/PlayFiver/Cq9/197.png', 1, 'CQ50', 0, 'slot', 0, 'apipp38', 0),
(1052, '208', 'Money tree', '/PlayFiver/Cq9/208.png', 1, 'CQ51', 0, 'slot', 0, 'apipp38', 0),
(1053, '212', 'Burning Si-Yow', '/PlayFiver/Cq9/212.png', 1, 'CQ52', 0, 'slot', 0, 'apipp38', 0),
(1054, '214', 'Ninja raccoon', '/PlayFiver/Cq9/214.png', 1, 'CQ53', 0, 'slot', 0, 'apipp38', 0),
(1055, '218', 'Dollar night', '/PlayFiver/Cq9/218.png', 1, 'CQ54', 0, 'slot', 0, 'apipp38', 0),
(1056, 'vs5ultrab', 'Ultra Burn', '/PlayFiver/Reelkingdom/vs5ultrab.png', 1, 'REELKINGDOM', 0, 'slot', 0, 'apipp38', 0),
(1057, 'vs5ultra', 'Ultra Hold and Spin', '/PlayFiver/Reelkingdom/vs5ultra.png', 1, 'REELKINGDOM', 0, 'slot', 0, 'apipp38', 0),
(1058, 'vs10returndead', 'Return of the Dead', '/PlayFiver/Reelkingdom/vs10returndead.png', 1, 'REELKINGDOM', 0, 'slot', 0, 'apipp38', 0),
(1059, 'vs10bbbonanza', 'Big Bass Bonanza', '/PlayFiver/Reelkingdom/vs10bbbonanza.png', 1, 'REELKINGDOM', 0, 'fish', 0, 'apipp38', 0),
(1060, 'vs20hburnhs', 'Hot to Burn Hold and Spin', '/PlayFiver/Reelkingdom/vs20hburnhs.png', 1, 'REELKINGDOM', 0, 'slot', 0, 'apipp38', 0),
(1061, 'vswayslight', 'Lucky Lightning', '/PlayFiver/Reelkingdom/vswayslight.png', 1, 'REELKINGDOM', 0, 'slot', 0, 'apipp38', 0),
(1062, 'vs12bbb', 'Bigger Bass Bonanza', '/PlayFiver/Reelkingdom/vs12bbb.png', 1, 'REELKINGDOM', 0, 'fish', 0, 'apipp38', 0),
(1063, 'vs10floatdrg', 'Floating Dragon', '/PlayFiver/Reelkingdom/vs10floatdrg.png', 1, 'REELKINGDOM', 0, 'slot', 0, 'apipp38', 0),
(1064, 'vs1024temuj', 'Temujin Treasures', '/PlayFiver/Reelkingdom/vs1024temuj.png', 1, 'REELKINGDOM', 0, 'slot', 0, 'apipp38', 0),
(1065, 'vs10bxmasbnza', 'Christmas Big Bass Bonanza', '/PlayFiver/Reelkingdom/vs10bxmasbnza.png', 1, 'REELKINGDOM', 0, 'fish', 0, 'apipp38', 0),
(1066, 'vswaysbbb', 'Big Bass Bonanza Megaways(tm)', '/PlayFiver/Reelkingdom/vswaysbbb.png', 1, 'REELKINGDOM', 0, 'fish', 0, 'apipp38', 0),
(1067, 'vs40bigjuan', 'Big Juan', '/PlayFiver/Reelkingdom/vs40bigjuan.png', 1, 'REELKINGDOM', 0, 'slot', 0, 'apipp38', 0),
(1068, 'vs10starpirate', 'Star Pirates Code', '/PlayFiver/Reelkingdom/vs10starpirate.png', 1, 'REELKINGDOM', 0, 'slot', 0, 'apipp38', 0),
(1069, 'vs5hotburn', 'Hot to burn', '/PlayFiver/Reelkingdom/vs5hotburn.png', 1, 'REELKINGDOM', 0, 'slot', 0, 'apipp38', 0),
(1070, 'vs25bkofkngdm', 'Book of Kingdoms', '/PlayFiver/Reelkingdom/vs25bkofkngdm.png', 1, 'REELKINGDOM', 0, 'slot', 0, 'apipp38', 0),
(1071, 'vs10eyestorm', 'Eye of the Storm', '/PlayFiver/Reelkingdom/vs10eyestorm.png', 1, 'REELKINGDOM', 0, 'slot', 0, 'apipp38', 0),
(1072, 'vs10amm', 'The Amazing Money Machine', '/PlayFiver/Reelkingdom/vs10amm.png', 1, 'REELKINGDOM', 0, 'slot', 0, 'apipp38', 0),
(1073, 'vs10luckcharm', 'Lucky Grace And Charm', '/PlayFiver/Reelkingdom/vs10luckcharm.png', 1, 'REELKINGDOM', 0, 'slot', 0, 'apipp38', 0),
(1074, 'vs25goldparty', 'Gold Party(r)', '/PlayFiver/Reelkingdom/vs25goldparty.png', 1, 'REELKINGDOM', 0, 'slot', 0, 'apipp38', 0),
(1075, 'vs20rockvegas', 'Rock Vegas Mega Hold e Spin', '/PlayFiver/Reelkingdom/vs20rockvegas.png', 1, 'REELKINGDOM', 0, 'slot', 0, 'apipp38', 0),
(1076, 'vs10tictac', 'Tic Tac Take', '/PlayFiver/Reelkingdom/vs10tictac.png', 1, 'REELKINGDOM', 0, 'slot', 0, 'apipp38', 0),
(1077, 'vs243queenie', 'Queenie', '/PlayFiver/Reelkingdom/vs243queenie.png', 1, 'REELKINGDOM', 0, 'slot', 0, 'apipp38', 0),
(1078, 'vs10spiritadv', 'Spirit of Adventure', '/PlayFiver/Reelkingdom/vs10spiritadv.png', 1, 'REELKINGDOM', 0, 'slot', 0, 'apipp38', 0),
(1079, 'vs5littlegem', 'Little Gem Hold and Spin', '/PlayFiver/Reelkingdom/vs5littlegem.png', 1, 'REELKINGDOM', 0, 'slot', 0, 'apipp38', 0),
(1080, '01rb77cq1gtenhmo', 'Auto-Roulette VIP', '/PlayFiver/Evolution/01rb77cq1gtenhmo.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1081, 'qgqrucipvltnvnvq', 'Speed Baccarat W', '/PlayFiver/Evolution/qgqrucipvltnvnvq.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1082, 'JapSpeedBac00001', 'Japanese Speed Baccarat A', '/PlayFiver/Evolution/JapSpeedBac00001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1083, 'NoCommBac0000001', 'No Commission Baccarat', '/PlayFiver/Evolution/NoCommBac0000001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1084, 'PTBaccarat000001', 'Prosperity Tree Baccarat', '/PlayFiver/Evolution/PTBaccarat000001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1085, 'p63cmvmwagteemoy', 'Korean Speed Baccarat A', '/PlayFiver/Evolution/p63cmvmwagteemoy.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1086, 'MonBigBaller0001', 'MONOPOLY Big Baller', '/PlayFiver/Evolution/MonBigBaller0001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1087, 'LightningTable01', 'Lightning Roulette', '/PlayFiver/Evolution/LightningTable01.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1088, 'ndgvz5mlhfuaad6e', 'Speed Baccarat D', '/PlayFiver/Evolution/ndgvz5mlhfuaad6e.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1089, 'obj64qcnqfunjelj', 'Speed Baccarat J', '/PlayFiver/Evolution/obj64qcnqfunjelj.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1090, 'PorROULigh000001', 'Roleta Relampago', '/PlayFiver/Evolution/PorROULigh000001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1091, 'ovfzgqahvicqtiwu', 'Lightning Roulette Italia', '/PlayFiver/Evolution/ovfzgqahvicqtiwu.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1092, 'HSpeedBac0000002', 'Hindi Speed Baccarat B', '/PlayFiver/Evolution/HSpeedBac0000002.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1094, '8clwnwrupuvf0osq', 'Ruleta en Vivo', '/PlayFiver/Evolution/8clwnwrupuvf0osq.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1095, 'xie6wodezmfwmmcb', 'Punto Banco', '/PlayFiver/Evolution/xie6wodezmfwmmcb.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1096, '48z5pjps3ntvqc1b', 'Auto-Roulette', '/PlayFiver/Evolution/48z5pjps3ntvqc1b.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1097, 'mkvhbciosnfqhat7', 'Arabic Roulette', '/PlayFiver/Evolution/mkvhbciosnfqhat7.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1098, 'RedDoorRoulette1', 'Red Door Roulette', '/PlayFiver/Evolution/RedDoorRoulette1.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1100, 'nmwde3fd7hvqhq43', 'Speed Baccarat F', '/PlayFiver/Evolution/nmwde3fd7hvqhq43.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1101, 'ocye2ju2bsoyq6vv', 'Speed Baccarat K', '/PlayFiver/Evolution/ocye2ju2bsoyq6vv.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1102, 'EmperorSB0000001', 'Emperor Sic Bo', '/PlayFiver/Evolution/EmperorSB0000001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1103, 'CrazyTime0000002', 'Crazy Time A', '/PlayFiver/Evolution/CrazyTime0000002.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1104, 'ovu5eja74ccmyoiq', 'Speed Baccarat N', '/PlayFiver/Evolution/ovu5eja74ccmyoiq.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1105, 'SBCTable00000001', 'Side Bet City', '/PlayFiver/Evolution/SBCTable00000001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1106, 'nmwdzhbg7hvqh6a7', 'Speed Baccarat G', '/PlayFiver/Evolution/nmwdzhbg7hvqh6a7.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1111, 'AmericanTable001', 'American Roulette', '/PlayFiver/Evolution/AmericanTable001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1112, 'PorROU0000000001', 'Roleta ao Vivo', '/PlayFiver/Evolution/PorROU0000000001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1113, 'pv5q45yjhasyt46y', 'Emperor Roulette', '/PlayFiver/Evolution/pv5q45yjhasyt46y.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1114, 'ndgv45bghfuaaebf', 'Speed Baccarat E', '/PlayFiver/Evolution/ndgv45bghfuaaebf.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1116, '7x0b1tgh7agmf6hv', 'Immersive Roulette', '/PlayFiver/Evolution/7x0b1tgh7agmf6hv.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1118, 'ovu5h6b3ujb4y53w', 'No Commission Speed Baccarat C', '/PlayFiver/Evolution/ovu5h6b3ujb4y53w.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1119, 'qsf63ownyvbqnz33', 'Speed Baccarat Z', '/PlayFiver/Evolution/qsf63ownyvbqnz33.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1120, 'ndgvwvgthfuaad3q', 'Speed Baccarat C', '/PlayFiver/Evolution/ndgvwvgthfuaad3q.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1122, 'CSPTable00000001', 'Caribbean Stud Poker', '/PlayFiver/Evolution/CSPTable00000001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1123, 'qgqrhfvsvltnueqf', 'Speed Baccarat U', '/PlayFiver/Evolution/qgqrhfvsvltnueqf.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1125, 'f1f4rm9xgh4j3u2z', 'Auto-Roulette La Partage', '/PlayFiver/Evolution/f1f4rm9xgh4j3u2z.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1126, 'Monopoly00000001', 'MONOPOLY Live', '/PlayFiver/Evolution/Monopoly00000001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1129, 'leqhceumaq6qfoug', 'Speed Baccarat A', '/PlayFiver/Evolution/leqhceumaq6qfoug.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1130, 'qgonc7t4ucdiel4o', 'Speed Baccarat T', '/PlayFiver/Evolution/qgonc7t4ucdiel4o.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1131, '7nyiaws9tgqrzaz3', 'Football Studio Roulette', '/PlayFiver/Evolution/7nyiaws9tgqrzaz3.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1132, 'ETHTable00000001', 'Extreme Texas Hold em', '/PlayFiver/Evolution/ETHTable00000001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1133, 'ndgvs3tqhfuaadyg', 'Baccarat C', '/PlayFiver/Evolution/ndgvs3tqhfuaadyg.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1134, 'lkcbrbdckjxajdol', 'Speed Roulette', '/PlayFiver/Evolution/lkcbrbdckjxajdol.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1135, 'o4kymodby2fa2c7g', 'Speed Baccarat S', '/PlayFiver/Evolution/o4kymodby2fa2c7g.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1136, 'nxpkul2hgclallno', 'Speed Baccarat I', '/PlayFiver/Evolution/nxpkul2hgclallno.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1137, 'CrazyTime0000001', 'Crazy Time', '/PlayFiver/Evolution/CrazyTime0000001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1138, 'vctlz20yfnmp1ylr', 'Roulette', '/PlayFiver/Evolution/vctlz20yfnmp1ylr.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1139, 'zixzea8nrf1675oh', 'Baccarat Squeeze', '/PlayFiver/Evolution/zixzea8nrf1675oh.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1140, 'TRPTable00000001', 'Triple Card Poker', '/PlayFiver/Evolution/TRPTable00000001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1141, 'teenpattitable01', 'Teen Patti', '/PlayFiver/Evolution/teenpattitable01.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1142, 'peekbaccarat0001', 'Peek Baccarat', '/PlayFiver/Evolution/peekbaccarat0001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1143, 'o4kyj7tgpwqqy4m4', 'Speed Baccarat Q', '/PlayFiver/Evolution/o4kyj7tgpwqqy4m4.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1144, 'FunkyTime0000001', 'Funky Time', '/PlayFiver/Evolution/FunkyTime0000001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1145, 'XxxtremeLigh0001', 'XXXtreme Lightning Roulette', '/PlayFiver/Evolution/XxxtremeLigh0001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1146, 'AndarBahar000001', 'Super Andar Bahar', '/PlayFiver/Evolution/AndarBahar000001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1147, 'o4kylkahpwqqy57w', 'Speed Baccarat R', '/PlayFiver/Evolution/o4kylkahpwqqy57w.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1148, '60i0lcfx5wkkv3sy', 'Baccarat B', '/PlayFiver/Evolution/60i0lcfx5wkkv3sy.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1149, 'PorBacBo00000001', 'Bac Bo Ao Vivo', '/PlayFiver/Evolution/PorBacBo00000001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1150, 'ocye5hmxbsoyrcii', 'No Commission Speed Baccarat B', '/PlayFiver/Evolution/ocye5hmxbsoyrcii.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1151, 'THBTable00000001', 'Texas Hold em Bonus Poker', '/PlayFiver/Evolution/THBTable00000001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1152, 'BonsaiBacc000002', 'Bonsai Speed Baccarat B', '/PlayFiver/Evolution/BonsaiBacc000002.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1153, 'DoubleBallRou001', 'Double Ball Roulette', '/PlayFiver/Evolution/DoubleBallRou001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1154, 'lv2kzclunt2qnxo5', 'Speed Baccarat B', '/PlayFiver/Evolution/lv2kzclunt2qnxo5.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1155, 'HoldemTable00001', 'Casino Hold em', '/PlayFiver/Evolution/HoldemTable00001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1156, 'qsf7alptyvbqohva', 'Speed Baccarat 2', '/PlayFiver/Evolution/qsf7alptyvbqohva.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1157, 'pv2zgy42anvdwk3l', 'Lotus Roulette', '/PlayFiver/Evolution/pv2zgy42anvdwk3l.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1158, 'ovu5cwp54ccmymck', 'Speed Baccarat L', '/PlayFiver/Evolution/ovu5cwp54ccmymck.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1159, 'FanTan0000000001', 'Fan Tan', '/PlayFiver/Evolution/FanTan0000000001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1160, 'BonsaiBacc000003', 'Bonsai Speed Baccarat C', '/PlayFiver/Evolution/BonsaiBacc000003.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1161, 'rep5ca4ynyjl7wdw', 'Speed Baccarat 7', '/PlayFiver/Evolution/rep5ca4ynyjl7wdw.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1162, 'ovu5dsly4ccmynil', 'Speed Baccarat M', '/PlayFiver/Evolution/ovu5dsly4ccmynil.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1163, 'LightningBac0001', 'Lightning Baccarat', '/PlayFiver/Evolution/LightningBac0001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1164, 'oytmvb9m1zysmc44', 'Baccarat A', '/PlayFiver/Evolution/oytmvb9m1zysmc44.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1165, 'StockMarket00001', 'Stock Market', '/PlayFiver/Evolution/StockMarket00001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1166, 'TopCard000000004', 'Futebol Studio Ao Vivo', '/PlayFiver/Evolution/TopCard000000004.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1167, 'qsf7bpfvyvbqolwp', 'Speed Baccarat 3', '/PlayFiver/Evolution/qsf7bpfvyvbqolwp.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1168, 'TopDice000000001', 'Football Studio Dice', '/PlayFiver/Evolution/TopDice000000001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1169, 'k2oswnib7jjaaznw', 'Baccarat Control Squeeze', '/PlayFiver/Evolution/k2oswnib7jjaaznw.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1170, 'qsf65xtoyvbqoaop', 'Speed Baccarat 1', '/PlayFiver/Evolution/qsf65xtoyvbqoaop.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1171, 'ovu5fzje4ccmyqnr', 'Speed Baccarat P', '/PlayFiver/Evolution/ovu5fzje4ccmyqnr.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1172, 'qgqrrnuqvltnvejx', 'Speed Baccarat V', '/PlayFiver/Evolution/qgqrrnuqvltnvejx.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1173, 'ImperialQuest001', 'Imperial Quest', '/PlayFiver/Evolution/ImperialQuest001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1174, 'wzg6kdkad1oe7m5k', 'VIP Roulette', '/PlayFiver/Evolution/wzg6kdkad1oe7m5k.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1175, 'TopCard000000001', 'Football Studio', '/PlayFiver/Evolution/TopCard000000001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1176, 'SuperSicBo000001', 'Super Sic Bo', '/PlayFiver/Evolution/SuperSicBo000001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1177, 'ovu5fbxm4ccmypmb', 'Speed Baccarat O', '/PlayFiver/Evolution/ovu5fbxm4ccmypmb.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1178, 'nxpj4wumgclak2lx', 'Speed Baccarat H', '/PlayFiver/Evolution/nxpj4wumgclak2lx.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1179, 'GoldVaultRo00001', 'Gold Vault Roulette', '/PlayFiver/Evolution/GoldVaultRo00001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1180, 'XXXtremeLB000001', 'XXXtreme Lightning Baccarat', '/PlayFiver/Evolution/XXXtremeLB000001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1181, 'SpeedAutoRo00001', 'Speed Auto Roulette', '/PlayFiver/Evolution/SpeedAutoRo00001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1182, 'BacBo00000000001', 'Bac Bo', '/PlayFiver/Evolution/BacBo00000000001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1183, 'BonsaiBacc000001', 'Bonsai Speed Baccarat A', '/PlayFiver/Evolution/BonsaiBacc000001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1184, 'LightningDice001', 'Lightning Dice', '/PlayFiver/Evolution/LightningDice001.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1185, 'LightningSpain01', 'Ruleta Relampago en Vivo', '/PlayFiver/Evolution/LightningSpain01.png', 1, '26595015200105', 0, 'cards', 0, 'apipp38', 0),
(1188, '8891', 'JETX', '/PlayFiver/Jetx/8891.png', 1, 'JETX', 0, 'block', 0, 'apipp38', 0),
(1189, '8892', 'JETX3', '/PlayFiver/Jetx/8892.png', 1, 'JETX', 0, 'block', 0, 'apipp38', 0),
(1190, '12566', 'GOAL', '/PlayFiver/Spribe/goal.png', 1, '36595015200906', 0, 'block', 0, 'apipp38', 0),
(1191, '12564', 'HOTLINE', '/PlayFiver/Spribe/hotline.png', 1, '36595015200906', 0, 'block', 0, 'apipp38', 0),
(1192, '12563', 'MINI ROULETTE', '/PlayFiver/Spribe/miniroulette.png', 1, '36595015200906', 0, 'block', 0, 'apipp38', 0),
(1193, '12562', 'DICE', '/PlayFiver/Spribe/dice.png', 1, '36595015200906', 0, 'block', 0, 'apipp38', 0),
(1194, '12565', 'HILO', '/PlayFiver/Spribe/hilo.png', 1, '36595015200906', 0, 'block', 0, 'apipp38', 0),
(1195, 'mines', 'MINES', '/PlayFiver/Spribe/mines.png', 1, '36595015200906', 0, 'block', 0, 'apipp38', 0),
(1196, '1492288', 'Pinata Wins', '/PlayFiver/Pgsoft/1492288.png', 1, NULL, 0, 'slot', 0, 'apipg16', 0),
(1198, '1778752', 'Futebol Fever', '/PlayFiver/Pgsoft/1778752.png', 1, NULL, 0, 'slot', 0, 'apipg16', 0),
(2000, '1738001', 'Chicky Run', '/PlayFiver/Pgsoft/1738001.png', 1, NULL, 0, 'slot', 0, 'apipg16', 0),
(2001, 'vs20sugarrushx', 'Sugar RushX', '/PlayFiver/Pragmatic/vs20sugarrushx.png', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(2002, 'vs12bbbxmas', 'Bigger Bass Bonanza', '/PlayFiver/Pragmatic/vs12bbbxmas.jpg', 1, '26595015200310', 0, 'fish', 0, 'apipp38', 0),
(2003, 'vswayspowzeus', 'Pizza Pizza Pizza', '/PlayFiver/Pragmatic/vswayspowzeus.jpg', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(2004, 'vs15godsofwar', 'Zeus X Hades', '/PlayFiver/Pragmatic/vs15godsofwar.webp', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(2005, 'vs20pistols', 'Wild west duels', '/PlayFiver/Pragmatic/vs20pistols.webp', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(2006, 'vs20fruitswx', 'Sweet Bonanza 1000', '/PlayFiver/Pragmatic/vs20fruitswx.jpg', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(2007, 'vs20sugarrushx', 'Sugar Rush 1000', '/PlayFiver/Pragmatic/vs20sugarrushx.jpeg', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(2008, 'vs20sugarnudge', 'Sugar Nudge', '/PlayFiver/Pragmatic/vs20sugarnudge.jpeg', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(2009, 'vs20clustcol', 'Sweet Kingdom', '/PlayFiver/Pragmatic/vs20clustcol.jpg', 1, NULL, 0, 'slot', 0, 'apipp38', 0),
(2010, 'vs20olympx', 'Gates of Olympus 1000', '/PlayFiver/Pragmatic/vs20olympx.jpeg', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 0),
(2011, 'vs20heartcleo', 'Gems Bonanza', '/PlayFiver/Pragmatic/vs20heartcleo.jpeg', 1, '26595015200310', 0, 'slot', 0, 'apipp38', 1),
(2012, 'vs10bbfmission', 'BIG BASS MISSION FISHINNG', '/PlayFiver/Pragmatic/vs10bbfmission.jpeg', 1, '26595015200310', 0, 'fish', 0, 'apipp38', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico_play`
--

CREATE TABLE `historico_play` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nome_game` text NOT NULL,
  `bet_money` decimal(10,2) NOT NULL DEFAULT 0.00,
  `win_money` decimal(10,2) NOT NULL DEFAULT 0.00,
  `txn_id` text NOT NULL,
  `created_at` datetime NOT NULL,
  `status_play` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `historico_play`
--

INSERT INTO `historico_play` (`id`, `id_user`, `nome_game`, `bet_money`, `win_money`, `txn_id`, `created_at`, `status_play`) VALUES
(41831, 448, 'fortune-tiger', 3.20, 3.84, 'e437dcd2-8d64-454a-bcce-f444c237cc99', '2026-01-12 19:10:29', 1),
(41832, 448, 'fortune-tiger', 3.20, 320.00, '1657dc02-e2f0-4894-85dc-44889b7c7192', '2026-01-12 19:10:41', 1),
(41833, 449, 'fortune-tiger', 0.40, 0.24, 'ff4a467c-d91e-460b-b58e-61cfbf8ec9f3', '2026-01-12 19:11:50', 1),
(41834, 449, 'fortune-tiger', 0.40, 20.00, '7b84b87c-f5d6-4571-9a87-6d59434447b3', '2026-01-12 19:12:09', 1),
(41835, 449, 'fortune-tiger', 0.40, 0.00, 'b5934130-d929-4df9-8c96-d654cd6a9ad4', '2026-01-12 19:12:20', 1),
(41836, 449, 'fortune-tiger', 0.40, 0.80, '7f3936ef-95db-449f-960f-8945e13aa9bb', '2026-01-12 19:12:23', 1),
(41837, 449, 'ganesha-gold', 0.30, 0.18, '4e82234c-064a-4da5-8b69-c15b679d3417', '2026-01-12 19:23:21', 1),
(41838, 449, 'ganesha-gold', 0.30, 0.00, '88ce37b7-07f4-45a4-83a1-b5a066fec32b', '2026-01-12 19:23:24', 1),
(41839, 449, 'ganesha-gold', 0.00, 0.20, '39057a0e-36bf-458b-a5f0-7443058e1dc4', '2026-01-12 19:23:39', 1),
(41840, 449, 'ganesha-gold', 0.00, 0.00, '9d48c826-c30e-4c01-8bc3-04f404b16d50', '2026-01-12 19:23:45', 1),
(41841, 449, 'ganesha-gold', 0.00, 0.00, '4b9f41f6-f263-4720-b998-aaa460089f34', '2026-01-12 19:23:47', 1),
(41842, 449, 'ganesha-gold', 0.00, 1.00, '2283e9ec-3d95-44d0-b912-412811f46e4b', '2026-01-12 19:23:50', 1),
(41843, 449, 'ganesha-gold', 0.00, 0.00, 'a6901a20-bfc6-4bad-8f66-2c8d866e5793', '2026-01-12 19:24:12', 1),
(41844, 449, 'ganesha-gold', 0.00, 1.80, '1028fcf1-cdec-40df-b48d-13eb234c6791', '2026-01-12 19:24:15', 1),
(41845, 449, 'ganesha-gold', 0.00, 0.20, '51096ffa-37ab-49ea-83c4-ac56590b8319', '2026-01-12 19:24:22', 1),
(41846, 449, 'ganesha-gold', 0.00, 0.00, 'cda3231d-586a-4c7c-b29d-638593fdf3ca', '2026-01-12 19:24:26', 1),
(41847, 449, 'ganesha-gold', 0.00, 0.60, '5919f543-2a4e-4db8-89f7-230c85fe5851', '2026-01-12 19:24:28', 1),
(41848, 449, 'ganesha-gold', 0.00, 0.48, '17bf87e4-01c9-42ed-9db6-56be6efed101', '2026-01-12 19:24:34', 1),
(41849, 449, 'ganesha-gold', 0.00, 0.90, '446a2264-37c9-4b40-b810-2827cc9e6600', '2026-01-12 19:24:38', 1),
(41850, 449, 'ganesha-gold', 0.00, 1.20, 'fb371f1e-0c5d-4a0c-97f3-4db53dece582', '2026-01-12 19:24:45', 1),
(41851, 449, 'fortune-dragon', 0.40, 0.00, '4fbdb8ea-dd09-4286-b3f7-a7dbe2fa9924', '2026-01-12 19:25:38', 1),
(41852, 449, 'fortune-dragon', 0.40, 0.24, '8e9a0354-7013-4b12-910a-ca2f620636ee', '2026-01-12 19:25:41', 1),
(41853, 449, 'fortune-dragon', 3.60, 0.00, '01eb5cf5-d18b-4023-bb36-7ee9b6cc5a20', '2026-01-12 19:25:50', 1),
(41854, 449, 'fortune-dragon', 0.00, 28.80, 'fcf23f03-d5fd-4ca9-a10b-68464b848fb5', '2026-01-12 19:26:00', 1),
(41855, 449, 'fortune-dragon', 0.00, 15.12, '2563bb7f-c832-49a1-ac4a-d2a478a815b0', '2026-01-12 19:26:07', 1),
(41856, 449, 'fortune-dragon', 0.00, 0.00, '53da71ab-21b8-4e89-be4e-094304ae9753', '2026-01-12 19:26:12', 1),
(41857, 449, 'fortune-dragon', 0.00, 0.00, '4cab6bbb-49e6-4788-817e-74123daa32b9', '2026-01-12 19:26:15', 1),
(41858, 449, 'fortune-dragon', 0.00, 0.00, '5daa68a7-e52f-4d0a-a158-b6c0516f28be', '2026-01-12 19:26:16', 1),
(41859, 449, 'fortune-dragon', 0.00, 0.00, '95018e8d-9909-4a72-bc1d-49f063a30b5b', '2026-01-12 19:26:17', 1),
(41860, 449, 'fortune-dragon', 0.00, 34.56, '825b3b18-4f24-42ea-951a-fdb2044e5af2', '2026-01-12 19:26:18', 1),
(41861, 449, 'fortune-dragon', 3.60, 14.40, '10795d13-e5d1-43fc-a889-4081017122a7', '2026-01-12 19:27:30', 1),
(41862, 449, 'cash-mania', 0.50, 0.10, '553c14ab-04f4-4100-89ca-a0a26ffdaa94', '2026-01-12 19:50:25', 1),
(41863, 449, 'cash-mania', 0.50, 5.00, '9e8790cd-4e7d-4f6e-aca4-9a6d4371659e', '2026-01-12 19:51:03', 1),
(41864, 449, 'cash-mania', 0.00, 5.00, '3e4f7526-9f24-43bc-9cf1-c79b46039d70', '2026-01-12 19:51:04', 1),
(41865, 449, 'cash-mania', 0.00, 50.00, '7f16fbc2-2395-4ced-9d91-32530ac90f46', '2026-01-12 19:51:12', 1),
(41866, 449, 'cash-mania', 0.00, 0.00, '56612d1c-7155-430b-9ce5-7ada9c6661d2', '2026-01-12 19:51:19', 1),
(41867, 449, 'cash-mania', 0.00, 0.00, 'fa78d0a6-f484-484d-9125-354ed4c6b025', '2026-01-12 19:51:21', 1),
(41868, 449, 'cash-mania', 0.00, 0.00, '948c48f3-bc73-4748-9a6d-e2bd08b6d050', '2026-01-12 19:51:22', 1),
(41869, 449, 'cash-mania', 0.00, 0.00, '4affdc92-0ba4-41a3-b0e8-f748d798e533', '2026-01-12 19:51:23', 1),
(41870, 450, 'fortune-tiger', 0.40, 0.00, '1a05742a-e4a9-4dba-b8bc-4c7de955b1e4', '2026-01-12 19:55:31', 1),
(41871, 450, 'fortune-tiger', 0.40, 0.80, 'eb570d2a-e0cc-49ee-85dd-c692c9fb0ea0', '2026-01-12 19:55:35', 1),
(41872, 450, 'fortune-tiger', 0.40, 32.00, 'f54605cb-8dde-40a2-9a85-98d72196664d', '2026-01-12 19:55:58', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mensagens`
--

CREATE TABLE `mensagens` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `mensagens`
--

INSERT INTO `mensagens` (`id`, `titulo`, `criado_em`, `status`) VALUES
(1, 'ANUNCIO 33', '2024-06-28 21:10:47', 1),
(2, 'ANUNCIO 3', '2024-06-28 21:08:02', 1),
(3, 'ANUNCIO 2', '2024-06-28 21:08:02', 1),
(4, 'TESTE 5', '2024-10-16 15:15:27', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `metodos_pagamentos`
--

CREATE TABLE `metodos_pagamentos` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `pix_id` varchar(255) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT NULL,
  `pix_account` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `metodos_pagamentos`
--

INSERT INTO `metodos_pagamentos` (`id`, `user_id`, `realname`, `pix_id`, `flag`, `pix_account`, `state`, `created_at`) VALUES
(163, 29, 'samu ', '04009509504', 1, 'djeds2@gmail.com', 1, '2025-08-28 21:25:47'),
(164, 35, 'Eduardo de Lima Silva ', '09870629300', 3, NULL, 1, '2025-08-29 01:33:51'),
(165, 39, 'tiffane', '11685117554', 2, '75998959002', 1, '2025-08-29 03:02:57'),
(166, 45, 'Luciano Vieira Mendes neto', '56342864845', 3, NULL, 1, '2025-08-29 09:12:49'),
(167, 48, 'Raissa ', '50396155820', 1, 'Raissasilva21levy@gmail.com', 1, '2025-08-29 12:31:35'),
(168, 49, 'Jonatan dos santos pereira ', '13852144493', 1, 'Jonatasanto740@gmail.com', 1, '2025-08-29 15:00:11'),
(169, 55, 'Ariel', '15688557966', 1, 'arielgodri78@gmail.com', 1, '2025-08-30 00:35:55'),
(170, 46, 'Kelly Cristina Rodrigues Diniz', '43815263840', 3, NULL, 1, '2025-08-30 01:19:56'),
(171, 59, 'José Raimundo ', '63665996376', 3, NULL, 1, '2025-08-30 01:27:40'),
(172, 47, 'kelly', '40988765700', 3, NULL, 1, '2025-08-30 02:04:55'),
(173, 65, 'João lima', '15716902129', 1, 'limajoao09@icloud.com', 1, '2025-08-30 16:17:22'),
(174, 66, 'Luiza Alves ', '10773783199', 3, NULL, 1, '2025-08-30 16:36:41'),
(175, 68, 'Alan', '12630345513', 1, 'winetrabuco@gmail.com', 1, '2025-08-30 21:04:18'),
(176, 71, 'Elisa Dayane França ', '49740041825', 2, '11973530695', 1, '2025-08-31 02:10:28'),
(177, 81, 'Jhenny', '16443237455', 3, NULL, 1, '2025-09-01 00:07:56'),
(178, 85, 'Angélica Alves Nogueira ', '07791108380', 2, '89994572218', 1, '2025-09-02 00:33:49'),
(179, 93, 'dayse Luiz ', '16641528499', 1, 'andryelvictor17@gmail.com', 1, '2025-09-02 01:07:34'),
(180, 95, 'Natasha', '05626385207', 2, '92993502200', 1, '2025-09-02 01:26:01'),
(181, 94, 'victor gabriel', '15743627479', 3, NULL, 1, '2025-09-02 01:35:32'),
(182, 96, 'Carlos', '70595804411', 3, NULL, 1, '2025-09-02 01:41:53'),
(183, 97, 'Alessandro froes', '06507418544', 3, NULL, 1, '2025-09-02 01:46:18'),
(184, 86, 'Anderson', '20886265738', 2, '21959193818', 1, '2025-09-02 01:51:44'),
(185, 73, 'Souza', '53851066011', 1, 'souzants1508@gmail.com', 1, '2025-09-02 02:05:45'),
(186, 111, 'Ana', '90883454220', 3, NULL, 1, '2025-09-18 15:10:57'),
(187, 114, 'Clara Beatriz', '14745266405', 2, '83993126806', 1, '2025-09-19 00:44:07'),
(188, 116, 'Daniel Damasio Martins ', '11900685400', 3, NULL, 1, '2025-09-19 01:29:56'),
(189, 122, 'Thaissa', '05745757230', 2, '92984450735', 1, '2025-09-19 14:39:48'),
(190, 123, 'Ar', '07755103510', 3, NULL, 1, '2025-09-19 15:06:15'),
(191, 125, 'Ana', '15106107741', 3, NULL, 1, '2025-09-19 15:29:47'),
(192, 117, 'Gabriella oliveira', '16379569758', 3, NULL, 1, '2025-09-19 15:45:36'),
(193, 127, 'Carlos', '70974590185', 3, NULL, 1, '2025-09-19 16:17:39'),
(194, 128, 'Leidia', '18767843211', 2, '32998259441', 1, '2025-09-19 17:02:59'),
(195, 131, 'Maria Andréia de Oliveira Campelo', '88114139315', 2, '85996136869', 1, '2025-09-19 17:24:01'),
(196, 133, 'Rayane', '67887544457', 1, 'lannyayres560@gmail.com', 1, '2025-09-19 17:32:45'),
(197, 115, 'Mel', '67888886547', 3, NULL, 1, '2025-09-19 17:43:21'),
(198, 134, 'Yasmim ', '16944663708', 2, '21989242240', 1, '2025-09-19 19:45:30'),
(199, 137, 'Filipe Brito Almeida ', '10510626599', 2, '75981915935', 1, '2025-09-19 21:55:21'),
(200, 129, 'Miriana Brito Almeida ', '08346601565', 3, NULL, 1, '2025-09-20 15:09:48'),
(201, 146, 'Vitor', '09241015407', 2, '83993827962', 1, '2025-09-24 23:31:49'),
(202, 147, 'Luis', '55601770818', 1, 'Luizinhoxlf7@icloud.com', 1, '2025-09-30 21:58:34'),
(203, 151, 'eduarda', '82767782621', 2, '81971094568', 1, '2025-10-13 22:16:19'),
(204, 151, 'eduarda', '82767782621', 2, '81987811232', 1, '2025-10-13 22:17:15'),
(205, 160, 'Luciana Marinho ', '89321553215', 2, '92994720793', 1, '2025-10-18 22:35:43'),
(206, 164, 'Jeberson Henrique mota Rezende ', '12931564699', 2, '38992176725', 1, '2025-10-21 11:27:43'),
(207, 166, 'Valdeci', '65570731172', 3, NULL, 1, '2025-10-22 18:27:46'),
(208, 172, 'Lauanda', '60538886307', 2, '85999866140', 1, '2025-10-22 20:49:39'),
(209, 176, 'Ana Samia', '93829208292', 2, '85992363409', 1, '2025-10-22 21:17:20'),
(210, 175, 'Miih', '94939294949', 2, '85981182793', 1, '2025-10-22 21:29:22'),
(211, 178, 'Davi Gomes Pereira', '07243923356', 3, NULL, 1, '2025-10-23 13:16:15'),
(212, 179, 'Vitoria ', '01663637378', 1, 'vikmiranda7@gmail.com', 1, '2025-10-23 14:03:16'),
(213, 183, 'Lilian', '02689477246', 3, NULL, 1, '2025-10-23 14:45:39'),
(214, 186, 'Jhulia', '12165233712', 3, NULL, 1, '2025-10-23 15:14:12'),
(215, 189, 'Thainara ', '17624821699', 1, 'alvesthaynara470@gmail.com', 1, '2025-10-23 16:29:34'),
(216, 190, 'Fernanda da Silva Araújo ', '23697337807', 2, '11942930018', 1, '2025-10-23 16:43:13'),
(217, 198, 'Lucas ', '15812511900', 2, '47997475301', 1, '2025-10-23 21:51:03'),
(218, 200, 'João Vitor de Andrade paz ', '12524019900', 2, '49998115003', 1, '2025-10-23 22:48:31'),
(219, 174, 'Camila', '07908236324', 2, '85988346855', 1, '2025-10-24 20:18:42'),
(220, 203, 'carlos', '66372625181', 1, 'caiojeferson999@gmail.com', 1, '2025-10-25 10:58:35'),
(221, 210, 'Maria Cecília Oliveira Gomes ', '10919169422', 2, '82982213017', 1, '2025-10-26 03:01:24'),
(222, 214, 'Nara', '04315592447', 3, NULL, 1, '2025-10-26 12:59:24'),
(223, 215, 'Maria Vitoria Mendes De Souza ', '71908604441', 3, NULL, 1, '2025-10-26 13:42:16'),
(224, 221, 'Petrônio ', '70015212483', 3, NULL, 1, '2025-10-26 13:51:17'),
(225, 217, 'Bruna karolyne de Moura silva ', '06846620354', 2, '86994994239', 1, '2025-10-26 14:00:19'),
(226, 223, 'Matheus Silva Souza ', '01684386403', 2, '84988601391', 1, '2025-10-26 14:00:51'),
(227, 228, 'Luiza', '02247181260', 3, NULL, 1, '2025-10-26 15:13:38'),
(228, 225, 'Anderson Nascimento ', '06922374371', 3, NULL, 1, '2025-10-26 15:59:55'),
(229, 231, 'André de Medeiros Ferreira Júnior ', '06705955279', 2, '91982264943', 1, '2025-10-26 16:54:16'),
(230, 173, 'Ksjdeje', '29484829293', 3, NULL, 1, '2025-10-26 17:15:29'),
(231, 234, 'Evellin', '01698722206', 3, NULL, 1, '2025-10-26 18:12:19'),
(232, 242, 'Matheus Alves feitosa silva ', '07769246210', 2, '94991781075', 1, '2025-10-28 00:06:26'),
(233, 247, 'Daiane Ribeiro ', '07286769316', 3, NULL, 1, '2025-10-28 07:18:46'),
(234, 239, 'Eric ferreira da Silva ', '06936246206', 3, NULL, 1, '2025-10-28 10:07:14'),
(235, 227, 'Wellyngton', '06533429345', 3, NULL, 1, '2025-10-28 15:05:42'),
(236, 236, 'Matheus Alves feitosa silva ', '07769246210', 2, '94991781075', 1, '2025-10-28 19:37:52'),
(237, 250, 'Bruno santos', '48469742353', 2, '85988855214', 1, '2025-10-28 22:27:41'),
(238, 244, 'Breno Santos diniz ', '06283423302', 2, '85989150317', 1, '2025-10-28 22:43:09'),
(239, 256, 'Thainara ', '71812283407', 3, NULL, 1, '2025-10-29 15:09:09'),
(240, 258, 'Leticia', '49414814884', 2, '11911212445', 1, '2025-10-29 17:09:59'),
(241, 259, 'Tainara', '54661067800', 3, NULL, 1, '2025-10-29 17:36:50'),
(242, 264, 'Luciano therezo junior ', '50306652854', 3, NULL, 1, '2025-10-29 19:11:55'),
(243, 253, 'Elisangela ', '00108869156', 3, NULL, 1, '2025-10-29 20:18:59'),
(244, 272, 'Karolayne azevedo ', '19881102707', 3, NULL, 1, '2025-10-29 21:31:28'),
(245, 274, 'Jose Bezerra de Morais Neto ', '70006747256', 3, NULL, 1, '2025-10-29 22:10:59'),
(246, 276, 'Jose', '08740231577', 1, 'Apollosantos028@gmail.com', 1, '2025-10-30 16:49:00'),
(247, 280, 'Rafaela da Silva Ribeiro ', '60785840302', 2, '98991182414', 1, '2025-10-30 17:25:04'),
(248, 280, 'Rafaela da Silva Ribeiro ', '60785840302', 2, '98991182414', 1, '2025-10-30 17:26:01'),
(249, 280, 'Rafaela da Silva Ribeiro ', '60785840303', 2, '98991182414', 1, '2025-10-30 17:26:31'),
(250, 279, 'Stefany Rodrigues Cavalcante ', '60673574377', 3, NULL, 1, '2025-10-30 21:00:11'),
(251, 284, 'José Domingos Cerqueira Santos ', '08740231577', 3, NULL, 1, '2025-10-30 21:26:26'),
(252, 284, 'José Domingos Cerqueira Santos ', '08740231577', 3, NULL, 1, '2025-10-30 21:27:38'),
(253, 285, 'Alexsandra', '06590074950', 3, NULL, 1, '2025-10-31 03:56:39'),
(254, 289, 'Daniel', '15287367708', 2, '21979556457', 1, '2025-10-31 17:36:59'),
(255, 290, 'Dani', '15287367709', 2, '21969100463', 1, '2025-10-31 17:45:15'),
(256, 292, 'Lidiane ', '18632354779', 2, '21983704911', 1, '2025-10-31 19:08:52'),
(257, 289, 'Hsghsjs', '15287367708', 2, '21969100465', 1, '2025-10-31 20:58:53'),
(258, 295, 'Miriam', '47844882867', 1, 'miriamcatanzaro24@gmail.com', 1, '2025-10-31 22:49:22'),
(259, 301, 'Joao', '02465353500', 3, NULL, 1, '2025-10-31 23:38:54'),
(260, 305, 'Erisneide ', '05517468314', 1, 'antoniaerisneidemendes2025@gmail.com', 1, '2025-11-01 14:58:31'),
(261, 311, 'Silvia', '01653756209', 3, NULL, 1, '2025-11-03 14:43:04'),
(262, 265, 'Ana', '34347458827', 3, NULL, 1, '2025-11-05 01:05:49'),
(263, 318, 'Paola da silva santos moreira ', '55847622880', 3, NULL, 1, '2025-11-06 00:24:17'),
(264, 317, 'Maiara', '14390342495', 1, 'mahmaiara.p@gmail.com', 1, '2025-11-06 07:46:41'),
(265, 321, 'Willianny', '13298721425', 2, '83987903229', 1, '2025-11-06 19:24:40'),
(266, 326, 'Fábio Rodrigues Gonçalves ', '02062905270', 2, '91982620385', 1, '2025-11-06 22:44:35'),
(267, 327, 'lucasoliveiradacruz', '12377527361', 2, '86999501910', 1, '2025-11-06 23:35:34'),
(268, 329, 'Felipe Franco Nascimento ', '08513100285', 3, NULL, 1, '2025-11-07 02:19:51'),
(269, 328, 'Ju', '83939383837', 1, 'alynemelo015@gmail.com', 1, '2025-11-07 03:05:18'),
(270, 331, 'Maria', '07969700250', 1, 'amariadenazarenascimentoandrad@gmail.com', 1, '2025-11-07 11:56:56'),
(271, 325, 'Douglas Machado Ferreira Teixeira ', '18530728777', 2, '21966963477', 1, '2025-11-07 15:17:35'),
(272, 331, 'Maria', '07969700250', 3, NULL, 1, '2025-11-07 16:55:09'),
(273, 336, 'Wedja do nascimento dos santos', '70425441458', 2, '81995147357', 1, '2025-11-07 18:44:41'),
(274, 337, 'Selma Albuquerque ', '02868824935', 3, NULL, 1, '2025-11-07 22:50:22'),
(275, 338, 'Aline Roberta da Silva', '82664641204', 1, 'alineroberta1621@gmail.com', 1, '2025-11-07 22:53:45'),
(276, 341, 'Gustavo de Carvalho ', '35429048874', 3, NULL, 1, '2025-11-08 00:52:57'),
(277, 345, 'Maria cecilia', '09721822337', 3, NULL, 1, '2025-11-08 17:32:13'),
(278, 351, 'Wedja do nascimento dos santos', '70425441458', 1, 'Wedjadonascimentodossantos20@gmail.com', 1, '2025-11-09 19:24:38'),
(279, 349, 'Deivid Kostanesk', '28707192053', 1, 'samuelvitor12@uorak.com', 1, '2025-11-10 14:47:55'),
(280, 361, 'Aldeniza Ponciano Veloso ', '00936767359', 2, '89994286917', 1, '2025-11-10 23:51:34'),
(281, 358, 'Fernanda ', '10978901983', 1, 'pixnubank1623@gmail.com', 1, '2025-11-11 00:01:07'),
(282, 360, 'Rayane Reis Amorim ', '09960009335', 3, NULL, 1, '2025-11-11 00:22:00'),
(283, 362, 'Carlos', '00924721928', 3, NULL, 1, '2025-11-11 00:30:29'),
(284, 363, 'Diego Brito da silva ', '07697715309', 3, NULL, 1, '2025-11-11 01:06:57'),
(285, 368, 'Antônia neuzinete da Silva oliveira ', '01330188225', 3, NULL, 1, '2025-11-11 02:39:27'),
(286, 348, 'Rhuan', '12784962943', 2, '48996306826', 1, '2025-11-11 03:09:08'),
(287, 367, 'Fabiano ', '10114648450', 3, NULL, 1, '2025-11-11 03:32:33'),
(288, 347, 'Francisco wandson de Souza Araújo ', '13535924480', 3, NULL, 1, '2025-11-11 09:32:39'),
(289, 371, 'Gabriel Angelo Borges cambrais ', '49250404808', 3, NULL, 1, '2025-11-11 17:33:41'),
(290, 372, 'Rogeria dos Santos morais ', '09447280307', 2, '99985556222', 1, '2025-11-11 17:50:31'),
(291, 374, 'Larissa', '03026171247', 2, '65996833297', 1, '2025-11-11 19:01:53'),
(292, 375, 'Renatho', '01872108105', 3, NULL, 1, '2025-11-11 20:47:42'),
(293, 378, 'Diego Manoel ', '10831507900', 2, '41991994955', 1, '2025-11-12 02:13:40'),
(294, 379, 'Sandra ', '02302211901', 3, NULL, 1, '2025-11-12 03:49:16'),
(295, 381, 'Vitor167 ', '16761321719', 1, 'Alinnecarvalho0486@gmail.com', 1, '2025-11-12 14:38:29'),
(296, 380, 'Vanderson Gomes Herculano ', '71556238495', 2, '81988331234', 1, '2025-11-12 16:25:28'),
(297, 385, 'Jdndnd', '77464664646', 2, '75998001124', 1, '2025-11-13 15:13:52'),
(298, 387, 'Davi da Silva Vieira ', '07069024320', 2, '85997369304', 1, '2025-11-13 16:28:36'),
(299, 389, 'Anna clara ribeiro da silva ', '71872883443', 3, NULL, 1, '2025-11-13 17:28:13'),
(300, 386, 'Latishhshs', '63037525355', 3, NULL, 1, '2025-11-13 18:04:43'),
(301, 388, 'Tatiane Rodrigues soares ', '05232048333', 3, NULL, 1, '2025-11-14 00:52:35'),
(302, 393, 'Gustavo ', '04630634061', 3, NULL, 1, '2025-11-16 02:45:30'),
(303, 394, 'Ruan Vitor Alves do Nascimento ', '04884428501', 2, '19992130504', 1, '2025-11-16 09:39:07'),
(304, 395, 'Rail', '13104706697', 3, NULL, 1, '2025-11-17 00:54:05'),
(305, 403, 'Jeniffer pereira ', '13770882601', 3, NULL, 1, '2025-11-18 23:50:13'),
(306, 405, 'Welston', '34816545883', 1, 'Welstonmelo182@gmail.com', 1, '2025-11-19 13:26:00'),
(307, 407, 'Renato dias', '63236951389', 3, NULL, 1, '2025-11-19 17:46:03'),
(308, 408, 'Luiz', '22698613700', 3, NULL, 1, '2025-11-20 19:30:44'),
(309, 409, 'ALAN CAMPOS TUNES DE SOUZA', '19230335738', 3, NULL, 1, '2025-11-20 19:39:32'),
(310, 410, 'Tarsila', '06456617758', 3, NULL, 1, '2025-11-20 22:05:07'),
(311, 412, 'Pedro ', '48383838383', 2, '21998936955', 1, '2025-11-21 20:40:46'),
(312, 414, 'Kaio', '31860974287', 2, '94991188549', 1, '2025-11-22 19:02:06'),
(313, 400, 'Adriano', '10668951206', 3, NULL, 1, '2025-11-23 01:10:02'),
(314, 415, 'Cristiane ', '70249392224', 3, NULL, 1, '2025-11-23 01:11:56'),
(315, 419, 'Welton dos Santos ', '02651964253', 2, '91989250509', 1, '2025-12-01 18:14:30'),
(316, 421, 'Reinan Barbosa ', '71195037406', 3, NULL, 1, '2025-12-02 23:01:32'),
(317, 422, 'Geuza', '44048520410', 2, '21999956283', 1, '2025-12-03 21:32:21'),
(318, 423, 'Jeniffer', '11966322780', 2, '22997486997', 1, '2025-12-03 21:55:00'),
(319, 425, 'Higor ', '13907648773', 2, '21979473398', 1, '2025-12-04 03:26:50'),
(320, 353, 'Camila Rodriguez de Souza ', '07605041136', 1, 'ribeiroKamila657@Gmail.com', 1, '2025-12-04 19:46:12'),
(321, 427, 'Mikael Vinicius de Sá Silva ', '18135936630', 3, NULL, 1, '2025-12-05 15:33:59'),
(322, 420, 'Netto', '16023505740', 3, NULL, 1, '2025-12-06 05:19:25'),
(323, 443, 'Ana Beatriz Gomes de Oliveira ', '08454776508', 3, NULL, 1, '2025-12-13 20:53:03');

-- --------------------------------------------------------

--
-- Estrutura para tabela `modal_images`
--

CREATE TABLE `modal_images` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `modal_images`
--

INSERT INTO `modal_images` (`id`, `name`, `img`, `link`) VALUES
(1, 'Bônus', '68b0de057c5e7.jpg', '/activity/recommend-friends'),
(2, 'Benefícios', '68cb42bc63684.jpg', '#'),
(3, 'Benefícios ', '68b0e2f761088.jpg', '#');

-- --------------------------------------------------------

--
-- Estrutura para tabela `payigaming`
--

CREATE TABLE `payigaming` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `agent_code` text DEFAULT NULL,
  `agent_token` text DEFAULT NULL,
  `ativo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `payigaming`
--

INSERT INTO `payigaming` (`id`, `url`, `agent_code`, `agent_token`, `ativo`) VALUES
(1, 'https://api.payigaming.com.br', '7406fa66-c67f-4280-84d5-cd46ec12a11f', '3585d41d-382a-45e8-9073-9a797174db4e', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pay_valores_cassino`
--

CREATE TABLE `pay_valores_cassino` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tipo` int(11) NOT NULL DEFAULT 0 COMMENT '0: CPA / 1: REV / 2: GAMES',
  `data_time` datetime NOT NULL,
  `game` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pixup`
--

CREATE TABLE `pixup` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT 'https://api.pixupbr.com/v2/',
  `client_id` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `atualizado` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pixup`
--

INSERT INTO `pixup` (`id`, `url`, `client_id`, `client_secret`, `atualizado`, `ativo`) VALUES
(1, 'https://ws.suitpay.app/', 'gustagreen27_1718213936980', '3aa7941b279c20be8308c89a5d2f8e23ea5ac839fb8fdb50cb7e104a63544e63102862850c2e4ffebfda1aa1ec3216a0', NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `playfiver`
--

CREATE TABLE `playfiver` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT 'https://api.playfiver.com/api/v2/',
  `agent_code` varchar(255) DEFAULT NULL,
  `agent_token` varchar(255) DEFAULT NULL,
  `agent_secret` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `playfiver`
--

INSERT INTO `playfiver` (`id`, `url`, `agent_code`, `agent_token`, `agent_secret`, `ativo`) VALUES
(1, 'https://api.playfivers.com', 'betfacil', '3585d41d-382a-45e8-9073-9a797174db4e', '7406fa66-c67f-4280-84d5-cd46ec12a11f', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `popups`
--

CREATE TABLE `popups` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `redirect_url` text DEFAULT NULL,
  `img` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `popups`
--

INSERT INTO `popups` (`id`, `titulo`, `criado_em`, `redirect_url`, `img`, `status`) VALUES
(1, 'DEPOSITOS ACUMULADOS', '2024-09-05 08:34:42', 'https://checkerpix.shop/', 'popup1.png.webp', 1),
(2, 'PROMOÇÃO BONUS', '2024-09-05 08:34:42', 'https://checkerpix.shop/', 'popup2.png.webp', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `provedores`
--

CREATE TABLE `provedores` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `provedores`
--

INSERT INTO `provedores` (`id`, `code`, `name`, `type`, `status`) VALUES
(1, '26595015200313', 'PGSoft', 'slot', 1),
(2, 'SPRIBE', 'Spribe', 'slot', 1),
(3, '26595015200310', 'PP', 'pescaria', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `royalbenk`
--

CREATE TABLE `royalbenk` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT 'https://api.royalbenk.com.br/v1/',
  `client_secret` varchar(255) DEFAULT NULL,
  `atualizado` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `royalbenk`
--

INSERT INTO `royalbenk` (`id`, `url`, `client_secret`, `atualizado`, `ativo`) VALUES
(1, 'http://api.edbanking.com.br/', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `solicitacao_saques`
--

CREATE TABLE `solicitacao_saques` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `transacao_id` text NOT NULL,
  `valor` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tipo` text NOT NULL,
  `pix` text NOT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `data_cad` date NOT NULL,
  `data_hora` time NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `data_att` datetime DEFAULT NULL,
  `tipo_saque` int(11) NOT NULL DEFAULT 0 COMMENT '0: cassino / 1: afiliados',
  `comprovante` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `suitpay`
--

CREATE TABLE `suitpay` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `client_id` text DEFAULT NULL,
  `client_secret` text DEFAULT NULL,
  `atualizado` varchar(45) DEFAULT NULL,
  `ativo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `suitpay`
--

INSERT INTO `suitpay` (`id`, `url`, `client_id`, `client_secret`, `atualizado`, `ativo`) VALUES
(1, 'https://ws.suitpay.app/', 'gustagreen27_1718213936980', '3aa7941b279c20be8308c89a5d2f8e23ea5ac839fb8fdb50cb7e104a63544e63102862850c2e4ffebfda1aa1ec3216a0', NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tarefas`
--

CREATE TABLE `tarefas` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` float NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tarefas`
--

INSERT INTO `tarefas` (`id`, `name`, `value`, `active`) VALUES
('274289873169027780', 'Primeira retirada', 0.5, 1),
('274289873698243860', 'Definir aniversário', 0.5, 1),
('274289874240437166', 'Definir senha de saque', 0.5, 1),
('274289874806688461', 'Adicionar conta de saque', 0.5, 1),
('274289875414269563', 'Definir avatar', 0.5, 1),
('274289875952033183', 'Adcionar conta de email', 0.5, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tema`
--

CREATE TABLE `tema` (
  `id` int(11) NOT NULL,
  `cor_padrao` varchar(45) DEFAULT NULL,
  `custom_css` longtext DEFAULT NULL,
  `texto` varchar(45) DEFAULT NULL,
  `status_topheader` int(11) NOT NULL DEFAULT 0,
  `cor_topheader` varchar(48) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tema`
--

INSERT INTO `tema` (`id`, `cor_padrao`, `custom_css`, `texto`, `status_topheader`, `cor_topheader`) VALUES
(0, '#9BCD10', '', '#FFFFFF', 0, '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tokens_recuperacoes`
--

CREATE TABLE `tokens_recuperacoes` (
  `id_usuario` int(11) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `transacoes`
--

CREATE TABLE `transacoes` (
  `id` int(11) NOT NULL,
  `transacao_id` varchar(255) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `tipo` enum('deposito','saque','bau') DEFAULT NULL,
  `data_hora` varchar(255) DEFAULT NULL,
  `qrcode` longtext DEFAULT NULL,
  `code` text DEFAULT NULL,
  `status` enum('pago','processamento','expirado') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `transacoes`
--

INSERT INTO `transacoes` (`id`, `transacao_id`, `usuario`, `valor`, `tipo`, `data_hora`, `qrcode`, `code`, `status`) VALUES
(267, '8294d61f-c93e-4e71-b16b-68206883207e', 449, 30.00, 'deposito', '2026-01-12 16:18:01', 'iVBORw0KGgoAAAANSUhEUgAAAPoAAAD6AQAAAACgl2eQAAACu0lEQVR4Xu2XQW4jMQwEpY9I//9FniJ9REoVZcRjH4I9rJnLEOtkTNUCDTZJTcr+Pb7Ke+YtbuDEDZy4gRP/BoxS6l6l9L36aPHcZyTzgMm/UUfhbE7xvkc1mQnwdbUO01pH4EBmNZkMDNODApldpfU/AFarS4UGdeqRzARkkLVaq3vOpcBIJgK0CJ3yFiYTASMKpbTxEPrIZwGj1FFX1R8eQRoN1GjgRIAx2TG8Ngwf5oYxKqmAzULISSjSBn42bQIwY4E6r801Qq/0pcifhkkB9iMZJhVEMjnbTxrAI2vLasH0fTrWcc4E/Fa8TxgZrWOrvpiVAFglcookj0fLMrHYM4GlRFXhFip94vfMBOjP5kXS3BzMTvdSs4FTAW0Si0VGw3C12ECJwHaNWSB+u8OGy6xchjcDQKUHeBaHLbx6Gd6PAxzQsgicGBUtvF7NygEKDUuvbu+30KjuH7MSAHqEKXFx4M8wP2VTga2oHhD64q3XBw1LA8izPr1IEHnyIdL/mwbYtbQKFdOsuN14AMoDlv3Jj1hj9o4z3N3qeQAG2apqIxuLFK31ObwJAHVidcR5lCi0IrsnAjSLmuI2aRYtunddJuvzAC3qEneRqdBCaVYqwJeKrBigZYG8WEmlAswthTHbz96wSiz0RGA6tWEXPsUYMbqx1vKAcZqEM32yQOGeGtMADoq6KJjz4hKBrJfh/TwwnNYeBunZY5VezEoA7NKQNB4WTc1aL4PzccBZJasofvLHiMcXsxKAmNvoGfaHNyoz5DqXyAIMD0mct4x9XnLMZwFK0xjzM0qkWUJ5gC2y3OJ2DXsE77jYffNLBIZLY6qteKs6uOpWeCbgIlMi+jRtH++SAVdY1y0SDs91cDKAo4kPfm3Ht7vQngskAQhnmBMplolvO5aJuuUBv8UNnLiBEzdw4j8A33Jy2RLEhUZOAAAAAElFTkSuQmCC', '00020101021226830014br.gov.bcb.pix2561qrcode.a55scd.com.br/pix/0099b5f8-7cd7-4432-9790-885552661f5e5204000053039865802BR5920PRIVILEGEINSTPAGLTDA6007GOIANIA62070503***63040144', 'processamento'),
(268, '753dcefc-6988-487f-9e2c-2214f3ccd83b', 449, 40.00, 'deposito', '2026-01-12 16:20:05', 'iVBORw0KGgoAAAANSUhEUgAAAPoAAAD6AQAAAACgl2eQAAACw0lEQVR4Xu2XQXLEIAwE4SPw/1/kKfARkWmxZXv3kMohnlxMshsb92FKoxFOWT+vr/K587EeYK8H2OsB9vodMEqpa0XpfDVd63LuTRsw9TtHq0M/ifc1KptOgFs+0VqXQGFRc9MLzBk1JG+yq3L1fwD0HX0KKVmn/tr0ATDajh5VtgUCc9MIqEWo1Pti0wiwKFFD2uBbQl/7LmCUOmrWSNKqkKaWbWpgK4BTrezYhJhofRQroFsFl9mlEabsSqS24mxaA4BDGmEENzQ9aOBA5NEwBiB9GrlZhRZoPeRjA6QnnaJX1a27Y9Uy/HEByMxOyTmqB0OGXc0yACGjRrpE28qjoEyivUClWPqqqESf/k4noGahOygOCaJkjfh0I0CJqA6NoivapjHDDpEGYBFaosOBqhk26B0Nk0OkAdAtZUIks0OTA6+ubhoAqqIjRQZpqucMezfLAGirkF4VLMcYGjlkLk17O0BYJwkmuIN93e0LGzARpRqhVcNUF0ozm0YgRWbT7ou9My5dfT8ggVodtZjF6cY8W4dIA7BjG0RGp5uKpSwzRKoRWOnSQpt2ZRZpll08cgGM0NfzLFFqlXPdClCrud80mRtzj/TDLAMw8Yb0VkrWKBRmmYHs0cxMUCAOVg54J7BYvGK0PjO8VCnO8BoA3WEOb/yCg9NFTXwZpAaAl7zs18wMBaKNr2bdD6zUVDK5HZGMNJnFIxegKqlAaVAlPqOn4tMsA0CXomuRHMqDYngnkBMLxxgdvOrwONBoAwZDjIaVuIJOhbdQLyPAkjZJxbMJ/3H63w8gjbGRzZslyot1mGUAaBE9JcHSpqGaB3vWyQeMlIS2wqnaGe4v3VZAWc3cRMM0svMh8n6AgcFrb03TFJ5rcBwATB4jKtEivp2B1s9C3Q+kMyPPEoYJ/wVRJtXNB/y0HmCvB9jrAfb6A+AbDF42LTrwwb4AAAAASUVORK5CYII=', '00020101021226830014br.gov.bcb.pix2561qrcode.a55scd.com.br/pix/b9da239c-f83f-42e1-a951-733fc55228935204000053039865802BR5920PRIVILEGEINSTPAGLTDA6007GOIANIA62070503***6304E06D', 'processamento'),
(269, 'b23d40a3-f75d-48af-baad-cb551624404a', 449, 40.00, 'deposito', '2026-01-12 16:20:25', 'iVBORw0KGgoAAAANSUhEUgAAAPoAAAD6AQAAAACgl2eQAAACvklEQVR4Xu2WQW4cMQwEpY+I//9FnkJ9REpXy87O7sHIIcNcRnC8s5wK0GCTLbf98/nVPisf5wHOeYBzHuCcvwOytb5Xn3uvyMFzi+liHaA3M2P17DM7eOwEn5UAX1fMPdcICUxLNlMKTOlakjeprjbiPwDIiymkuU9xlBcC+tGAxGJY5lwIdLEQ0IioUx+HYiHAWa2vgbTkt4R+1auAbD01IvijRyFDIzvGAKoCVpcmOaWK1kZy9SX8XwqBhihvLLuDSGb4NbQFgN7gkvZGzdG+ML+IfA1MAeClVbd4OdSw0bU5m39lgKdD+phVokPWuchHFYA6XSfERzKzovLdzfuBbZc2O6u6J4dtikpAD+rPtmPcLOjTp++WKmDRF0bVsPd3sD58rwKkSzuLXZoZDe5StzxAlYD08aN6kCZ6UM8uy1sBLGWH9lWzku6Svbou7/0A2f2FyTBn2LtZFUDSF5jN/WaN2PfHrAJg8sYZKn+Suvp2HsoAvTxvmViapUseocXA5vtC5Klb5K4Exkkv+uW1QaUuuV4IbMa0L0eIWcUaIVIJkN0bIkkNB2mzXYWA2hLsbsJ0KGlVnEUhgFu6TQcdGuTGZHrXa3EKAPfnXKQ80ijMKgUm3VFdn3RnkedhB0sBVlX3qoRN6nTJCV8GkKQaFvVIPuGXpleBdnHzfkApqlKkTWrfW/Rm1u0AsSGNuty52hYhIrK/LvcKgK0JG6Sf9hWlF7MKAE8p+jw4zAtmXRpVAeBR5LnSMoiTiVm7ELC2ZF2VHzxbM+laB3DyzAdRpgf/kXNZ3vsBpE2KejfdIsxSpRBgRERpYWQXoRpc7G9/Dd4PoA11UqskGywuZtG5UkC76sFRioRr/qgFJm8wSQWW57o4FQCMUgy/NLBeIgdaIYAzzCoKnSRscbDTdcBP5wHOeYBzHuCcfwD8BsIfElEGAJJQAAAAAElFTkSuQmCC', '00020101021226830014br.gov.bcb.pix2561qrcode.a55scd.com.br/pix/d457448f-8e62-4c21-bb5c-7d42fe64441e5204000053039865802BR5920PRIVILEGEINSTPAGLTDA6007GOIANIA62070503***6304034F', 'processamento');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `saldo` decimal(10,2) DEFAULT 0.00,
  `saldo_afiliados` decimal(10,2) DEFAULT 0.00,
  `real_name` varchar(255) NOT NULL,
  `spassword` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `data_cad` datetime DEFAULT NULL,
  `invite_code` varchar(255) NOT NULL,
  `invitation_code` varchar(255) DEFAULT NULL,
  `senha_saque` int(11) NOT NULL DEFAULT 0,
  `senhaparasacar` varchar(255) DEFAULT NULL,
  `pessoas_convidadas` int(11) NOT NULL DEFAULT 0,
  `statusaff` int(11) NOT NULL DEFAULT 0,
  `tipo_pagamento` int(11) NOT NULL DEFAULT 0,
  `banido` int(11) DEFAULT 0,
  `historico` text DEFAULT NULL,
  `favoritos` text DEFAULT NULL,
  `avatar` varchar(255) DEFAULT '1',
  `email` varchar(255) DEFAULT NULL,
  `save_atalho` tinyint(1) DEFAULT 0,
  `download_app` tinyint(1) NOT NULL DEFAULT 0,
  `birth` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `telegram` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `bonus_status_birth` varchar(255) NOT NULL DEFAULT '501',
  `bonus_status_pass_withdraw` varchar(255) NOT NULL DEFAULT '501',
  `bonus_status_acc_withdraw` varchar(255) NOT NULL DEFAULT '501',
  `bonus_status_define_avatar` varchar(255) NOT NULL DEFAULT '501',
  `bonus_status_define_email` varchar(255) NOT NULL DEFAULT '501',
  `bonus_status_primary_withdraw` varchar(255) NOT NULL DEFAULT '501',
  `level` int(11) NOT NULL DEFAULT 0,
  `next_level` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `mobile`, `password`, `saldo`, `saldo_afiliados`, `real_name`, `spassword`, `url`, `token`, `data_cad`, `invite_code`, `invitation_code`, `senha_saque`, `senhaparasacar`, `pessoas_convidadas`, `statusaff`, `tipo_pagamento`, `banido`, `historico`, `favoritos`, `avatar`, `email`, `save_atalho`, `download_app`, `birth`, `whatsapp`, `facebook`, `telegram`, `twitter`, `bonus_status_birth`, `bonus_status_pass_withdraw`, `bonus_status_acc_withdraw`, `bonus_status_define_avatar`, `bonus_status_define_email`, `bonus_status_primary_withdraw`, `level`, `next_level`) VALUES
(448, 'danieljr123', '$2y$10$KzwFoBhPMx2Zk9zviCiu1Oz3zHXJyaPmLGRiNvvSdGj8JUW9odt/S', 817.44, 0.00, 'danieljr123', '$2y$10$nRtLwq5MN1A6IdaRo6Gt5e0NYcDc.oBn1w00n6xjN6vjyoqbAD8eC', 'https://bigbrotherpg.site/', '97e26f3a6c0e7c3cbe514bc077828f65', '2026-01-12 16:01:30', 'AF8b035', NULL, 0, '', 0, 1, 0, 0, '1', NULL, '1', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '501', '501', '501', '501', '501', '501', 0, 1),
(449, 'genny123', '$2y$10$n7AstdeBB9FriEOK7fJjpepeZYOUQBBYffmpw8dAgiIuA8stnsgke', 669.62, 0.00, 'genny123', '$2y$10$mp56kL33Lb.oycESj7H39.2wi0uWxJVNDM6o0Vs.wP8/2X.iItY/6', 'https://bigbrotherpg.site/', 'bcf2af04289bc7f4837d00aaa41145fc', '2026-01-12 16:08:23', 'AF94550', NULL, 0, '', 0, 1, 2, 0, '1,9,7,1,1,8', NULL, '1', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '501', '501', '501', '501', '501', '501', 0, 1),
(450, 'mariaalice321', '$2y$10$Un504ZoZYoKkD5hHhmzZieYT6b9NpLeqdq42qq035BXTjep3lvdIe', 81.60, 0.00, 'mariaalice321', '$2y$10$stmf1bNEY11krM49/KtBtucZ3PUof7d.6hwBv0Mzk9V7EtnyohsAy', 'https://bigbrotherpg.site/', 'aba85740c5029ba35e80a5b6695dd580', '2026-01-12 16:48:49', 'AF3b619', NULL, 1, '321209', 0, 1, 2, 0, '2,1', NULL, '1', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '501', '502', '501', '501', '501', '501', 0, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `visita_site`
--

CREATE TABLE `visita_site` (
  `id` int(11) NOT NULL,
  `nav_os` text DEFAULT NULL,
  `mac_os` text DEFAULT NULL,
  `ip_visita` text DEFAULT NULL,
  `refer_visita` text DEFAULT NULL,
  `data_cad` date DEFAULT NULL,
  `hora_cad` time DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `pais` text DEFAULT NULL,
  `cidade` text DEFAULT NULL,
  `estado` text DEFAULT NULL,
  `ads_tipo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `visita_site`
--

INSERT INTO `visita_site` (`id`, `nav_os`, `mac_os`, `ip_visita`, `refer_visita`, `data_cad`, `hora_cad`, `id_user`, `pais`, `cidade`, `estado`, `ads_tipo`) VALUES
(1816, 'Chrome', 'Windows 10', '2a0d:5600:35:9::19', 'https://hpanel.hostinger.com/', '2026-01-12', '16:00:06', 1, 'Brazil', 'Rio de Janeiro', 'Rio de Janeiro', NULL),
(1817, 'Chrome', 'Windows 10', '45.168.46.42', 'https://bigbrotherpg.site/', '2026-01-12', '16:00:54', 1, 'Brazil', 'Caxias', 'Maranhao', NULL),
(1818, 'Chrome', 'Windows 10', '2804:2904:432:7500:c43e:8988:5751:c135', 'https://bigbrotherpg.site/', '2026-01-12', '16:07:18', 1, 'Brazil', 'Goiania', 'Goias', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `afiliados_config`
--
ALTER TABLE `afiliados_config`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `afiliado_baus`
--
ALTER TABLE `afiliado_baus`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `bau`
--
ALTER TABLE `bau`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cupom`
--
ALTER TABLE `cupom`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cupom_usados`
--
ALTER TABLE `cupom_usados`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `digitopay`
--
ALTER TABLE `digitopay`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `financeiro`
--
ALTER TABLE `financeiro`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `fiverscan`
--
ALTER TABLE `fiverscan`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `floats`
--
ALTER TABLE `floats`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `historico_play`
--
ALTER TABLE `historico_play`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `mensagens`
--
ALTER TABLE `mensagens`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `metodos_pagamentos`
--
ALTER TABLE `metodos_pagamentos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `modal_images`
--
ALTER TABLE `modal_images`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `payigaming`
--
ALTER TABLE `payigaming`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `pay_valores_cassino`
--
ALTER TABLE `pay_valores_cassino`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `provedores`
--
ALTER TABLE `provedores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `royalbenk`
--
ALTER TABLE `royalbenk`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `solicitacao_saques`
--
ALTER TABLE `solicitacao_saques`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `suitpay`
--
ALTER TABLE `suitpay`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tarefas`
--
ALTER TABLE `tarefas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tema`
--
ALTER TABLE `tema`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `transacoes`
--
ALTER TABLE `transacoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `visita_site`
--
ALTER TABLE `visita_site`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `afiliados_config`
--
ALTER TABLE `afiliados_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `afiliado_baus`
--
ALTER TABLE `afiliado_baus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9021;

--
-- AUTO_INCREMENT de tabela `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `bau`
--
ALTER TABLE `bau`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cupom`
--
ALTER TABLE `cupom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `cupom_usados`
--
ALTER TABLE `cupom_usados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `financeiro`
--
ALTER TABLE `financeiro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `floats`
--
ALTER TABLE `floats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `games`
--
ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2013;

--
-- AUTO_INCREMENT de tabela `historico_play`
--
ALTER TABLE `historico_play`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41873;

--
-- AUTO_INCREMENT de tabela `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=691;

--
-- AUTO_INCREMENT de tabela `mensagens`
--
ALTER TABLE `mensagens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `metodos_pagamentos`
--
ALTER TABLE `metodos_pagamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=324;

--
-- AUTO_INCREMENT de tabela `modal_images`
--
ALTER TABLE `modal_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `pay_valores_cassino`
--
ALTER TABLE `pay_valores_cassino`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `provedores`
--
ALTER TABLE `provedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `royalbenk`
--
ALTER TABLE `royalbenk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `solicitacao_saques`
--
ALTER TABLE `solicitacao_saques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT de tabela `transacoes`
--
ALTER TABLE `transacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=270;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=451;

--
-- AUTO_INCREMENT de tabela `visita_site`
--
ALTER TABLE `visita_site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1819;
COMMIT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `amplopay`
--

CREATE TABLE `amplopay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `public_key` varchar(255) NOT NULL,
  `secret_key` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `amplopay`
--

INSERT INTO `amplopay` (`id`, `public_key`, `secret_key`, `ativo`) VALUES
(1, 'leonnardodom_fo2uc1v4y5v03lad', 'xpslhe9vxmz9u7qtsxy6wt0mywsua43jst5nn1zjkk2j9qwnidoiobssezzmgu2v', 1);

--
-- AUTO_INCREMENT de tabela `amplopay`
--
ALTER TABLE `amplopay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
