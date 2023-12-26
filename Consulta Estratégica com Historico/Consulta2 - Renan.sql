WITH
    -- Filtrar as ocorrências dos anos desejados
    filtered_ocorrencias AS (
        SELECT
            TO_CHAR(ocr_dia, 'YYYY') AS ano,
            TO_CHAR(ocr_dia, 'MM') AS mes,
            ocr_loc_id AS loc_id
        FROM
            hocorrencia
        WHERE
            TO_CHAR(ocr_dia, 'YYYY') IN ('2020', '2021', '2022')
    ),
    -- Contar o número de ocorrências por mês e ano
    count_ocorrencias AS (
        SELECT
            ano,
            mes,
            loc_id,
            COUNT(*) AS total_ocorrencias
        FROM
            filtered_ocorrencias
        GROUP BY
            ano, mes, loc_id
    ),
    -- Encontrar o mês com o maior número de ocorrências para cada ano
    max_ocorrencias_por_ano AS (
        SELECT
            ano,
            mes,
            MAX(total_ocorrencias) AS max_ocorrencias
        FROM
            count_ocorrencias
        GROUP BY
            ano, mes
    ),
    -- Juntar com a tabela de localidades para obter a BR
    mes_maior_ocorrencia_por_ano AS (
        SELECT
            m.ano,
            m.mes,
            c.loc_id AS loc_id,
            m.max_ocorrencias
        FROM
            max_ocorrencias_por_ano m
        INNER JOIN
            count_ocorrencias c ON m.ano = c.ano AND m.mes = c.mes AND m.max_ocorrencias = c.total_ocorrencias
    )
SELECT
    m.ano AS ano,
    m.mes AS mes,
    m.loc_id AS loc_id,
    m.max_ocorrencias AS total_ocorrencias,
    b.br_cod AS br_codigo
FROM
    mes_maior_ocorrencia_por_ano m
LEFT JOIN
    localidades_hist l ON m.loc_id = l.loc_id
LEFT JOIN
    br_hist b ON l.loc_br_id = b.br_id
ORDER BY
    m.max_ocorrencias DESC;
