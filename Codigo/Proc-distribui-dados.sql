create or replace NONEDITIONABLE PROCEDURE "UPSERT_BR" 
(
  P_BR IN VARCHAR2
) AS 
   v_count integer;
   v_id integer;
BEGIN
  select count(*) into v_count from BR where BR_COD = P_BR;
  if v_count = 0 then
    insert into BR values (0,P_BR);
  end if;
  select BR_ID into v_id from BR where BR.BR_COD = P_BR;
  update PLANILHA_OCORRENCIAS set BR = v_id where PLANILHA_OCORRENCIAS.BR = P_BR;
END UPSERT_BR;
/

create or replace NONEDITIONABLE PROCEDURE "UPSERT_CAUSA_ACIDENTE" 
(
  P_CAUSA IN VARCHAR2
) AS 
   v_count integer;
   v_id integer;
BEGIN
  select count(*) into v_count from CAUSA_ACIDENTE where CAU_NOME = P_CAUSA;
  if v_count = 0 then
    insert into CAUSA_ACIDENTE values (0,P_CAUSA);
  end if;
  select CAU_ID into v_id from CAUSA_ACIDENTE where CAUSA_ACIDENTE.CAU_NOME = P_CAUSA;
  update PLANILHA_OCORRENCIAS set CAUSA_ACIDENTE = v_id where PLANILHA_OCORRENCIAS.CAUSA_ACIDENTE = P_CAUSA;
END UPSERT_CAUSA_ACIDENTE;
/

create or replace NONEDITIONABLE PROCEDURE "UPSERT_CLASSIFICACAO_ACIDENTE" 
(
  P_CLASSIFICACAO IN VARCHAR2
) AS 
   v_count integer;
   v_id integer;
BEGIN
  select count(*) into v_count from CLASSIFICACAO_ACIDENTE where CLA_NOME = P_CLASSIFICACAO;
  if v_count = 0 then
    insert into CLASSIFICACAO_ACIDENTE values (0,P_CLASSIFICACAO);
  end if;
  select CLA_ID into v_id from CLASSIFICACAO_ACIDENTE where CLASSIFICACAO_ACIDENTE.CLA_NOME = P_CLASSIFICACAO;
  update PLANILHA_OCORRENCIAS set CLASSIFICACAO_ACIDENTE = v_id where PLANILHA_OCORRENCIAS.CLASSIFICACAO_ACIDENTE = P_CLASSIFICACAO;
END UPSERT_CLASSIFICACAO_ACIDENTE;
/

create or replace NONEDITIONABLE PROCEDURE "UPSERT_CLIMA" 
(
  P_CLIMA IN VARCHAR2
) AS 
   v_count integer;
   v_id integer;
BEGIN
  select count(*) into v_count from CLIMA where CLM_NOME = P_CLIMA;
  if v_count = 0 then
    insert into clima values (0,P_CLIMA);
  end if;
  select CLM_ID into v_id from CLIMA where CLIMA.CLM_NOME = P_CLIMA;
  update PLANILHA_OCORRENCIAS set CONDICAO_METEREOLOGICA = v_id where PLANILHA_OCORRENCIAS.CONDICAO_METEREOLOGICA = P_CLIMA;
END UPSERT_CLIMA;
/

create or replace NONEDITIONABLE PROCEDURE "UPSERT_DELEGACIA" 
(
  P_DELEGACIA IN VARCHAR2,
  P_SEDE IN INTEGER
) AS 
   v_count integer;
   v_id integer;
BEGIN
  select count(*) into v_count from DELEGACIA where DLG_SED_ID = P_SEDE AND DLG_COD  = P_DELEGACIA;
  if v_count = 0 then
    insert into DELEGACIA values (0,P_DELEGACIA, P_SEDE);
  end if;
  select DLG_ID into v_id from DELEGACIA where DLG_SED_ID = P_SEDE AND DLG_COD  = P_DELEGACIA;
  update PLANILHA_OCORRENCIAS set DELEGACIA = v_id where PLANILHA_OCORRENCIAS.DELEGACIA = P_DELEGACIA;
