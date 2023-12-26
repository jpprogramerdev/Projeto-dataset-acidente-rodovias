-- Gerado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   em:        2023-09-01 19:50:23 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE br (
    br_id  INTEGER NOT NULL,
    br_cod VARCHAR2(5) NOT NULL
);

COMMENT ON TABLE br IS
    'Tabela que armazena as BR';

COMMENT ON COLUMN br.br_id IS
    'Identificador unico da tabela';

COMMENT ON COLUMN br.br_cod IS
    'Código da BR que ocorreu o acidente';

ALTER TABLE br ADD CONSTRAINT pk_br PRIMARY KEY ( br_id );

CREATE TABLE causa_acidente (
    cau_id   INTEGER NOT NULL,
    cau_nome VARCHAR2(200) NOT NULL
);

COMMENT ON COLUMN causa_acidente.cau_id IS
    'identificador unico da tabela onde ele indica qual foi a causa do acidente';

COMMENT ON COLUMN causa_acidente.cau_nome IS
    'Tipo de causa de acidente';

ALTER TABLE causa_acidente ADD CONSTRAINT pk_cau PRIMARY KEY ( cau_id );

CREATE TABLE classificacao_acidente (
    cla_id   INTEGER NOT NULL,
    cla_nome VARCHAR2(25) NOT NULL
);

COMMENT ON TABLE classificacao_acidente IS
    'Tabela de classificação do acidente, onde classifica a gravidade do acidente';

COMMENT ON COLUMN classificacao_acidente.cla_id IS
    'Identificador unico que identifica qual a classficação do acidente';

COMMENT ON COLUMN classificacao_acidente.cla_nome IS
    'O nome do acidente de acordo onde o ID faz referência a esse nome';

ALTER TABLE classificacao_acidente ADD CONSTRAINT pk_cla PRIMARY KEY ( cla_id );

