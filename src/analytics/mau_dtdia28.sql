WITH tb_daily AS (
    SELECT
        DISTINCT
        date(substr(DtCriacao,1,10)) AS dtDia,
        idCliente
    FROM transacoes
    ORDER BY dtDia
),

tb_distinct_day AS (
    SELECT DISTINCT dtDia as dtRef
    FROM tb_daily
),

tb_distinct_28 AS (
    SELECT
        t1.*,
        t2.*
    FROM tb_distinct_day AS t1
    LEFT JOIN tb_daily AS t2
    ON t2.dtDia <= t1.dtRef
    AND julianday(t1.dtRef) - julianday(t2.dtDia) < 28
)

SELECT
    dtRef,
    count( DISTINCT idCliente ) AS MAU,
    count( DISTINCT dtDia ) AS qtdeDias
FROM tb_distinct_28
GROUP BY dtRef
ORDER BY dtRef ASC