END UPSERT_DELEGACIA;
/

create or replace NONEDITIONABLE PROCEDURE "UPSERT_ESTADO" 
(
  P_SIGLA IN VARCHAR2
) AS 
   v_count integer;
   v_id integer;
BEGIN
  select count(*) into v_count from ESTADOS where EST_SIGLA = P_SIGLA;
  if v_count = 0 then
    insert into ESTADOS values (0,P_SIGLA);
  end if;
  select EST_ID into v_id from ESTADOS where EST_SIGLA = P_SIGLA;
  update PLANILHA_OCORRENCIAS set UF = v_id where PLANILHA_OCORRENCIAS.UF = P_SIGLA;
END UPSERT_ESTADO;
/

create or replace NONEDITIONABLE PROCEDURE "UPSERT_LOCALIDADE" 
(
  P_KM IN NUMBER,
  P_LATITUDE IN NUMBER,
  P_LONGITUDE IN NUMBER,
  P_BR IN INTEGER,
  P_ESTADO IN INTEGER
) AS 
   v_count integer;
   v_id integer;
BEGIN
  select count(*) into v_count from LOCALIDADES where LOC_BR_ID = P_BR AND LOC_EST_ID = P_ESTADO and LOC_KM = P_KM AND LOC_LATITUDE = P_LATITUDE AND LOC_LONGITUDE = P_LONGITUDE; 
  if v_count = 0 then
    insert into LOCALIDADES values (0,P_KM, P_LATITUDE, P_LONGITUDE, P_BR, P_ESTADO);
  end if;
  select LOC_ID into v_id from LOCALIDADES where LOC_BR_ID = P_BR AND LOC_EST_ID = P_ESTADO and LOC_KM = P_KM AND LOC_LATITUDE = P_LATITUDE AND LOC_LONGITUDE = P_LONGITUDE; 
  update PLANILHA_OCORRENCIAS set KM = v_id where PLANILHA_OCORRENCIAS.KM = P_KM;
  update PLANILHA_OCORRENCIAS set LATITUDE = v_id where PLANILHA_OCORRENCIAS.LATITUDE = P_LATITUDE;
  update PLANILHA_OCORRENCIAS set LONGITUDE = v_id where PLANILHA_OCORRENCIAS.LONGITUDE = P_LONGITUDE;
END UPSERT_LOCALIDADE;
/



create or replace NONEDITIONABLE PROCEDURE "UPSERT_OCORRENCIAS" 
(
  P_TOTAL_ENVOLVIDOS IN INTEGER,
  P_MORTOS IN INTEGER,
  P_FERIDOS_LEVES IN INTEGER,
  P_FERIDOS_GRAVES IN INTEGER,
  P_ILESOS IN INTEGER,
  P_IGNORADOS IN INTEGER,
  P_TOTAL_FERIDOS IN INTEGER,
  P_VEICULOS IN INTEGER,
  P_DIA IN DATE,
  P_DIA_SEMANA IN VARCHAR,
  P_HORARIO IN DATE,
  P_CLASSIFICACAO_ACIDENTE IN INTEGER,
  P_SENTIDO_VIA IN INTEGER,
  P_CLIMA IN INTEGER,
  P_USO_SOLO IN INTEGER,
  P_TIPO_PISTA IN INTEGER,
  P_TRACADO_VIA IN INTEGER,
  P_UOP IN INTEGER,
  P_TIPO_ACIDENTE IN INTEGER,
  P_LOCALIDADE IN INTEGER
) AS 
   v_count integer;
   v_id integer;
