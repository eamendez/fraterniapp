CREATE DATABASE fraterniApp;
USE fraterniApp;
CREATE TABLE  IF NOT EXISTS estado (
	estadoId INT(11) AUTO_INCREMENT PRIMARY KEY,
	estadoNombre VARCHAR(50) NOT NULL
);

CREATE TABLE  IF NOT EXISTS perfil (
	perfilId INT(11) AUTO_INCREMENT PRIMARY KEY,
	perfilNombre VARCHAR(50) NOT NULL,
	fk_estadoId INT(11)
 );
CREATE TABLE  IF NOT EXISTS modulo (
	moduloId INT(11) AUTO_INCREMENT PRIMARY KEY,
	moduloNombre VARCHAR(50)  NOT NULL,
	moduloLink VARCHAR(50) NOT NULL,
	fk_estadoId INT(11)
 ); 

CREATE TABLE IF NOT EXISTS universidad (
	universidadId INT(11) AUTO_INCREMENT PRIMARY KEY,
	universidadNombre VARCHAR(150) NOT NULL,
	fk_estadoId INT(11)
	);
CREATE TABLE IF NOT EXISTS empresa (
	empresaId INT(11) AUTO_INCREMENT PRIMARY KEY,
	nombreNombre VARCHAR(150) NOT NULL,
	nombreContacto VARCHAR(50) NULL,
	nombreTelefono VARCHAR(50) NULL,
	fk_sectorId INT(11),
	fk_estadoId INT(11)
	);
CREATE TABLE IF NOT EXISTS sector (
	sectorId INT(11) AUTO_INCREMENT PRIMARY KEY,
	sectorNombre VARCHAR(150) NOT NULL
	);
CREATE TABLE IF NOT EXISTS vacante (
	vacanteId INT(11) AUTO_INCREMENT PRIMARY KEY,
	vacanteNombre VARCHAR(150) NOT NULL,
	vacanteDescripcion VARCHAR(250) NULL,
	vacanteSalario VARCHAR(50) NULL,
	fechaRegistro DATE,
	fk_empresaId INT(11),
	fk_usuarioId INT(11),
	fk_estadoId INT(11)
	);
CREATE TABLE IF NOT EXISTS tipoUsuario (
tipoUsuarioId INT(11) AUTO_INCREMENT PRIMARY KEY,
tipoUsuarioNombre VARCHAR(150) NOT NULL
);

CREATE TABLE IF NOT EXISTS usuario (
	usuarioId INT(11) AUTO_INCREMENT PRIMARY KEY,
	usuarioNombre VARCHAR(150) NOT NULL,
	usuarioEmail VARCHAR(150) NOT NULL,
	usuarioTelefonoPrincipal VARCHAR(150) NOT NULL,
	fk_universidadId INT(11),
	fk_perfilId INT(11),
	fk_moduloId INT(11),
	fk_estadoId INT(11)
	);

CREATE TABLE IF NOT EXISTS derecho (
	derechoId INT(11) AUTO_INCREMENT PRIMARY KEY,
	fk_perfilId INT(11),
	fk_tipoUsuarioId INT(11),
	fk_estadoId INT(11)
	);

CREATE TABLE IF NOT EXISTS tipoPublicacion (
	tipoPublicacionId INT(11) AUTO_INCREMENT PRIMARY KEY,
	tipoPublicacionNombre VARCHAR(150) NOT NULL
	);

CREATE TABLE IF NOT EXISTS publicacion (
	publicacionId INT(11) AUTO_INCREMENT PRIMARY KEY,
	publicacionTitulo  VARCHAR(140) NOT NULL,
	publicacionDescripcion TEXT NOT NULL,
	publicacionFechaCreacion DATETIME NOT NULL,
	fk_tipoPublicacionId INT(11),
	fk_usuarioId INT(11),
	fk_estadoId INT(11)

	);
CREATE TABLE IF NOT EXISTS  trazabilidad (
	trazabilidadId INT(11) AUTO_INCREMENT PRIMARY KEY,
	trazabilidadDescripcion VARCHAR(250)  NOT NULL,
	fk_estadoId INT(11),
	fechaRegistro DATE 
	);

