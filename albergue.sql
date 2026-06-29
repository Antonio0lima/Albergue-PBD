-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29/06/2026 às 22:25
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `albergue`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` char(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome`, `cpf`, `email`, `telefone`) VALUES
(1, 'João Silva', '12345678901', 'joao@gmail.com', '(00) 12345-6789'),
(2, 'Maria Oliveira', '23456789012', 'maria@gmail.com', '(21)98888-2222'),
(3, 'Carlos Souza', '34567890123', 'carlos@gmail.com', '(31)97777-3333');

-- --------------------------------------------------------

--
-- Estrutura para tabela `quarto`
--

CREATE TABLE `quarto` (
  `id_quarto` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `capacidade` int(11) NOT NULL,
  `possui_banheiro` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `quarto`
--

INSERT INTO `quarto` (`id_quarto`, `numero`, `capacidade`, `possui_banheiro`) VALUES
(1, 101, 4, 1),
(2, 102, 8, 0),
(3, 103, 12, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `reserva`
--

CREATE TABLE `reserva` (
  `id_reserva` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `data_reserva` date NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  `status_reserva` varchar(20) DEFAULT 'Pendente',
  `status_pagamento` varchar(20) DEFAULT 'Pendente',
  `codigo_transacao` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `reserva`
--

INSERT INTO `reserva` (`id_reserva`, `id_cliente`, `data_reserva`, `data_inicio`, `data_fim`, `valor_total`, `status_reserva`, `status_pagamento`, `codigo_transacao`) VALUES
(1, 1, '2026-06-29', '2026-07-10', '2026-07-15', 500.00, 'Cancelada', 'Pago', 'TRX001');

-- --------------------------------------------------------

--
-- Estrutura para tabela `reserva_vaga`
--

CREATE TABLE `reserva_vaga` (
  `id_reserva` int(11) NOT NULL,
  `id_vaga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `reserva_vaga`
--

INSERT INTO `reserva_vaga` (`id_reserva`, `id_vaga`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `vaga`
--

CREATE TABLE `vaga` (
  `id_vaga` int(11) NOT NULL,
  `id_quarto` int(11) NOT NULL,
  `numero_vaga` int(11) NOT NULL,
  `tipo_cama` varchar(20) NOT NULL,
  `posicao` varchar(20) DEFAULT NULL,
  `perto_porta` tinyint(1) DEFAULT NULL,
  `perto_janela` tinyint(1) DEFAULT NULL,
  `sol_manha` tinyint(1) DEFAULT NULL,
  `observacoes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `vaga`
--

INSERT INTO `vaga` (`id_vaga`, `id_quarto`, `numero_vaga`, `tipo_cama`, `posicao`, `perto_porta`, `perto_janela`, `sol_manha`, `observacoes`) VALUES
(1, 1, 1, 'Beliche', 'Superior', 0, 1, 1, 'Vista para o jardim'),
(2, 1, 2, 'Beliche', 'Inferior', 1, 0, 0, 'Próxima ao banheiro'),
(3, 1, 3, 'Beliche', 'Superior', 0, 0, 0, 'Quarto silencioso'),
(4, 1, 4, 'Beliche', 'Inferior', 0, 1, 1, 'Proxima a tomada'),
(5, 2, 1, 'Beliche', 'Superior', 1, 0, 0, ''),
(6, 2, 2, 'Beliche', 'Inferior', 1, 0, 0, ''),
(7, 2, 3, 'Beliche', 'Superior', 0, 1, 1, ''),
(8, 2, 4, 'Beliche', 'Inferior', 0, 1, 1, ''),
(9, 2, 5, 'Beliche', 'Superior', 0, 0, 0, ''),
(10, 2, 6, 'Beliche', 'Inferior', 0, 0, 0, ''),
(11, 2, 7, 'Beliche', 'Superior', 0, 1, 0, ''),
(12, 2, 8, 'Beliche', 'Inferior', 1, 0, 0, ''),
(13, 3, 1, 'Beliche', 'Superior', 0, 1, 1, ''),
(14, 3, 2, 'Beliche', 'Inferior', 0, 1, 1, ''),
(15, 3, 3, 'Beliche', 'Superior', 0, 0, 0, ''),
(16, 3, 4, 'Beliche', 'Inferior', 1, 0, 0, ''),
(17, 3, 5, 'Beliche', 'Superior', 0, 0, 0, ''),
(18, 3, 6, 'Beliche', 'Inferior', 0, 1, 0, ''),
(19, 3, 7, 'Beliche', 'Superior', 0, 0, 0, ''),
(20, 3, 8, 'Beliche', 'Inferior', 1, 0, 0, ''),
(21, 3, 9, 'Beliche', 'Superior', 0, 1, 1, ''),
(22, 3, 10, 'Beliche', 'Inferior', 0, 0, 0, ''),
(23, 3, 11, 'Beliche', 'Superior', 0, 0, 0, ''),
(24, 3, 12, 'Beliche', 'Inferior', 1, 1, 1, '');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices de tabela `quarto`
--
ALTER TABLE `quarto`
  ADD PRIMARY KEY (`id_quarto`),
  ADD UNIQUE KEY `numero` (`numero`);

--
-- Índices de tabela `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Índices de tabela `reserva_vaga`
--
ALTER TABLE `reserva_vaga`
  ADD PRIMARY KEY (`id_reserva`,`id_vaga`),
  ADD KEY `id_vaga` (`id_vaga`);

--
-- Índices de tabela `vaga`
--
ALTER TABLE `vaga`
  ADD PRIMARY KEY (`id_vaga`),
  ADD KEY `id_quarto` (`id_quarto`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `quarto`
--
ALTER TABLE `quarto`
  MODIFY `id_quarto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `vaga`
--
ALTER TABLE `vaga`
  MODIFY `id_vaga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Restrições para tabelas `reserva_vaga`
--
ALTER TABLE `reserva_vaga`
  ADD CONSTRAINT `reserva_vaga_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id_reserva`),
  ADD CONSTRAINT `reserva_vaga_ibfk_2` FOREIGN KEY (`id_vaga`) REFERENCES `vaga` (`id_vaga`);

--
-- Restrições para tabelas `vaga`
--
ALTER TABLE `vaga`
  ADD CONSTRAINT `vaga_ibfk_1` FOREIGN KEY (`id_quarto`) REFERENCES `quarto` (`id_quarto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
