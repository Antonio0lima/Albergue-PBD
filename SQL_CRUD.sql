-- ==========================================
-- CRUD CLIENTE
-- ==========================================

-- CREATE
INSERT INTO Cliente (nome, cpf, email, telefone)
VALUES ('Pedro Henrique', '45678901234', 'pedro@gmail.com', '(21)98888-7777');

-- READ
SELECT * FROM Cliente;

-- UPDATE
UPDATE Cliente
SET telefone = '(21)97777-6666'
WHERE id_cliente = 4;

-- DELETE
DELETE FROM Cliente
WHERE id_cliente = 4;


-- ==========================================
-- CRUD QUARTO
-- ==========================================

-- CREATE
INSERT INTO Quarto (numero, capacidade, possui_banheiro)
VALUES (104, 4, TRUE);

-- READ
SELECT * FROM Quarto;

-- UPDATE
UPDATE Quarto
SET possui_banheiro = FALSE
WHERE id_quarto = 4;

-- DELETE
DELETE FROM Quarto
WHERE id_quarto = 4;


-- ==========================================
-- CRUD VAGA
-- ==========================================

-- CREATE
INSERT INTO Vaga
(id_quarto, numero_vaga, tipo_cama, posicao,
 perto_porta, perto_janela, sol_manha, observacoes)
VALUES
(1, 5, 'Beliche', 'Superior',
 FALSE, TRUE, TRUE, 'Nova vaga');

-- READ
SELECT * FROM Vaga;

-- UPDATE
UPDATE Vaga
SET observacoes = 'Próxima da tomada'
WHERE id_vaga = 25;

-- DELETE
DELETE FROM Vaga
WHERE id_vaga = 25;


-- ==========================================
-- CRUD RESERVA
-- ==========================================

-- CREATE
INSERT INTO Reserva
(id_cliente, data_reserva, data_inicio, data_fim,
 valor_total, status_reserva, status_pagamento, codigo_transacao)
VALUES
(1, '2026-07-06', '2026-07-20', '2026-07-25',
 600.00, 'Confirmada', 'Pago', 'TRX003');

-- READ
SELECT * FROM Reserva;

-- UPDATE
UPDATE Reserva
SET status_reserva = 'Cancelada'
WHERE id_reserva = 3;

-- DELETE
DELETE FROM Reserva_Vaga
WHERE id_reserva = 3;

DELETE FROM Reserva
WHERE id_reserva = 3;


-- ==========================================
-- CRUD RESERVA_VAGA
-- ==========================================

-- CREATE
INSERT INTO Reserva_Vaga (id_reserva, id_vaga)
VALUES (2, 8);

-- READ
SELECT * FROM Reserva_Vaga;

-- UPDATE
UPDATE Reserva_Vaga
SET id_vaga = 9
WHERE id_reserva = 2
AND id_vaga = 8;

-- DELETE
DELETE FROM Reserva_Vaga
WHERE id_reserva = 2
AND id_vaga = 9;