BEGIN
  select count(*) into v_count from OCORRENCIA
  where
    OCR_TOTAL_ENVOLVIDOS = P_TOTAL_ENVOLVIDOS AND
    OCR_MORTOS = P_MORTOS AND
    OCR_FERIDOS_LEVES = P_FERIDOS_LEVES AND 
    OCR_FERIDOS_GRAVES = P_FERIDOS_GRAVES AND 
    OCR_ILESOS = P_ILESOS AND
    OCR_IGNORADOS = P_IGNORADOS AND
    OCR_TOTAL_FERIDOS = P_TOTAL_FERIDOS AND
    OCR_VEICULOS = P_VEICULOS AND
    OCR_DIA = P_DIA AND
    OCR_DIA_SEMANA = P_DIA_SEMANA AND
    OCR_HORARIO = P_HORARIO AND
    OCR_CLA_ID = P_CLASSIFICACAO_ACIDENTE AND
    OCR_STV_ID = P_SENTIDO_VIA AND
    OCR_CLM_ID = P_CLIMA AND
    OCR_USL_ID = P_USO_SOLO AND
    OCR_TPS_ID = P_TIPO_PISTA AND
    OCR_TRV_ID = P_TRACADO_VIA AND
    OCR_UOP_ID = P_UOP AND
    OCR_TIP_ID = P_TIPO_ACIDENTE AND
    OCR_LOC_ID = P_LOCALIDADE;
  if v_count = 0 then
    insert into OCORRENCIA values (
    0,
    P_TOTAL_ENVOLVIDOS, 
    P_MORTOS,
    P_FERIDOS_LEVES, 
    P_FERIDOS_GRAVES, 
    P_ILESOS,
    P_IGNORADOS,
    P_TOTAL_FERIDOS,
    P_VEICULOS,
    P_DIA,
    P_DIA_SEMANA,
    P_HORARIO,
    P_CLASSIFICACAO_ACIDENTE,
    P_SENTIDO_VIA,
    P_CLIMA,
    P_USO_SOLO,
    P_TIPO_PISTA,
    P_TRACADO_VIA,
    P_UOP,
    P_TIPO_ACIDENTE,
    P_LOCALIDADE);
  end if;
  
  select OCR_ID into v_id from OCORRENCIA 
  where
    OCR_TOTAL_ENVOLVIDOS = P_TOTAL_ENVOLVIDOS AND
    OCR_MORTOS = P_MORTOS AND
    OCR_FERIDOS_LEVES = P_FERIDOS_LEVES AND 
    OCR_FERIDOS_GRAVES = P_FERIDOS_GRAVES AND 
    OCR_ILESOS = P_ILESOS AND
    OCR_IGNORADOS = P_IGNORADOS AND
    OCR_TOTAL_FERIDOS = P_TOTAL_FERIDOS AND
    OCR_VEICULOS = P_VEICULOS AND
    OCR_DIA = P_DIA AND
    OCR_DIA_SEMANA = P_DIA_SEMANA AND
    OCR_HORARIO = P_HORARIO AND
    OCR_CLA_ID = P_CLASSIFICACAO_ACIDENTE AND
    OCR_STV_ID = P_SENTIDO_VIA AND
    OCR_CLM_ID = P_CLIMA AND
    OCR_USL_ID = P_USO_SOLO AND
    OCR_TPS_ID = P_TIPO_PISTA AND
    OCR_TRV_ID = P_TRACADO_VIA AND
    OCR_UOP_ID = P_UOP AND
    OCR_TIP_ID = P_TIPO_ACIDENTE AND
    OCR_LOC_ID = P_LOCALIDADE;
    
  update PLANILHA_OCORRENCIAS set PESSOAS = v_id where PLANILHA_OCORRENCIAS.PESSOAS = P_TOTAL_ENVOLVIDOS;
  update PLANILHA_OCORRENCIAS set MORTOS = v_id where PLANILHA_OCORRENCIAS.MORTOS = P_MORTOS;
  update PLANILHA_OCORRENCIAS set FERIDOS_LEVES = v_id where PLANILHA_OCORRENCIAS.FERIDOS_LEVES = P_FERIDOS_LEVES;
  update PLANILHA_OCORRENCIAS set FERIDOS_GRAVES = v_id where PLANILHA_OCORRENCIAS.FERIDOS_GRAVES = P_FERIDOS_GRAVES;
  update PLANILHA_OCORRENCIAS set ILESOS = v_id where PLANILHA_OCORRENCIAS.ILESOS = P_ILESOS;
  update PLANILHA_OCORRENCIAS set IGNORADOS = v_id where PLANILHA_OCORRENCIAS.IGNORADOS = P_IGNORADOS;
  update PLANILHA_OCORRENCIAS set FERIDOS = v_id where PLANILHA_OCORRENCIAS.FERIDOS = P_TOTAL_FERIDOS;
  update PLANILHA_OCORRENCIAS set VEICULOS = v_id where PLANILHA_OCORRENCIAS.VEICULOS = P_VEICULOS;
  update PLANILHA_OCORRENCIAS set DIA_SEMANA = v_id where PLANILHA_OCORRENCIAS.DIA_SEMANA = P_DIA_SEMANA;
  
