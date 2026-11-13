SELECT 
    idCliente,
    count(DISTINCT substr(DtCriacao,1,10)) AS qtdeFrequencia,
    sum(CASE WHEN QtdePontos > 0 THEN QtdePontos ELSE 0 END) AS qtdePontosPos,
    sum(abs(QtdePontos)) AS qtdePontosAbs

FROM transacoes

WHERE Dtcriacao < '2025-09-01'
AND Dtcriacao >= date('2025-09-01', '-28 days')

GROUP BY idCliente
ORDER BY qtdeFrequencia DESC