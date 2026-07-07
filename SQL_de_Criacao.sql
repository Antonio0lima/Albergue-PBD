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