END UPSERT_OCORRENCIAS;
/

create or replace NONEDITIONABLE PROCEDURE "UPSERT_SED" 
(
  P_SEDE IN VARCHAR2,
  P_ESTADO IN INTEGER
) AS 
   v_count integer;
   v_id integer;
BEGIN
  select count(*) into v_count from SEDE where SED_EST_ID = P_ESTADO AND SED_NOME  = P_SEDE;
  if v_count = 0 then
    insert into SEDE values (0,P_SEDE, P_ESTADO);
  end if;
  select SED_ID into v_id from SEDE  where SED_EST_ID = P_ESTADO AND SED_NOME  = P_SEDE;
  update PLANILHA_OCORRENCIAS set REGIONAL = v_id where PLANILHA_OCORRENCIAS.REGIONAL = P_SEDE;
END UPSERT_SED;
/

create or replace NONEDITIONABLE PROCEDURE "UPSERT_SENTIDO_VIA" 
(
  P_SENTIDO IN VARCHAR2
) AS 
   v_count integer;
   v_id integer;
BEGIN
  select count(*) into v_count from SENTIDO_VIA where STV_NOME = P_SENTIDO;
  if v_count = 0 then
    insert into SENTIDO_VIA values (0,P_SENTIDO);
  end if;
  select STV_ID into v_id from SENTIDO_VIA where SENTIDO_VIA.STV_NOME = P_SENTIDO;
  update PLANILHA_OCORRENCIAS set SENTIDO_VIA = v_id where PLANILHA_OCORRENCIAS.SENTIDO_VIA = P_SENTIDO;
END UPSERT_SENTIDO_VIA;
/

create or replace NONEDITIONABLE PROCEDURE "UPSERT_TIPO_ACIDENTE" 
(
  P_TIPO IN VARCHAR2,
  P_CLASSFICACAO IN INTEGER
) AS 
   v_count integer;
   v_id integer;
BEGIN
  select count(*) into v_count from TIPO_ACIDENTE where TIP_CAU_ID = P_CLASSFICACAO AND TIP_NOME  = P_TIPO;
  if v_count = 0 then
    insert into TIPO_ACIDENTE values (0,P_TIPO, P_CLASSFICACAO);
  end if;
  select TIP_ID into v_id from TIPO_ACIDENTE where TIP_CAU_ID = P_CLASSFICACAO AND TIP_NOME  = P_TIPO;
  update PLANILHA_OCORRENCIAS set TIPO_ACIDENTE = v_id where PLANILHA_OCORRENCIAS.TIPO_ACIDENTE = P_TIPO;
END UPSERT_TIPO_ACIDENTE;
/

create or replace NONEDITIONABLE PROCEDURE "UPSERT_TIPO_PISTA" 
(
  P_PISTA IN CHAR
) AS 
   v_count integer;
   v_id integer;
BEGIN
  select count(*) into v_count from TIPO_PISTA where TPS_NOME = P_PISTA;
  if v_count = 0 then
    insert into TIPO_PISTA values (0,P_PISTA);
  end if;
  select TPS_ID into v_id from TIPO_PISTA where TIPO_PISTA.TPS_NOME = P_PISTA;
  update PLANILHA_OCORRENCIAS set TIPO_PISTA = v_id where PLANILHA_OCORRENCIAS.TIPO_PISTA = P_PISTA;
END UPSERT_TIPO_PISTA;
/

create or replace NONEDITIONABLE PROCEDURE "UPSERT_TRACADO_VIA" 
(
  P_TRACADO IN VARCHAR2
) AS 
   v_count integer;
   v_id integer;
