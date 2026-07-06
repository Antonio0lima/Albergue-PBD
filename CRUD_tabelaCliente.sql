CRUD da tabela Cliente

CREATE
INSERT INTO Cliente (nome, cpf, email, telefone)
VALUES ('Pedro Henrique', '45678901234', 'pedro@gmail.com', '(21)99999-8888');
READ
SELECT * FROM Cliente;
UPDATE
UPDATE Cliente
SET telefone = '(21)98888-7777'
WHERE id_cliente = 1;
DELETE
DELETE FROM Cliente
WHERE id_cliente = 3;
