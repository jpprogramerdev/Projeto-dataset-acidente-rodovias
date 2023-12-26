/*Consulta de Resumo de Acidentes por Estado e Classificação:
Esta consulta permite obter um resumo do número de acidentes por estado e por classificação de acidente. Ela pode ajudar a identificar quais estados têm mais acidentes e quais tipos de acidentes são mais comuns em cada estado.*/

SELECT
    estados.est_sigla AS Estado,
    classificacao_acidente.cla_nome AS Classificacao,
    COUNT(ocorrencia.ocr_id) AS Total_Acidentes
FROM
    estados
JOIN
    localidades ON estados.est_id = localidades.loc_est_id
JOIN
    br ON localidades.loc_br_id = br.br_id
JOIN
    ocorrencia ON localidades.loc_id = ocorrencia.ocr_loc_id
LEFT JOIN
    classificacao_acidente ON ocorrencia.ocr_cla_id = classificacao_acidente.cla_id
GROUP BY
    estados.est_sigla, classificacao_acidente.cla_nome
ORDER BY
    estados.est_sigla ASC, Total_Acidentes DESC;




/*Consulta de Resumo de Acidentes por Mês e Ano:
Esta consulta permite obter um resumo do número de acidentes por mês e ano. Ela pode ajudar a identificar tendências sazonais ou variações ao longo do tempo.*/
SELECT
    TO_CHAR(ocr_dia, 'YYYY-MM') AS Ano_Mes,
    COUNT(ocr_id) AS Total_Acidentes
FROM
    ocorrencia
GROUP BY
    TO_CHAR(ocr_dia, 'YYYY-MM')
ORDER BY
    Ano_Mes;
