CREATE TABLE IF NOT EXISTS Organization (
    id               INTEGER     NOT NULL PRIMARY KEY AUTO_INCREMENT,
    version          INTEGER     NOT NULL,
    name             VARCHAR(20) NOT NULL,
    full_name        VARCHAR(50) NOT NULL,
    inn              VARCHAR(10) NOT NULL,
    kpp              VARCHAR(9)  NOT NULL,
    is_active        BOOLEAN     NOT NULL
);
COMMENT ON TABLE Organization IS "Организация ";
CREATE INDEX ID_ORG ON Organization(id);


CREATE TABLE  IF NOT EXISTS Office (
    id              INTEGER      NOT NULL PRIMARY KEY AUTO_INCREMENT,
    version         INTEGER      NOT NULL,
    org_id          INTEGER      NOT NULL,
    name            VARCHAR(20)  NOT NULL,
    address         VARCHAR(50)  NOT NULL,
    phone           INTEGER(10)  NOT NULL,
    is_activity     BOOLEAN      NOT NULL,
    FOREIGN KEY (org_id) REFERENCES Organization(id)
);
COMMENT ON TABLE Office IS "Офис";
CREATE INDEX ID_OFFICE ON Office(id);

CREATE TABLE IF NOT EXISTS Doc_Type
(
  id      INTEGER     NOT NULL PRIMARY KEY AUTO_INCREMENT,
  version INTEGER     NOT NULL,
  code    VARCHAR(3)  NOT NULL,
  name    VARCHAR(60) NOT NULL
);

CREATE INDEX ID_DOC_TYPE ON Doc_Type (id);

CREATE TABLE IF NOT EXISTS Country
(
  id      INTEGER     NOT NULL PRIMARY KEY AUTO_INCREMENT,
  version INTEGER     NOT NULL,
  code    VARCHAR(3)  NOT NULL,
  name    VARCHAR(60) NOT NULL
);
CREATE INDEX ID_COUNTRY ON Country(id);

CREATE TABLE IF NOT EXISTS User (
    id              INTEGER      NOT NULL PRIMARY KEY AUTO_INCREMENT,
    version         INTEGER      NOT NULL,
    office_id       INTEGER      NOT NULL,
    firstname       VARCHAR(20)      NOT NULL,
    secondname      VARCHAR(20)      NOT NULL,
    middlename      VARCHAR(20)      NOT NULL,
    position        VARCHAR(20)     NOT NULL,
    phone           INTEGER     NOT NULL,
    docnamecode_id  INTEGER      NOT NULL,
    docnumber       INTEGER      NOT NULL,
    docdate         INTEGER      NOT NULL,
    citizenship_id  INTEGER      NOT NULL,
    isidentified    BOOLEAN     NOT NULL,
    FOREIGN KEY  (office_id) REFERENCES Office(id),
    FOREIGN KEY  (docnamecode_id) REFERENCES Doc_type(id),
    FOREIGN KEY  (citizenship_id) REFERENCES Country(id)
);
COMMENT ON TABLE User IS "Пользователь";

