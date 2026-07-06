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
