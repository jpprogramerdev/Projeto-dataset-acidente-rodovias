--Quais são os 10 tipo de acidentes mais comuns
SELECT ta.tip_nome AS Tipo_de_Acidente, COUNT(*) AS Quantidade
FROM ocorrencia o INNER JOIN tipo_acidente ta ON o.ocr_tip_id = ta.tip_id
GROUP BY ta.tip_nome
ORDER BY Quantidade DESC
;

--Quais são os 10 climas que mais causam acidentes em rodovias 
SELECT clm_nome, COUNT(*) AS quantidade
FROM clima INNER JOIN ocorrencia o ON clm_id = o.ocr_clm_id
GROUP BY clm_nome
ORDER BY quantidade DESC;
;

--Quais são as BRs e qual seu Km que possui uma media maior de feridos
SELECT l.loc_id, b.br_cod, l.loc_km, AVG(o.ocr_feridos_leves) AS media_feridos_leves
FROM localidades l
LEFT JOIN br b ON l.loc_br_id = b.br_id
LEFT JOIN ocorrencia o ON l.loc_id = o.ocr_loc_id
GROUP BY l.loc_id, b.br_cod, l.loc_km
HAVING AVG(o.ocr_feridos_leves) > 5
ORDER BY media_feridos_leves DESC;

