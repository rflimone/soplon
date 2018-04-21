CREATE TABLE Paginas (
  id_paginas    int(11) NOT NULL AUTO_INCREMENT, 
  dominio       varchar(255), 
  url           varchar(255), 
  glosa_pagina  varchar(255), 
  date_last     datetime NULL, 
  date_new      datetime NULL, 
  imagen        blob, 
  id_categorias int(11) NOT NULL, 
  PRIMARY KEY (id_paginas), 
  UNIQUE INDEX (id_paginas), 
  INDEX (date_last), 
  INDEX (date_new), 
  INDEX (id_categorias)) ENGINE=InnoDB;
CREATE TABLE Usuarios (
  id_usuarios      int(11) NOT NULL AUTO_INCREMENT, 
  nombres          varchar(255), 
  apellido_paterno varchar(255), 
  apellido_materno varchar(255), 
  email            varchar(255) NOT NULL UNIQUE, 
  celular          int(10) NOT NULL UNIQUE, 
  activo           tinyint DEFAULT 1 NOT NULL, 
  PRIMARY KEY (id_usuarios), 
  UNIQUE INDEX (id_usuarios)) ENGINE=InnoDB;
CREATE TABLE Metodos_Envio (
  id_metodos_envio   int(11) NOT NULL AUTO_INCREMENT, 
  glosa_metodo_envio int(11), 
  id_usuarios        int(11) NOT NULL, 
  PRIMARY KEY (id_metodos_envio), 
  UNIQUE INDEX (id_metodos_envio)) ENGINE=InnoDB;
CREATE TABLE Tags (
  id_tags   int(11) NOT NULL AUTO_INCREMENT, 
  glosa_tag varchar(255), 
  PRIMARY KEY (id_tags), 
  UNIQUE INDEX (id_tags)) ENGINE=InnoDB;
CREATE TABLE Categorias (
  id_categorias   int(11) NOT NULL AUTO_INCREMENT, 
  glosa_categoria varchar(255) NOT NULL, 
  PRIMARY KEY (id_categorias), 
  UNIQUE INDEX (id_categorias), 
  UNIQUE INDEX (glosa_categoria)) ENGINE=InnoDB;
CREATE TABLE Subscripciones (
  id_subscripciones int(11) NOT NULL, 
  id_usuarios       int(11) NOT NULL, 
  id_paginas        int(11) NOT NULL, 
  id_tags           int(11) NOT NULL, 
  PRIMARY KEY (id_subscripciones, 
  id_usuarios, 
  id_paginas), 
  UNIQUE INDEX (id_subscripciones), 
  INDEX (id_usuarios), 
  INDEX (id_paginas), 
  INDEX (id_tags)) ENGINE=InnoDB;
CREATE TABLE Tags_Paginas (
  id_tags    int(11) NOT NULL, 
  id_paginas int(11) NOT NULL, 
  PRIMARY KEY (id_tags, 
  id_paginas), 
  INDEX (id_tags), 
  INDEX (id_paginas)) ENGINE=InnoDB;
ALTER TABLE Metodos_Envio ADD CONSTRAINT FKMetodos_En279065 FOREIGN KEY (id_usuarios) REFERENCES Usuarios (id_usuarios);
ALTER TABLE Paginas ADD CONSTRAINT FKPaginas407486 FOREIGN KEY (id_categorias) REFERENCES Categorias (id_categorias);
ALTER TABLE Subscripciones ADD CONSTRAINT FKSubscripci465054 FOREIGN KEY (id_usuarios) REFERENCES Usuarios (id_usuarios);
ALTER TABLE Subscripciones ADD CONSTRAINT FKSubscripci189109 FOREIGN KEY (id_paginas) REFERENCES Paginas (id_paginas);
ALTER TABLE Tags_Paginas ADD CONSTRAINT FKTags_Pagin247397 FOREIGN KEY (id_tags) REFERENCES Tags (id_tags);
ALTER TABLE Tags_Paginas ADD CONSTRAINT FKTags_Pagin884566 FOREIGN KEY (id_paginas) REFERENCES Paginas (id_paginas);
ALTER TABLE Subscripciones ADD CONSTRAINT FKSubscripci650517 FOREIGN KEY (id_tags) REFERENCES Tags (id_tags);
