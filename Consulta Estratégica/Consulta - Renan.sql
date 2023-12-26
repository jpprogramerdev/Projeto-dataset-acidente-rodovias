/*1 Consulta para listar as ocorrências de acidentes com o número total de feridos, agrupados por dia da semana:Esta consulta irá agrupar as ocorrências de acidentes por dia da semana e calcular o número total de feridos (soma de feridos leves e feridos graves) em cada dia da semana. Isso pode ser útil para identificar tendências de acidentes em dias específicos da semana.*/

SELECT
    ocr_dia_semana,
    SUM(ocr_total_feridos) AS total_feridos
FROM
    ocorrencia
GROUP BY
    ocr_dia_semana
ORDER BY
    ocr_dia_semana;


/*3 Consulta para encontrar a BR que tem mais acidentes e o seu respectivo quilômetro (Km):Esta consulta começa por contar o número total de acidentes para cada BR, juntamente com o quilômetro do acidente mais distante em cada BR. Em seguida, ela seleciona a BR com o maior número de acidentes e seu quilômetro correspondente usando a função MAX. O resultado mostrará o código da BR, o número total de acidentes nela e o quilômetro do acidente mais distante nessa BR.*/

SELECT
    br.br_cod AS br_codigo,
    MAX(oc.total_acidentes) AS total_acidentes,
    MAX(oc.km_acidente) AS km_acidente
FROM
    br
LEFT JOIN
    (SELECT
        loc_br_id,
        COUNT(ocr_id) AS total_acidentes,
        MAX(loc_km) AS km_acidente
    FROM
        localidades
    INNER JOIN
        ocorrencia ON localidades.loc_id = ocorrencia.ocr_loc_id
    GROUP BY
        loc_br_id) oc ON br.br_id = oc.loc_br_id
GROUP BY
    br.br_cod;
