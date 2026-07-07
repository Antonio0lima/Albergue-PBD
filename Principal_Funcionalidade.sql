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

INNER JOIN Quarto Q
ON Q.id_quarto = V.id_quarto

WHERE NOT EXISTS (

    SELECT 1

    FROM Reserva_Vaga RV

    INNER JOIN Reserva R
        ON R.id_reserva = RV.id_reserva

    WHERE
        RV.id_vaga = V.id_vaga
        AND
        R.data_inicio < '2026-07-15'
        AND
        R.data_fim > '2026-07-10'

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
