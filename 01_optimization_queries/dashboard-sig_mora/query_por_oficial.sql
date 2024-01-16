-- Seleccionar información de la matriz de la tabla vst_matriz_tbl
SELECT 
    agencia, 
    fecha, 
    codigooficial, 
    Oficial, 
    SUM(TotalCartera) AS SALDO, 
    SUM(prevision) AS PREV, 
    COUNT(*) AS CASOS,
    CASE
        WHEN Mora = 0 OR Mora IS NULL THEN 'VIG'
        WHEN Mora >= 1 AND Mora <= 30 THEN 'ATR'
        WHEN estado = 5 THEN 'VEN'
        WHEN estado = 6 THEN 'EJE' 
    END AS ESTADO
FROM 
    vst_matriz_tbl
-- Filtrar registros en los últimos 90 días
WHERE 
    fecha >= DATEADD(DAY, -90, GETDATE())
GROUP BY 
    agencia, 
    fecha, 
    estado, 
    Mora, 
    codigooficial, 
    Oficial;