BEGIN
  select count(*) into v_count from TRACADO_VIA where TRV_NOME = P_TRACADO;
  if v_count = 0 then
    insert into TRACADO_VIA values (0,P_TRACADO);
  end if;
  select TRV_ID into v_id from TRACADO_VIA where TRACADO_VIA.TRV_NOME = P_TRACADO;
  update PLANILHA_OCORRENCIAS set TRACADO_VIA = v_id where PLANILHA_OCORRENCIAS.TRACADO_VIA = P_TRACADO;
END UPSERT_TRACADO_VIA;
/

create or replace NONEDITIONABLE PROCEDURE "UPSERT_UNI_OPERACIONAL" 
(
  P_UOP IN VARCHAR2,
  P_DELEGACIA IN INTEGER
) AS 
   v_count integer;
   v_id integer;
BEGIN
  select count(*) into v_count from UNIDADE_OPERACIONAL where UOP_DLG_ID = P_DELEGACIA AND UOP_COD  = P_UOP;
  if v_count = 0 then
    insert into UNIDADE_OPERACIONAL values (0,P_UOP, P_DELEGACIA);
  end if;
  select UOP_ID into v_id from UNIDADE_OPERACIONAL where UOP_DLG_ID = P_DELEGACIA AND UOP_COD  = P_UOP;
  update PLANILHA_OCORRENCIAS set UOP = v_id where PLANILHA_OCORRENCIAS.UOP = P_UOP;
END UPSERT_UNI_OPERACIONAL;
/

create or replace NONEDITIONABLE PROCEDURE "UPSERT_USO_SOLO" 
(
  P_SOLO IN CHAR
) AS 
   v_count integer;
   v_id integer;
BEGIN
  select count(*) into v_count from USO_SOLO where USL_NOME = P_SOLO;
  if v_count = 0 then
    insert into USO_SOLO values (0,P_SOLO);
  end if;
  select USL_ID into v_id from USO_SOLO where USO_SOLO.USL_NOME = P_SOLO;
  update PLANILHA_OCORRENCIAS set USO_SOLO = v_id where PLANILHA_OCORRENCIAS.USO_SOLO = P_SOLO;
END UPSERT_USO_SOLO;
/

