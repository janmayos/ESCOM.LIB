-- Generado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   en:        2023-06-19 18:06:51 CDT
--   sitio:      SQL Server 2012
--   tipo:      SQL Server 2012

CREATE DATABASE IF NOT EXISTS bd_escom;

USE bd_escom;


CREATE TABLE Biblioteca 
    (
    idEscuelaLibro INTEGER NOT NULL , 
    id_escuela INTEGER NOT NULL , 
    id_libro INTEGER NOT NULL , 
    Inventario INTEGER 
    )
GO

ALTER TABLE Biblioteca ADD CONSTRAINT Biblioteca_PK PRIMARY KEY CLUSTERED (idEscuelaLibro)
    WITH (
    ALLOW_PAGE_LOCKS = ON , 
    ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE CategoriaLibro_cat 
    (
    id_categoria INTEGER NOT NULL , 
    nombre VARCHAR (50) 
    )
GO

ALTER TABLE CategoriaLibro_cat ADD CONSTRAINT Editorial_catv1_PK PRIMARY KEY CLUSTERED (id_categoria)
    WITH (
    ALLOW_PAGE_LOCKS = ON , 
    ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Editorial_cat 
    (
    id_editorial INTEGER NOT NULL , 
    nombre VARCHAR (50) 
    )
GO

ALTER TABLE Editorial_cat ADD CONSTRAINT Editorial_cat_PK PRIMARY KEY CLUSTERED (id_editorial)
    WITH (
    ALLOW_PAGE_LOCKS = ON , 
    ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Escuela_cat 
    (
    id_Escuela INTEGER NOT NULL , 
    nombre VARCHAR (50) , 
    id_nivel INTEGER NOT NULL 
    )
GO

ALTER TABLE Escuela_cat ADD CONSTRAINT Escuela_cat_PK PRIMARY KEY CLUSTERED (id_Escuela)
    WITH (
    ALLOW_PAGE_LOCKS = ON , 
    ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Libro 
    (
    ISBN INTEGER NOT NULL , 
    Nombre VARCHAR (100) , 
    id_Editorial INTEGER NOT NULL , 
    id_categoriaLibro INTEGER NOT NULL 
    )
GO

ALTER TABLE Libro ADD CONSTRAINT Libro_PK PRIMARY KEY CLUSTERED (ISBN)
    WITH (
    ALLOW_PAGE_LOCKS = ON , 
    ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE NivelEscuela_cat 
    (
    id_nivel INTEGER NOT NULL , 
    nombre VARCHAR (50) 
    )
GO

ALTER TABLE NivelEscuela_cat ADD CONSTRAINT Escuela_catv2_PK PRIMARY KEY CLUSTERED (id_nivel)
    WITH (
    ALLOW_PAGE_LOCKS = ON , 
    ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Prestamos 
    (
    id_usuario INTEGER NOT NULL , 
    id_EscuelaLibro INTEGER NOT NULL , 
    FechaPrestado DATE , 
    FechaRegreso DATE , 
    FechaDevuelto DATE , 
    Multa INTEGER , 
    Pagado SMALLINT 
    )
GO

CREATE TABLE TipoUsuario_cat 
    (
    id_tipoUsuario INTEGER NOT NULL , 
    nombre VARCHAR (50) 
    )
GO

ALTER TABLE TipoUsuario_cat ADD CONSTRAINT Usuario_cat_PK PRIMARY KEY CLUSTERED (id_tipoUsuario)
    WITH (
    ALLOW_PAGE_LOCKS = ON , 
    ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Usuario 
    (
    id_user INTEGER NOT NULL , 
    Usuario VARCHAR (50) NOT NULL , 
    Contrase�a VARCHAR (100) NOT NULL , 
    Nombre VARCHAR (50) , 
    PrimerApellido VARCHAR (50) , 
    SegundoApellido VARCHAR (50) , 
    Boleta VARCHAR (15) , 
    id_info INTEGER NOT NULL , 
    id_escuela INTEGER NOT NULL 
    )
GO

ALTER TABLE Usuario ADD CONSTRAINT Usuario_PK PRIMARY KEY CLUSTERED (id_user)
    WITH (
    ALLOW_PAGE_LOCKS = ON , 
    ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE Biblioteca 
    ADD CONSTRAINT Biblioteca_Escuela_cat_FK FOREIGN KEY 
    ( 
    id_escuela
    ) 
    REFERENCES Escuela_cat 
    ( 
    id_Escuela 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Biblioteca 
    ADD CONSTRAINT Biblioteca_Libro_FK FOREIGN KEY 
    ( 
    id_libro
    ) 
    REFERENCES Libro 
    ( 
    ISBN 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Escuela_cat 
    ADD CONSTRAINT Escuela_cat_NivelEscuela_cat_FK FOREIGN KEY 
    ( 
    id_nivel
    ) 
    REFERENCES NivelEscuela_cat 
    ( 
    id_nivel 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Libro 
    ADD CONSTRAINT Libro_CategoriaLibro_cat_FK FOREIGN KEY 
    ( 
    id_categoriaLibro
    ) 
    REFERENCES CategoriaLibro_cat 
    ( 
    id_categoria 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Libro 
    ADD CONSTRAINT Libro_Editorial_cat_FK FOREIGN KEY 
    ( 
    id_Editorial
    ) 
    REFERENCES Editorial_cat 
    ( 
    id_editorial 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Prestamos 
    ADD CONSTRAINT Prestamos_Biblioteca_FK FOREIGN KEY 
    ( 
    id_EscuelaLibro
    ) 
    REFERENCES Biblioteca 
    ( 
    idEscuelaLibro 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Prestamos 
    ADD CONSTRAINT Prestamos_Usuario_FK FOREIGN KEY 
    ( 
    id_usuario
    ) 
    REFERENCES Usuario 
    ( 
    id_user 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Usuario 
    ADD CONSTRAINT Usuario_Escuela_cat_FK FOREIGN KEY 
    ( 
    id_escuela
    ) 
    REFERENCES Escuela_cat 
    ( 
    id_Escuela 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Usuario 
    ADD CONSTRAINT Usuario_Usuario_cat_FK FOREIGN KEY 
    ( 
    id_info
    ) 
    REFERENCES TipoUsuario_cat 
    ( 
    id_tipoUsuario 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                        9
-- CREATE INDEX                        0
-- ALTER TABLE                        17
-- CREATE VIEW                        0
-- ALTER VIEW                            0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
