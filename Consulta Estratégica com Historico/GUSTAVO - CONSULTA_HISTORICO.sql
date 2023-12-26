WITH Porcentagens2018 AS (
  SELECT
    '2018' AS Ano,
    clm_nome AS "Clima Mais Comum",
    ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM hocorrencia WHERE TO_CHAR(hocr_dia, 'YYYY') = '2018'), 2) AS "PORCENTAGEM_2018"
  FROM hocorrencia
  INNER JOIN clima ON hocr_clm_id = clm_id
  WHERE TO_CHAR(hocr_dia, 'YYYY') = '2018'
  GROUP BY clm_nome
),
Porcentagens2021 AS (
  SELECT
    '2021' AS Ano,
    clm_nome AS "Clima Mais Comum",
    ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM hocorrencia WHERE TO_CHAR(hocr_dia, 'YYYY') = '2021'), 2) AS "PORCENTAGEM_2021"
  FROM hocorrencia
  INNER JOIN clima ON hocr_clm_id = clm_id
  WHERE TO_CHAR(hocr_dia, 'YYYY') = '2021'
  GROUP BY clm_nome
),
Porcentagens2022 AS (
  SELECT
    '2022' AS Ano,
    clm_nome AS "Clima Mais Comum",
    ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM ocorrencia WHERE TO_CHAR(ocr_dia, 'YYYY') = '2022'), 2) AS "PORCENTAGEM_2022"
  FROM ocorrencia
  INNER JOIN clima ON ocr_clm_id = clm_id
  WHERE TO_CHAR(ocr_dia, 'YYYY') = '2022'
  GROUP BY clm_nome
)
SELECT
  "Clima Mais Comum",
  MAX("PORCENTAGEM_2018") AS "PORCENTAGEM_2018",
  MAX("PORCENTAGEM_2021") AS "PORCENTAGEM_2021",
  MAX("PORCENTAGEM_2022") AS "PORCENTAGEM_2022"
FROM (
  SELECT Ano, "Clima Mais Comum", "PORCENTAGEM_2018", 0 AS "PORCENTAGEM_2021", 0 AS "PORCENTAGEM_2022" FROM Porcentagens2018
  UNION ALL
  SELECT Ano, "Clima Mais Comum", 0 AS "PORCENTAGEM_2018", "PORCENTAGEM_2021", 0 AS "PORCENTAGEM_2022" FROM Porcentagens2021
  UNION ALL
  SELECT Ano, "Clima Mais Comum", 0 AS "PORCENTAGEM_2018", 0 AS "PORCENTAGEM_2021", "PORCENTAGEM_2022" FROM Porcentagens2022
)
GROUP BY "Clima Mais Comum"
ORDER BY "Clima Mais Comum";