CREATE TABLE clima (
    clm_id   INTEGER NOT NULL,
    clm_nome VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN clima.clm_id IS
    'Identificador unico da tabela Clima, onde faz refência a CLM_NOME';

COMMENT ON COLUMN clima.clm_nome IS
    'Condições climáticas';

ALTER TABLE clima ADD CONSTRAINT pk_clm PRIMARY KEY ( clm_id );

CREATE TABLE delegacia (
    dlg_id     INTEGER NOT NULL,
    dlg_cod    VARCHAR2(20) NOT NULL,
    dlg_sed_id INTEGER NOT NULL
);

COMMENT ON TABLE delegacia IS
    'Tabela que armazena as delegacias correspondente a uma determinada  sede';

COMMENT ON COLUMN delegacia.dlg_id IS
    'Identificador unico da tabela';

COMMENT ON COLUMN delegacia.dlg_cod IS
    'Código da delegacia';

COMMENT ON COLUMN delegacia.dlg_sed_id IS
    'Chave estrangeira que faz referência a SED_ID, que diz qual a sede a UOP pertence';

ALTER TABLE delegacia ADD CONSTRAINT pk_dlg PRIMARY KEY ( dlg_id );

CREATE TABLE estados (
    est_id    INTEGER NOT NULL,
    est_sigla CHAR(2) NOT NULL
);

COMMENT ON TABLE estados IS
    'Tabela que armazena todos os estados brasileiros';

COMMENT ON COLUMN estados.est_id IS
    'Identificador unico da tabela';

COMMENT ON COLUMN estados.est_sigla IS
    'Sigla que representa o estado';

ALTER TABLE estados ADD CONSTRAINT pk_est PRIMARY KEY ( est_id );

CREATE TABLE localidades (
    loc_id        INTEGER NOT NULL,
    loc_km        NUMBER(38,8) NOT NULL,
    loc_latitude  NUMBER(38,8) NOT NULL,
    loc_longitude NUMBER(38,8) NOT NULL,
    loc_br_id     INTEGER NOT NULL,
    loc_est_id    INTEGER NOT NULL
);

COMMENT ON TABLE localidades IS
    'Tabela que armazena a localidade do acidente';

COMMENT ON COLUMN localidades.loc_id IS
    'Identificado unico da tabela';

COMMENT ON COLUMN localidades.loc_km IS
    'DIz qual o KM da BR que aconteceu o acidente, com duas casas decimais';

COMMENT ON COLUMN localidades.loc_latitude IS
    'Diz a latitude que ocorreu o acidente';

COMMENT ON COLUMN localidades.loc_longitude IS
    'Diz a longitude que aconteceu o acidente';

COMMENT ON COLUMN localidades.loc_br_id IS
    'Chave estrangeira que faz refência a BR_ID da tabela BR';

COMMENT ON COLUMN localidades.loc_est_id IS
    'Chave estrangeira que faz refência a EST_ID da tabela ESTADOS';

ALTER TABLE localidades ADD CONSTRAINT pk_loc PRIMARY KEY ( loc_id );

CREATE TABLE ocorrencia (
    ocr_id               INTEGER NOT NULL,
    ocr_total_envolvidos INTEGER NOT NULL,
    ocr_mortos           INTEGER NOT NULL,
    ocr_feridos_leves    INTEGER NOT NULL,
    ocr_feridos_graves   INTEGER NOT NULL,
    ocr_ilesos           INTEGER NOT NULL,
    ocr_ignorados        INTEGER NOT NULL,
    ocr_total_feridos    INTEGER NOT NULL,
    ocr_veiculos         INTEGER NOT NULL,
    ocr_dia              DATE NOT NULL,
    ocr_dia_semana       VARCHAR2(20) NOT NULL,
    ocr_horario          DATE NOT NULL,
    ocr_cla_id           INTEGER NOT NULL,
    ocr_stv_id           INTEGER NOT NULL,
    ocr_clm_id           INTEGER NOT NULL,
    ocr_usl_id           INTEGER NOT NULL,
    ocr_tps_id           INTEGER NOT NULL,
    ocr_trv_id           INTEGER NOT NULL,
    ocr_uop_id           INTEGER NOT NULL,
    ocr_tip_id           INTEGER NOT NULL,
    ocr_loc_id           INTEGER NOT NULL
);

COMMENT ON TABLE ocorrencia IS
    'Tabela principal que armazena as ocorrências, onde cada linha da tabela será uma ocorrência relatada';

COMMENT ON COLUMN ocorrencia.ocr_id IS
    'Coluna principal da tabela, identificador único da ocorrência';

COMMENT ON COLUMN ocorrencia.ocr_total_envolvidos IS
    'Total de pessoas envolvidas no acidente';

COMMENT ON COLUMN ocorrencia.ocr_mortos IS
    'Total de pessoas mortas envolvidas';

COMMENT ON COLUMN ocorrencia.ocr_feridos_leves IS
    'Total de pessoas com ferimentos leves';

COMMENT ON COLUMN ocorrencia.ocr_feridos_graves IS
    'Total de pessoas com ferimentos graves';

COMMENT ON COLUMN ocorrencia.ocr_ilesos IS
    'Total de pessoas ilesas';

COMMENT ON COLUMN ocorrencia.ocr_ignorados IS
    'Total de pessoas envolvidas na ocorrência e que não se soube o estado físico';

COMMENT ON COLUMN ocorrencia.ocr_total_feridos IS
    'Soma total de pessoas feridas leves e graves';

COMMENT ON COLUMN ocorrencia.ocr_veiculos IS
    'Total de veículos envolvidos';

COMMENT ON COLUMN ocorrencia.ocr_dia IS
    'Data da ocorrência do acidente';

COMMENT ON COLUMN ocorrencia.ocr_dia_semana IS
    'Dia da semana que ocorreu o acidente';

COMMENT ON COLUMN ocorrencia.ocr_horario IS
    'Horário que o acidente ocorreu';

COMMENT ON COLUMN ocorrencia.ocr_cla_id IS
    'Identificador unico da classificação do acidente, onde faz referência com a coluna CLA_ID da tabela CLASSIFICAO_ACIDENTE ';

COMMENT ON COLUMN ocorrencia.ocr_stv_id IS
    'Identificador unico do sentido da via, onde faz referência com a coluna STV_ID da tabela SENTIDO_VIA ';

COMMENT ON COLUMN ocorrencia.ocr_clm_id IS
    'Identificador unico do clima, onde faz referência com a coluna CLM_ID da tabela CLIMA ';

COMMENT ON COLUMN ocorrencia.ocr_usl_id IS
    'Identificador unico do tipo do solo, onde faz referência com a coluna USL_ID da tabela USO_SOLO ';

COMMENT ON COLUMN ocorrencia.ocr_tps_id IS
    'Identificador unico do tipo da pista, onde faz referência com a coluna CLM_ID da tabela TIPO_PISTA';

COMMENT ON COLUMN ocorrencia.ocr_trv_id IS
    'Identificador unico do traçado da via, onde faz referência com a coluna TRV_ID da tabela TRACADO_VIA ';

COMMENT ON COLUMN ocorrencia.ocr_uop_id IS
    'Identificador unico da unidade operacional, onde faz referência com a coluna UOP_ID da tabela UNIDADE_OPERACIONAL ';

COMMENT ON COLUMN ocorrencia.ocr_tip_id IS
    'Identificador unico do tipo do acidente, onde faz referência com a coluna TIP_ID da tabela TIPO_ACIDENTE ';

COMMENT ON COLUMN ocorrencia.ocr_loc_id IS
    'Identificador unico do localidade,  onde faz referência com a coluna LOC_ID da tabela LOCALIDADES ';

ALTER TABLE ocorrencia ADD CONSTRAINT pk_ocr PRIMARY KEY ( ocr_id );

CREATE TABLE sede (
    sed_id     INTEGER NOT NULL,
    sed_nome   VARCHAR2(10) NOT NULL,
    sed_est_id INTEGER NOT NULL
);

COMMENT ON TABLE sede IS
    'Tabela que armazena todas as SEDES no estado correspondente';

COMMENT ON COLUMN sede.sed_id IS
    'Identificador unico da tabela';

COMMENT ON COLUMN sede.sed_nome IS
    'Sigla que reprenseta o nome da sede';

COMMENT ON COLUMN sede.sed_est_id IS
    'Chave estrageira que faz referência a EST_ID, que é o id que identifica o estado';

ALTER TABLE sede ADD CONSTRAINT pk_sed PRIMARY KEY ( sed_id );

CREATE TABLE sentido_via (
    stv_id   INTEGER NOT NULL,
    stv_nome VARCHAR2(20) NOT NULL
);

COMMENT ON TABLE sentido_via IS
    'Tabela que armazena qual foi o sentido da via tomando como ponto de refência o acidente';

COMMENT ON COLUMN sentido_via.stv_id IS
    'Identificador unicoda tabela, onde identifica qual o sentido da via';

COMMENT ON COLUMN sentido_via.stv_nome IS
    'Diz qual foi o sentido da via, sendo que o ID faz referência a ele';

ALTER TABLE sentido_via ADD CONSTRAINT pk_stv PRIMARY KEY ( stv_id );

CREATE TABLE tipo_acidente (
    tip_id     INTEGER NOT NULL,
    tip_nome   VARCHAR2(100) NOT NULL,
    tip_cau_id INTEGER NOT NULL
);

COMMENT ON COLUMN tipo_acidente.tip_id IS
    'Identificado único onde identifica o tipo de acidente';

COMMENT ON COLUMN tipo_acidente.tip_nome IS
    'Diz qual foi o tipo de acidente';

COMMENT ON COLUMN tipo_acidente.tip_cau_id IS
    'Chave estrangeira que faz referência a coluna CAU_ID da tabela CAUSA_ACIDENTE';

ALTER TABLE tipo_acidente ADD CONSTRAINT pk_tip PRIMARY KEY ( tip_id );

CREATE TABLE tipo_pista (
    tps_id   INTEGER NOT NULL,
    tps_nome VARCHAR2(35) NOT NULL
);

COMMENT ON COLUMN tipo_pista.tps_id IS
    'Identificador unico da tabela';

COMMENT ON COLUMN tipo_pista.tps_nome IS
    'Considera a quantidade de faixas da via';

ALTER TABLE tipo_pista ADD CONSTRAINT pk_tps PRIMARY KEY ( tps_id );

CREATE TABLE tracado_via (
    trv_id   INTEGER NOT NULL,
    trv_nome VARCHAR2(30) NOT NULL
);

COMMENT ON TABLE tracado_via IS
    'Tabela que armazena qual é o traçaco da via';

COMMENT ON COLUMN tracado_via.trv_id IS
    'Identificador unico da tabela';

COMMENT ON COLUMN tracado_via.trv_nome IS
    'Descrição do traçado da via';

ALTER TABLE tracado_via ADD CONSTRAINT pk_trv PRIMARY KEY ( trv_id );

CREATE TABLE unidade_operacional (
    uop_id     INTEGER NOT NULL,
    uop_cod    VARCHAR2(20) NOT NULL,
    uop_dlg_id INTEGER NOT NULL
);

COMMENT ON TABLE unidade_operacional IS
    'Tabela que armazena a unidade operacional que atendeu a ocorrência';

COMMENT ON COLUMN unidade_operacional.uop_id IS
    'Identificado unico da tabela';

COMMENT ON COLUMN unidade_operacional.uop_cod IS
    'Código da unidade opercional que atendeu a ocorrência';

COMMENT ON COLUMN unidade_operacional.uop_dlg_id IS
    'Chave estrangeira que faz referência a DLG_ID, que diz qual a delegacia da UOP pertence';

ALTER TABLE unidade_operacional ADD CONSTRAINT pk_uop PRIMARY KEY ( uop_id );

CREATE TABLE uso_solo (
    usl_id   INTEGER NOT NULL,
    usl_nome VARCHAR(20) NOT NULL
);

COMMENT ON TABLE uso_solo IS
    'Tabela que armazena as caracteristicas do local do acidente';

COMMENT ON COLUMN uso_solo.usl_id IS
    'Identificador unico da tabela que faz refência ao USL_NOME';

COMMENT ON COLUMN uso_solo.usl_nome IS
    'Diz o tipo do solo da via, com valores Urbano sendo sim e Rural sendo não';

ALTER TABLE uso_solo ADD CONSTRAINT pk_usl PRIMARY KEY ( usl_id );

ALTER TABLE delegacia
    ADD CONSTRAINT fk_dlg_sed FOREIGN KEY ( dlg_sed_id )
        REFERENCES sede ( sed_id );

ALTER TABLE localidades
    ADD CONSTRAINT fk_loc_br FOREIGN KEY ( loc_br_id )
        REFERENCES br ( br_id );

ALTER TABLE localidades
    ADD CONSTRAINT fk_loc_est FOREIGN KEY ( loc_est_id )
        REFERENCES estados ( est_id );

ALTER TABLE ocorrencia
    ADD CONSTRAINT fk_ocr_cla FOREIGN KEY ( ocr_cla_id )
        REFERENCES classificacao_acidente ( cla_id );

ALTER TABLE ocorrencia
    ADD CONSTRAINT fk_ocr_clm FOREIGN KEY ( ocr_clm_id )
        REFERENCES clima ( clm_id );

ALTER TABLE ocorrencia
    ADD CONSTRAINT fk_ocr_loc FOREIGN KEY ( ocr_loc_id )
        REFERENCES localidades ( loc_id );

ALTER TABLE ocorrencia
    ADD CONSTRAINT fk_ocr_stv FOREIGN KEY ( ocr_stv_id )
        REFERENCES sentido_via ( stv_id );

ALTER TABLE ocorrencia
    ADD CONSTRAINT fk_ocr_tip FOREIGN KEY ( ocr_tip_id )
        REFERENCES tipo_acidente ( tip_id );

ALTER TABLE ocorrencia
    ADD CONSTRAINT fk_ocr_tps FOREIGN KEY ( ocr_tps_id )
        REFERENCES tipo_pista ( tps_id );

ALTER TABLE ocorrencia
    ADD CONSTRAINT fk_ocr_trv FOREIGN KEY ( ocr_trv_id )
        REFERENCES tracado_via ( trv_id );

ALTER TABLE ocorrencia
    ADD CONSTRAINT fk_ocr_uop FOREIGN KEY ( ocr_uop_id )
        REFERENCES unidade_operacional ( uop_id );

ALTER TABLE ocorrencia
    ADD CONSTRAINT fk_ocr_usl FOREIGN KEY ( ocr_usl_id )
        REFERENCES uso_solo ( usl_id );

ALTER TABLE sede
    ADD CONSTRAINT fk_sed_est FOREIGN KEY ( sed_est_id )
        REFERENCES estados ( est_id );

ALTER TABLE tipo_acidente
    ADD CONSTRAINT fk_tip_cau FOREIGN KEY ( tip_cau_id )
        REFERENCES causa_acidente ( cau_id );

ALTER TABLE unidade_operacional
    ADD CONSTRAINT fk_uop_dlg FOREIGN KEY ( uop_dlg_id )
        REFERENCES delegacia ( dlg_id );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            15
-- CREATE INDEX                             0
-- ALTER TABLE                             30
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
