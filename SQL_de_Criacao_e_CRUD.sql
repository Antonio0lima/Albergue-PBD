CREATE DATABASE Albergue;

USE Albergue;

CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL
);

CREATE TABLE Quarto (
    id_quarto INT AUTO_INCREMENT PRIMARY KEY,
    numero INT NOT NULL UNIQUE,
    capacidade INT NOT NULL,
    possui_banheiro BOOLEAN NOT NULL
);

CREATE TABLE Vaga (
    id_vaga INT AUTO_INCREMENT PRIMARY KEY,
    id_quarto INT NOT NULL,
    numero_vaga INT NOT NULL,
    tipo_cama VARCHAR(20) NOT NULL,
    posicao VARCHAR(20),
    perto_porta BOOLEAN,
    perto_janela BOOLEAN,
    sol_manha BOOLEAN,
    observacoes VARCHAR(255),

    FOREIGN KEY (id_quarto)
    REFERENCES Quarto(id_quarto)
);

CREATE TABLE Reserva (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_reserva DATE NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    valor_total DECIMAL(10,2),
    status_reserva VARCHAR(20) DEFAULT 'Pendente',
    status_pagamento VARCHAR(20) DEFAULT 'Pendente',
    codigo_transacao VARCHAR(100),

    FOREIGN KEY (id_cliente)
    REFERENCES Cliente(id_cliente)
);

CREATE TABLE Reserva_Vaga (
    id_reserva INT NOT NULL,
    id_vaga INT NOT NULL,

    PRIMARY KEY (id_reserva, id_vaga),

    FOREIGN KEY (id_reserva)
    REFERENCES Reserva(id_reserva),

    FOREIGN KEY (id_vaga)
    REFERENCES Vaga(id_vaga)
);

INSERT INTO Cliente (nome,cpf,email,telefone)
VALUES
('João Silva','12345678901','joao@gmail.com','(21)99999-1111'),
('Maria Oliveira','23456789012','maria@gmail.com','(21)99999-2222'),
('Carlos Souza','34567890123','carlos@gmail.com','(21)99999-3333');

INSERT INTO Quarto (numero,capacidade,possui_banheiro)
VALUES
(101,4,TRUE),
(102,8,FALSE),
(103,12,TRUE);

INSERT INTO Vaga
(id_quarto,numero_vaga,tipo_cama,posicao,perto_porta,perto_janela,sol_manha,observacoes)

VALUES

(1,1,'Beliche','Superior',FALSE,TRUE,TRUE,'Vista para jardim'),
(1,2,'Beliche','Inferior',TRUE,FALSE,FALSE,'Próxima ao banheiro'),
(1,3,'Beliche','Superior',FALSE,FALSE,FALSE,'Silenciosa'),
(1,4,'Beliche','Inferior',FALSE,TRUE,TRUE,'Próxima à tomada'),

(2,1,'Beliche','Superior',TRUE,FALSE,FALSE,NULL),
(2,2,'Beliche','Inferior',TRUE,FALSE,FALSE,NULL),
(2,3,'Beliche','Superior',FALSE,TRUE,TRUE,NULL),
(2,4,'Beliche','Inferior',FALSE,TRUE,TRUE,NULL),

(3,1,'Beliche','Superior',FALSE,TRUE,TRUE,NULL),
(3,2,'Beliche','Inferior',FALSE,TRUE,TRUE,NULL),
(3,3,'Beliche','Superior',FALSE,FALSE,FALSE,NULL),
(3,4,'Beliche','Inferior',TRUE,FALSE,FALSE,NULL);

INSERT INTO Reserva
(id_cliente,data_reserva,data_inicio,data_fim,valor_total,status_reserva,status_pagamento,codigo_transacao)

VALUES

(1,'2026-07-01','2026-07-10','2026-07-15',500.00,'Confirmada','Pago','TRX001'),

(2,'2026-07-02','2026-07-20','2026-07-25',600.00,'Confirmada','Pago','TRX002');

SELECT * FROM Cliente;

SELECT * FROM Quarto;

SELECT * FROM Vaga;

SELECT * FROM Reserva;

SELECT * FROM Reserva_Vaga;

UPDATE Reserva
SET status_reserva='Cancelada'
WHERE id_reserva=1;

DELETE FROM Reserva_Vaga
WHERE id_reserva=2;

DELETE FROM Reserva
WHERE id_reserva=2;
