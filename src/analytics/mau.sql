SELECT substr(DtCriacao,1,7) AS DtMau,
       count(DISTINCT idCliente) AS MAU

FROM transacoes
GROUP BY 1
ORDER BY DtMau