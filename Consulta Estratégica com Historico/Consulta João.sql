WITH Acidentes AS (
    SELECT
        BR.br_id,
        TRIM(BR.br_cod) AS BR_Codigo,
        (
            SELECT
                COUNT(*)
            FROM
                HOCORRENCIA ho
            INNER JOIN
                HLOCALIDADES hl ON ho.HOCR_loc_id = hl.HLOC_id
            WHERE
                TO_CHAR(ho.HOCR_DIA, 'DD-MM-YYYY') BETWEEN '01-01-2018' AND '31-12-2018'
                AND hl.HLOC_br_id = BR.br_id
        ) AS Acidentes_2018,
        (
            SELECT
                COUNT(*)
            FROM
                HOCORRENCIA ho
            INNER JOIN
                HLOCALIDADES hl ON ho.HOCR_loc_id = hl.HLOC_id
            WHERE
                TO_CHAR(ho.HOCR_DIA, 'DD-MM-YYYY') BETWEEN '01-01-2021' AND '31-12-2021'
                AND hl.HLOC_br_id = BR.br_id
        ) AS Acidentes_2021,
        (
            SELECT
                COUNT(*)
            FROM
                OCORRENCIA o
            INNER JOIN
                LOCALIDADES l ON o.ocr_loc_id = l.loc_id
            WHERE
                TO_CHAR(o.ocr_dia, 'DD-MM-YYYY') BETWEEN '01-01-2022' AND '31-12-2022'
                AND l.loc_br_id = BR.br_id
        ) AS Acidentes_2022
    FROM
        BR
)

SELECT
    BR_Codigo,
    Acidentes_2018,
    Acidentes_2021,
    Acidentes_2022,
    CASE WHEN 
        COALESCE(Acidentes_2018, 0) = 0 THEN 
            0 
        ELSE 
            ROUND(((COALESCE(Acidentes_2021, 0) - COALESCE(Acidentes_2018, 0)) / COALESCE(Acidentes_2018, 0)) * 100, 2) 
            END AS Percentual_2018_2021,
    CASE WHEN 
        COALESCE(Acidentes_2021, 0) = 0 THEN 
            0 
        ELSE 
            ROUND(((COALESCE(Acidentes_2022, 0) - COALESCE(Acidentes_2021, 0)) / COALESCE(Acidentes_2021, 0)) * 100, 2)  
            END AS Percentual_2021_2022
FROM
    Acidentes
ORDER BY
    BR_Codigo;