create or replace NONEDITIONABLE PROCEDURE "DISTRIBUI_DADOS" AS 
BEGIN
  FOR CUR_CAU IN (SELECT * FROM PLANILHA_OCORRENCIAS) LOOP
    -- Normalizando as causas 
    UPSERT_CAUSA_ACIDENTE(CUR_CAU.CAUSA_ACIDENTE);
  END LOOP;
  FOR CUR_CLA IN (SELECT * FROM PLANILHA_OCORRENCIAS) LOOP
    -- Normalizando as classificação de acidentes 
    UPSERT_CLASSIFICACAO_ACIDENTE(CUR_CLA.CLASSIFICACAO_ACIDENTE);
  END LOOP;
  FOR CUR_STV IN (SELECT * FROM PLANILHA_OCORRENCIAS) LOOP
    -- Normalizando o sentido da via
    UPSERT_SENTIDO_VIA(CUR_STV.SENTIDO_VIA);
  END LOOP;
  FOR CUR_CLM IN (SELECT * FROM PLANILHA_OCORRENCIAS) LOOP
    -- Normalizando o clima
    UPSERT_CLIMA(CUR_CLM.CONDICAO_METEREOLOGICA);
  END LOOP;
  FOR CUR_USL IN (SELECT * FROM PLANILHA_OCORRENCIAS) LOOP
    -- Normalizando o clima
    UPSERT_USO_SOLO(CUR_USL.USO_SOLO);
  END LOOP;
  FOR CUR_TPS IN (SELECT * FROM PLANILHA_OCORRENCIAS) LOOP
    -- Normalizando o tipo da pista
    UPSERT_TIPO_PISTA(CUR_TPS.TIPO_PISTA);
  END LOOP;
  FOR CUR_TRV IN (SELECT * FROM PLANILHA_OCORRENCIAS) LOOP
    -- Normalizando o tracado da via
    UPSERT_TRACADO_VIA(CUR_TRV.TRACADO_VIA);
  END LOOP;
  FOR CUR_BR IN (SELECT * FROM PLANILHA_OCORRENCIAS) LOOP
    -- Normalizando AS BRS
    UPSERT_BR(CUR_BR.BR);
  END LOOP;
  FOR CUR_EST IN (SELECT * FROM PLANILHA_OCORRENCIAS) LOOP
    -- Normalizando o ESTADO
    UPSERT_ESTADO(CUR_EST.UF);
  END LOOP;
  FOR CUR_TIP IN (SELECT * FROM PLANILHA_OCORRENCIAS) LOOP
    -- Normalizando o tipo de acidente
    UPSERT_TIPO_ACIDENTE(CUR_TIP.TIPO_ACIDENTE, TO_NUMBER(CUR_TIP.CLASSIFICACAO_ACIDENTE));
  END LOOP;
  FOR CUR_SED IN (SELECT * FROM PLANILHA_OCORRENCIAS) LOOP
    -- Normalizando o sede
    UPSERT_SED(CUR_SED.REGIONAL, TO_NUMBER(CUR_SED.UF));
  END LOOP;
   FOR CUR_DLG IN (SELECT * FROM PLANILHA_OCORRENCIAS) LOOP
    -- Normalizando o delegacia
    UPSERT_DELEGACIA(CUR_DLG.DELEGACIA, TO_NUMBER(CUR_DLG.REGIONAL));
  END LOOP;
  FOR CUR_UOP IN (SELECT * FROM PLANILHA_OCORRENCIAS) LOOP
    -- Normalizando a unidade operacional
    UPSERT_UNI_OPERACIONAL(CUR_UOP.UOP, TO_NUMBER(CUR_UOP.DELEGACIA));
  END LOOP;
  FOR CUR_LOC IN (SELECT * FROM PLANILHA_OCORRENCIAS) LOOP
    -- Normalizando a unidade operacional
    UPSERT_LOCALIDADE(TO_NUMBER(CUR_LOC.KM), TO_NUMBER(CUR_LOC.LATITUDE),TO_NUMBER(CUR_LOC.LONGITUDE),TO_NUMBER(CUR_LOC.BR), TO_NUMBER(CUR_LOC.UF));
  END LOOP;
  FOR CUR_OCR IN (SELECT * FROM PLANILHA_OCORRENCIAS) LOOP
    -- Normalizando a OCORRENCIAS
    UPSERT_OCORRENCIAS(
        TO_NUMBER(CUR_OCR.PESSOAS), 
        TO_NUMBER(CUR_OCR.MORTOS),
        TO_NUMBER(CUR_OCR.FERIDOS_LEVES),
        TO_NUMBER(CUR_OCR.FERIDOS_GRAVES), 
        TO_NUMBER(CUR_OCR.ILESOS),
        TO_NUMBER(CUR_OCR.IGNORADOS), 
        TO_NUMBER(CUR_OCR.FERIDOS),
        TO_NUMBER(CUR_OCR.VEICULOS), 
        CUR_OCR.DATA_INVERSA, 
        CUR_OCR.DIA_SEMANA, 
        CUR_OCR.HORARIO, 
        TO_NUMBER(CUR_OCR.CLASSIFICACAO_ACIDENTE),
        TO_NUMBER(CUR_OCR.SENTIDO_VIA), 
        TO_NUMBER(CUR_OCR.CONDICAO_METEREOLOGICA), 
        TO_NUMBER(CUR_OCR.USO_SOLO), 
        TO_NUMBER(CUR_OCR.TIPO_PISTA),
        TO_NUMBER(CUR_OCR.TRACADO_VIA), 
        TO_NUMBER(CUR_OCR.UOP), 
        TO_NUMBER(CUR_OCR.TIPO_ACIDENTE), 
        TO_NUMBER(CUR_OCR.LONGITUDE)
    );
  END LOOP;
END DISTRIBUI_DADOS;
/