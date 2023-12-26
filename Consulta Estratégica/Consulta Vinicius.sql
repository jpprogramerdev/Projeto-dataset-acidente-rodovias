/*Esta consulta calcula a média de feridos leves e graves em acidentes agrupados por tipo de acidente. Pode ajudar a identificar tipos de acidentes que tendem a resultar em mais feridos.*/
SELECT
    ta.tip_nome AS Tipo_Acidente,
    AVG(o.ocr_feridos_leves + o.ocr_feridos_graves) AS Media_Feridos
FROM
    ocorrencia o
INNER JOIN
    tipo_acidente ta ON o.ocr_tip_id = ta.tip_id
GROUP BY
    ta.tip_nome
ORDER BY
    Media_Feridos DESC;



/*Esta consulta calcula a contagem de acidentes agrupados por tipo de acidente, mostrando quantos acidentes ocorreram para cada tipo. Isso pode fornecer uma visão geral das causas mais comuns de acidentes.*/
SELECT
    ta.tip_nome AS Tipo_Acidente,
    COUNT(o.ocr_id) AS Total_Acidentes
FROM
    ocorrencia o
INNER JOIN
    tipo_acidente ta ON o.ocr_tip_id = ta.tip_id
GROUP BY
    ta.tip_nome
ORDER BY
    Total_Acidentes DESC;
