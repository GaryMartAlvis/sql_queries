-- Seleccionar todas las columnas de la vista vst_matriz_tbl
SELECT *
FROM vst_matriz_tbl
-- Filtrar por registros cuya fecha sea la fecha máxima presente en la vista
WHERE fecha IN (SELECT MAX(fecha) FROM vst_matriz_tbl)
-- O por registros cuya fecha tenga el máximo valor de fecha para el mes anterior
   OR CONVERT(DATE, fecha) = (
       SELECT MAX(CONVERT(DATE, fecha))
       FROM vst_matriz_tbl
       WHERE MONTH(fecha) = MONTH(DATEADD(MONTH, -1, GETDATE()))
   );
