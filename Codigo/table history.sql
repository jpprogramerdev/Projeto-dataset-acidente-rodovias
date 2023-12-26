-- Tabela de hist�rico para BR
CREATE TABLE HBR (
    HBR_id      INTEGER NOT NULL,
    HBR_cod     VARCHAR2(5) NOT NULL,
    H_DT_ENTRADA    DATE NOT NULL,
    CONSTRAINT pk_HBR primary key (HBR_id, H_DT_ENTRADA)
);

-- Tabela de hist�rico para causa_acidente
CREATE TABLE HCAUSA_ACIDENTE (
    HCAU_id     INTEGER NOT NULL,
    HCAU_nome   VARCHAR2(200) NOT NULL,
    H_DT_ENTRADA    DATE NOT NULL,
    CONSTRAINT pk_HCAU primary key (HCAU_id, H_DT_ENTRADA)
);

-- Tabela de hist�rico para classificacao_acidente
CREATE TABLE HCLASSIFICACAO_ACIDENTE (
    HCLA_id     INTEGER NOT NULL,
    HCLA_nome   VARCHAR2(25) NOT NULL,
    H_DT_ENTRADA    DATE NOT NULL,
    CONSTRAINT pk_HCLA primary key (HCLA_id, H_DT_ENTRADA)
);

-- Tabela de hist�rico para clima
CREATE TABLE HCLIMA (
    HCLM_id     INTEGER NOT NULL,
    HCLM_nome   VARCHAR2(20) NOT NULL,
    H_DT_ENTRADA    DATE NOT NULL,
    CONSTRAINT pk_HCLM primary key (HCLM_id, H_DT_ENTRADA)
);

-- Tabela de hist�rico para delegacia
CREATE TABLE HDELEGACIA (
    HDLG_id     INTEGER NOT NULL,
    HDLG_cod    VARCHAR2(20) NOT NULL,
    HDLG_sed_id INTEGER NOT NULL,
    H_DT_ENTRADA    DATE NOT NULL,
    CONSTRAINT pk_HDLG primary key (HDLG_id,H_DT_ENTRADA)
);

-- Tabela de hist�rico para estados
CREATE TABLE HESTADOS (
    HEST_id     INTEGER NOT NULL,
    HEST_sigla  CHAR(2) NOT NULL,
    H_DT_ENTRADA    DATE NOT NULL,
    CONSTRAINT pk_HEST primary key (HEST_id,H_DT_ENTRADA)
);

-- Tabela de hist�rico para localidades
CREATE TABLE HLOCALIDADES (
    HLOC_id         INTEGER NOT NULL,
    HLOC_km         NUMBER(38, 1) NOT NULL,
    HLOC_latitude   NUMBER(38,8) NOT NULL,
    HLOC_longitude  NUMBER(38,8) NOT NULL,
    HLOC_br_id      INTEGER NOT NULL,
    HLOC_est_id     INTEGER NOT NULL,
    H_DT_ENTRADA        DATE NOT NULL,
    CONSTRAINT pk_HLOC primary key (HLOC_id,H_DT_ENTRADA)
);

-- Tabela de hist�rico para ocorrencia
CREATE TABLE HOCORRENCIA (
    HOCR_id               INTEGER NOT NULL,
    HOCR_total_envolvidos INTEGER NOT NULL,
    HOCR_mortos           INTEGER NOT NULL,
    HOCR_feridos_leves    INTEGER NOT NULL,
    HOCR_feridos_graves   INTEGER NOT NULL,
    HOCR_ilesos           INTEGER NOT NULL,
    HOCR_ignorados        INTEGER NOT NULL,
    HOCR_total_feridos    INTEGER NOT NULL,
    HOCR_veiculos         INTEGER NOT NULL,
    HOCR_dia              DATE NOT NULL,
    HOCR_dia_semana       VARCHAR2(20) NOT NULL,
    HOCR_horario          DATE NOT NULL,
    HOCR_cla_id           INTEGER NOT NULL,
    HOCR_stv_id           INTEGER NOT NULL,
    HOCR_clm_id           INTEGER NOT NULL,
    HOCR_usl_id           INTEGER NOT NULL,
    HOCR_tps_id           INTEGER NOT NULL,
    HOCR_trv_id           INTEGER NOT NULL,
    HOCR_uop_id           INTEGER NOT NULL,
    HOCR_tip_id           INTEGER NOT NULL,
    HOCR_loc_id           INTEGER NOT NULL,
    H_DT_ENTRADA              DATE NOT NULL,
    CONSTRAINT pk_HOCR primary key (HOCR_id,H_DT_ENTRADA)
);

-- Tabela de hist�rico para sede
CREATE TABLE HSEDE (
    HSED_id     INTEGER NOT NULL,
    HSED_nome   VARCHAR2(10) NOT NULL,
    HSED_est_id INTEGER NOT NULL,
    H_DT_ENTRADA    DATE NOT NULL,
    CONSTRAINT pk_HSED primary key (HSED_id,H_DT_ENTRADA)
);

-- Tabela de hist�rico para sentido_via
CREATE TABLE HSENTIDO_VIA (
    HSTV_id     INTEGER NOT NULL,
    HSTV_nome   VARCHAR2(20) NOT NULL,
    H_DT_ENTRADA    DATE NOT NULL,
    CONSTRAINT pk_HSTV primary key (HSTV_id,H_DT_ENTRADA)
);

-- Tabela de hist�rico para tipo_acidente
CREATE TABLE HTIPO_ACIDENTE (
    HTIP_id     INTEGER NOT NULL,
    HTIP_nome   VARCHAR2(100) NOT NULL,
    HTIP_cau_id INTEGER NOT NULL,
    H_DT_ENTRADA    DATE NOT NULL,
    CONSTRAINT pk_HTIP primary key (HTIP_id,H_DT_ENTRADA)
);

-- Tabela de hist�rico para tipo_pista
CREATE TABLE HTIPO_PISTA (
    HTPS_id     INTEGER NOT NULL,
    HTPS_nome   VARCHAR2(35) NOT NULL,
    H_DT_ENTRADA    DATE NOT NULL,
    CONSTRAINT pk_HTPS primary key (HTPS_id,H_DT_ENTRADA)
);

-- Tabela de hist�rico para tracado_via
CREATE TABLE HTRACADO_VIA (
    HTRV_id     INTEGER NOT NULL,
    HTRV_nome   VARCHAR2(30) NOT NULL,
    H_DT_ENTRADA    DATE NOT NULL,
    CONSTRAINT pk_HTRV primary key (HTRV_id,H_DT_ENTRADA)
);

-- Tabela de hist�rico para unidade_operacional
CREATE TABLE HUNIDADE_OPERACIONAL (
    HUOP_id     INTEGER NOT NULL,
    HUOP_cod    VARCHAR2(20) NOT NULL,
    HUOP_dlg_id INTEGER NOT NULL,
    H_DT_ENTRADA    DATE NOT NULL,
    CONSTRAINT pk_HUOP primary key (HUOP_id,H_DT_ENTRADA)
);

-- Tabela de hist�rico para uso_solo
CREATE TABLE HUSO_SOLO (
    HUSL_id     INTEGER NOT NULL,
    HUSL_nome   VARCHAR(20) NOT NULL,
    H_DT_ENTRADA    DATE NOT NULL,
    CONSTRAINT pk_HUSO primary key (HUSL_id,H_DT_ENTRADA)
);