CREATE TABLE IF NOT EXISTS  glosario (
	glosarioId INT(11) AUTO_INCREMENT PRIMARY KEY,
	glosarioDescripction text  NOT NULL,
	fk_estadoId INT(11),
	fechaRegistro DATE 
	);

-- RELACIONES

ALTER TABLE perfil add CONSTRAINT fk_estadoId  FOREIGN KEY(fk_estadoId) REFERENCES estado(estadoId);
ALTER TABLE modulo add CONSTRAINT fk_estadoId2  FOREIGN KEY(fk_estadoId) REFERENCES estado(estadoId);
ALTER TABLE universidad add CONSTRAINT fk_estadoId3  FOREIGN KEY(fk_estadoId) REFERENCES estado(estadoId);

ALTER TABLE usuario ADD CONSTRAINT fk_perfilId FOREIGN KEY (fk_perfilId) REFERENCES perfil (perfilId);
ALTER TABLE usuario ADD CONSTRAINT fk_moduloId FOREIGN KEY (fk_moduloId) REFERENCES modulo (moduloId);
ALTER TABLE usuario ADD CONSTRAINT fk_universidadId FOREIGN KEY (fk_universidadId) REFERENCES universidad (universidadId);
ALTER TABLE usuario ADD CONSTRAINT fk_estadoId4  FOREIGN KEY(fk_estadoId) REFERENCES estado(estadoId);
ALTER TABLE usuario ADD CONSTRAINT fk_tipoUsuarioId FOREIGN KEY (fk_tipoUsuarioId) REFERENCES tipoUsuario (tipoUsuarioId) ;


ALTER TABLE derecho ADD CONSTRAINT fk_perfilId FOREIGN KEY (fk_perfilId) REFERENCES perfil (perfilId);
ALTER TABLE derecho ADD CONSTRAINT fk_tipoUsuarioId2 FOREIGN KEY (fk_tipoUsuarioId) REFERENCES tipoUsuario (tipoUsuarioId) ;
ALTER TABLE derecho ADD CONSTRAINT fk_estadoId5 FOREIGN KEY (fk_estadoId) REFERENCES estado (estadoId) ;

ALTER TABLE trazabilidad ADD CONSTRAINT fk_estadoId6 FOREIGN KEY (fk_estadoId) REFERENCES estado (estadoId) ;

ALTER TABLE publicacion ADD CONSTRAINT fk_tipoPublicacionId FOREIGN KEY (fk_tipoPublicacionId) REFERENCES tipoPublicacion (tipoPublicacionId) ;
ALTER TABLE publicacion ADD CONSTRAINT fk_usuarioId FOREIGN KEY (fk_usuarioId) REFERENCES usuario (usuarioId) ;
ALTER TABLE publicacion ADD CONSTRAINT fk_estadoId7 FOREIGN KEY (fk_estadoId) REFERENCES estado (estadoId) ;


ALTER TABLE empresa ADD CONSTRAINT fk_estadoId8 FOREIGN KEY (fk_estadoId) REFERENCES estado (estadoId) ;
ALTER TABLE vacante ADD CONSTRAINT fk_estadoId9 FOREIGN KEY (fk_estadoId) REFERENCES estado (estadoId) ;
ALTER TABLE vacante ADD CONSTRAINT fk_usuarioId2 FOREIGN KEY (fk_usuarioId) REFERENCES usuario (usuarioId) ;
ALTER TABLE vacante ADD CONSTRAINT fk_empresaId FOREIGN KEY (fk_empresaId) REFERENCES empresa (empresaId) ;

ALTER TABLE glosario ADD CONSTRAINT fk_estadoId10 FOREIGN KEY (fk_estadoId) REFERENCES estado (estadoId) ;
ALTER TABLE empresa ADD CONSTRAINT fk_sectorId FOREIGN KEY (fk_sectorId) REFERENCES sector (sectorId) ;
