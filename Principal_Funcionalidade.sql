SELECT
    V.id_vaga,
    V.numero_vaga,
    Q.numero AS quarto,
    Q.capacidade,
    Q.possui_banheiro,
    V.tipo_cama,
    V.posicao,
    V.perto_porta,
    V.perto_janela,
    V.sol_manha,
    V.observacoes
FROM Vaga V
JOIN Quarto Q
ON V.id_quarto = Q.id_quarto
WHERE V.id_vaga NOT IN (

    SELECT RV.id_vaga
    FROM Reserva_Vaga RV
    JOIN Reserva R
    ON RV.id_reserva = R.id_reserva
    WHERE
        R.data_inicio < '2026-07-15'
        AND R.data_fim > '2026-07-10'
);


INSERT INTO Reserva
(
    id_cliente,
    data_reserva,
    data_inicio,
    data_fim,
    valor_total,
    status_reserva,
    status_pagamento,
    codigo_transacao
)

VALUES
(
    1,
    '2026-07-06',
    '2026-07-10',
    '2026-07-15',
    500.00,
    'Confirmada',
    'Pago',
    'TRX003'
);

INSERT INTO Reserva_Vaga
(id_reserva,id_vaga)

VALUES 
(3,8);
