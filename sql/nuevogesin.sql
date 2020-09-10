-- *******************************************************
-- INSTRUCCIONES PARA BORRAR LAS TABLAS                  *
-- *******************************************************

DROP TABLE tab_movimiento;
DROP TABLE tab_inventario;
DROP TABLE tab_producto;
DROP TABLE tab_usuario;
DROP TABLE tab_sede;
DROP TABLE tab_respaldo;
DROP TABLE tab_proveedor;
DROP TABLE tab_marca;
DROP TABLE tab_categoria;

-- ******************************************************************************************************
-- INSTRUCCIONES PARA BORRAR LAS FUNCIONES
-- ******************************************************************************************************

DROP FUNCTION fun_auditoria() CASCADE;
DROP FUNCTION fun_id_sede() CASCADE;
DROP FUNCTION fun_id_categoria() CASCADE;
DROP FUNCTION fun_id_marca() CASCADE;
DROP FUNCTION fun_id_inventario() CASCADE;
DROP FUNCTION fun_id_movimiento() CASCADE;

-- *******************************************************
-- INSTRUCCIONES PARA CREAR LAS TABLAS DEL SISTEMA ACTUAL*
-- *******************************************************

CREATE TABLE tab_sede(
 id_sede				INTEGER						NOT NULL,	  	--Número de identificación de la sede, asignado automáticamente por el sistema
 nom_sede				VARCHAR(30)					NOT NULL,	  	--Nombre de la sede de acuerdo con su ubicación geográfica: BUCARAMANAGA, PIEDECUESTA, CIMITARRA, BARRANCABERMEJA
 usr_insert      		VARCHAR(30)                 NOT NULL,	  	--Aquí comienza la sección de auditoría //Usuario que inserta nuevo dato
 fec_insert      		TIMESTAMP WITHOUT TIME ZONE NOT NULL,     	--Fecha de inserción
 usr_update      		VARCHAR(30),  							  	--Usuario que actualiza
 fec_update      		TIMESTAMP WITHOUT TIME ZONE,   		   	  	--Fecha de actualización
PRIMARY KEY (id_sede)
);

CREATE TABLE tab_usuario
(
 id_usuario 			INTEGER						NOT NULL,	 	--cedula del usuario
 nom_usuario			VARCHAR(30)					NOT NULL,	 	--nombre del usuario
 id_rol					BOOLEAN		   NOT NULL DEFAULT TRUE,		--TRUE para administrador, FALSE para usuario normal
 contraseña				VARCHAR(32)					NOT NULL,		--Contraseña de ingreso al sistema
 usr_insert         	VARCHAR(30)                 NOT NULL,	 	--Aquí comienza la sección de auditoría //Usuario que inserta nuevo dato
 fec_insert         	TIMESTAMP WITHOUT TIME ZONE NOT NULL,    	--Fecha de inserción
 usr_update         	VARCHAR(30),  							 	--Usuario que actualiza
 fec_update         	TIMESTAMP WITHOUT TIME ZONE,   			 	--Fecha de actualización
 PRIMARY KEY (id_usuario)
);

CREATE TABLE tab_proveedor
(
 id_proveedor       	INTEGER        				NOT NULL,	 	--NIT o cédula del proveedor o número asignado por el almacenista
 nom_proveedor      	VARCHAR(50)   		 		NOT NULL,	 	--Nombre del proveedor
 usr_insert         	VARCHAR(30)                 NOT NULL,	 	--Aquí comienza la sección de auditoría //Usuario que inserta nuevo dato
 fec_insert         	TIMESTAMP WITHOUT TIME ZONE NOT NULL,    	--Fecha de inserción
 usr_update         	VARCHAR(30),  							 	--Usuario que actualiza
 fec_update         	TIMESTAMP WITHOUT TIME ZONE,   			 	--Fecha de actualización
 PRIMARY KEY(id_proveedor)
);

CREATE TABLE tab_marca
(
 id_marca				INTEGER						NOT NULL,		--Identificación de la marca asignada automáticamente por el sistema
 nom_marca				VARCHAR(30)					NOT NULL,		--Nombre de la marca
 usr_insert         	VARCHAR(30)                 NOT NULL,	 	--Aquí comienza la sección de auditoría //Usuario que inserta nuevo dato
 fec_insert         	TIMESTAMP WITHOUT TIME ZONE NOT NULL,    	--Fecha de inserción
 usr_update         	VARCHAR(30),  							 	--Usuario que actualiza
 fec_update         	TIMESTAMP WITHOUT TIME ZONE,   			 	--Fecha de actualización
 PRIMARY KEY(id_marca)
);

CREATE TABLE tab_categoria
(
 id_categoria			INTEGER						NOT NULL,		--Identificación de la marca asignada automáticamente por el sistema
 nom_categoria			VARCHAR(50)					NOT NULL,		--Nombre de la categoria. Puede ser: MAQUILLAJE, CUIDADO ESTÉTICO DE MANOS Y PIES, TINTES, BIOSEGUIRIDAD...
 usr_insert         	VARCHAR(30)                 NOT NULL,	 	--Aquí comienza la sección de auditoría //Usuario que inserta nuevo dato
 fec_insert         	TIMESTAMP WITHOUT TIME ZONE NOT NULL,    	--Fecha de inserción
 usr_update         	VARCHAR(30),  							 	--Usuario que actualiza
 fec_update         	TIMESTAMP WITHOUT TIME ZONE,   			 	--Fecha de actualización
 PRIMARY KEY(id_categoria)
);

CREATE TABLE tab_producto
(
 id_producto 			INTEGER		 				NOT NULL,	 	--Número de identificación del producto asignado por el usuario
 imagen					VARCHAR(255)					NULL,		--Imagen del producto
 nom_producto			VARCHAR(40)	 				NOT NULL,	 	--Nombre del producto
 nom_maquina			VARCHAR(12)	 				NOT NULL,		--Nombre del producto en la máquina registradora
 descripcion			TEXT							NULL,		--Para agregar más detalles del producto
 precio_costo			INTEGER		 	  NOT NULL DEFAULT 0,		--Precio de compra del producto
 precio_venta			INTEGER		 	  NOT NULL DEFAULT 0,		--Precio de venta del producto
 id_marca				INTEGER						NOT NULL,
 id_categoria			INTEGER						NOT NULL,
 id_proveedor       	INTEGER        				NOT NULL,
 ind_disponibilidad 	INTEGER		 	  NOT NULL DEFAULT 0, 		--Existencias del producto en el almacén
 min_inventario			INTEGER			  NOT NULL DEFAULT 6,		--Existencias mínimas que debe haber del producto en el almacén
 ind_estado				BOOLEAN		   NOT NULL DEFAULT TRUE,		--Indica si el producto está activo, si es TRUE el producto está activo
 usr_insert         	VARCHAR(30)                 NOT NULL,	 	--Aquí comienza la sección de auditoría //Usuario que inserta nuevo dato
 fec_insert         	TIMESTAMP WITHOUT TIME ZONE NOT NULL,    	--Fecha de inserción
 usr_update         	VARCHAR(30),  							 	--Usuario que actualiza
 fec_update         	TIMESTAMP WITHOUT TIME ZONE,   				--Fecha de actualización
 PRIMARY KEY(id_producto),
 FOREIGN KEY(id_marca) REFERENCES tab_marca(id_marca),
 FOREIGN KEY(id_categoria) REFERENCES tab_categoria(id_categoria),
 FOREIGN KEY(id_proveedor) REFERENCES tab_proveedor(id_proveedor)
);

CREATE TABLE tab_movimiento
(
 id_movimiento			INTEGER 					NOT NULL,		--Asignado por el sistema
 id_producto 			INTEGER		 				NOT NULL,
 fecha					DATE,
 factura				VARCHAR(12),
 movimiento		 		VARCHAR(12),
 tipo_movimiento		VARCHAR(12),
 cantidad				BIGINT,
 id_sede				INTEGER,
 observaciones			VARCHAR(50),
 usr_insert         	VARCHAR(30)                 NOT NULL,	 	--Aquí comienza la sección de auditoría //Usuario que inserta nuevo dato
 fec_insert         	TIMESTAMP WITHOUT TIME ZONE NOT NULL,    	--Fecha de inserción
 usr_update         	VARCHAR(30),  							 	--Usuario que actualiza
 fec_update         	TIMESTAMP WITHOUT TIME ZONE,   				--Fecha de actualización
 FOREIGN KEY(id_producto) REFERENCES tab_producto(id_producto),
 FOREIGN KEY(id_sede) REFERENCES tab_sede(id_sede)
);

CREATE TABLE tab_inventario
(
 id_inventario			INTEGER						NOT NULL,		--Asignado por el sistema
 id_producto 			INTEGER		 				NOT NULL,
 saldo_inicial			SMALLINT					NOT NULL,
 entradas				SMALLINT					NOT NULL,
 salidas				SMALLINT					NOT NULL,
 saldo_final			SMALLINT					NOT NULL,
 usr_insert         	VARCHAR(30)                 NOT NULL,	 	--Aquí comienza la sección de auditoría //Usuario que inserta nuevo dato
 fec_insert         	TIMESTAMP WITHOUT TIME ZONE NOT NULL,    	--Fecha de inserción
 usr_update         	VARCHAR(30),  							 	--Usuario que actualiza
 fec_update         	TIMESTAMP WITHOUT TIME ZONE,   				--Fecha de actualización
 PRIMARY KEY(id_inventario, id_producto), 
 FOREIGN KEY(id_producto) REFERENCES tab_producto(id_producto)
);



-- **********************************************************************************
-- TABLA PARA TENER INFORMACION DEL USUARIO QUE BORRA ALGUN DATO DE CUALQUIER TABLA *
--  *********************************************************************************

CREATE TABLE tab_respaldo
(
 id_respaldo				INTEGER						NOT NULL,	--Identificador de la tabla respaldo 
 nom_tabla					VARCHAR						NOT NULL,	--Nombre de la tabla que fue eliminada
 usr_delete             	VARCHAR(30) 				NOT NULL,	--Nombre del usuario que elimina el registro
 fec_delete             	TIMESTAMP WITHOUT TIME ZONE NOT NULL,   --Fecha en la cual se ha eliminado el registro
PRIMARY KEY (id_respaldo)
);

-- ******************************************************************************************************
-- FUNCION AUDITORIA PARA TENER INFORMACION DE LAS ACTUALIZACIONES E INSERCIONES DE DATOS EN LAS TABLAS *
-- ******************************************************************************************************

CREATE FUNCTION fun_auditoria() RETURNS "trigger"
 AS $$
 DECLARE wid_respaldo tab_respaldo.id_respaldo%TYPE;
 BEGIN
	 IF TG_OP = 'INSERT' THEN
	     NEW.usr_insert = CURRENT_USER;
	     NEW.fec_insert = CURRENT_TIMESTAMP;
	    RETURN NEW;
	 END IF;
	  
	 IF TG_OP = 'UPDATE' THEN
	     NEW.usr_update = CURRENT_USER;
	     NEW.fec_update = CURRENT_TIMESTAMP;
	       RETURN NEW;
	 END IF;
	  	  
	 IF TG_OP = 'DELETE' THEN
	    SELECT MAX(id_respaldo) INTO wid_respaldo FROM tab_respaldo;
	    IF wid_respaldo IS NULL OR wid_respaldo = 0 THEN wid_respaldo = 1;
	    ELSE
	    wid_respaldo = wid_respaldo + 1;
	    END IF;
	    INSERT INTO tab_respaldo VALUES (wid_respaldo, tg_table_name, CURRENT_USER, CURRENT_TIMESTAMP);
	    RETURN OLD;
	 END IF;
    RETURN NULL;
 END;
$$ LANGUAGE plpgsql;


-- ******************************************************************************************************
-- FUNCION PARA HACER NÚMEROS CONSECUTIVOS SIN NECESIDAD DEL CAMPO SERIAL *******************************
-- ******************************************************************************************************

CREATE FUNCTION fun_id_sede() RETURNS "trigger"
 AS $$
 DECLARE wid SMALLINT;
 BEGIN
	SELECT MAX(id_sede) FROM tab_sede INTO wid;
	IF wid IS NULL OR wid = 0 THEN wid =1;
	NEW.id_sede=wid;
	RETURN NEW;
	ELSE
	wid=wid+1;
	NEW.id_sede=wid;
	RETURN NEW;
	END IF;
 RETURN NULL;
 END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION fun_id_categoria() RETURNS "trigger"
 AS $$
 DECLARE wid SMALLINT;
 BEGIN
	SELECT MAX(id_categoria) FROM tab_categoria INTO wid;
	IF wid IS NULL OR wid = 0 THEN wid =1;
	NEW.id_categoria=wid;
	RETURN NEW;
	ELSE
	wid=wid+1;
	NEW.id_categoria=wid;
	RETURN NEW;
	END IF;
 RETURN NULL;
 END;
$$ LANGUAGE plpgsql;	

CREATE FUNCTION fun_id_marca() RETURNS "trigger"
 AS $$
 DECLARE wid SMALLINT;
 BEGIN
	SELECT MAX(id_marca) FROM tab_marca INTO wid;
	IF wid IS NULL OR wid = 0 THEN wid =1;
	NEW.id_marca=wid;
	RETURN NEW;
	ELSE
	wid=wid+1;
	NEW.id_marca=wid;
	RETURN NEW;
	END IF;
 RETURN NULL;
 END;
$$ LANGUAGE plpgsql;  

CREATE FUNCTION fun_id_inventario() RETURNS "trigger"
 AS $$
 DECLARE wid SMALLINT;
 BEGIN
	SELECT MAX(id_inventario) FROM tab_inventario INTO wid;
	IF wid IS NULL OR wid = 0 THEN wid =1;
	NEW.id_inventario=wid;
	RETURN NEW;
	ELSE
	wid=wid+1;
	NEW.id_inventario=wid;
	RETURN NEW;
	END IF;
 RETURN NULL;
 END;
$$ LANGUAGE plpgsql;  

CREATE FUNCTION fun_id_movimiento() RETURNS "trigger"
 AS $$
 DECLARE wid SMALLINT;
 BEGIN
	SELECT MAX(id_movimiento) FROM tab_movimiento INTO wid;
	IF wid IS NULL OR wid = 0 THEN wid =1;
	NEW.id_movimiento=wid;
	RETURN NEW;
	ELSE
	wid=wid+1;
	NEW.id_movimiento=wid;
	RETURN NEW;
	END IF;
 RETURN NULL;
 END;
$$ LANGUAGE plpgsql; 

-- *********************************************************************  
-- DISPARADORES PARA LAS ACTUALIZACIONES Y LAS INSERCION DE LAS TABLAS *
-- *********************************************************************

CREATE TRIGGER tri_auditoria
 BEFORE INSERT OR UPDATE ON tab_categoria
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoria
 BEFORE INSERT OR UPDATE ON tab_marca
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoria
 BEFORE INSERT OR UPDATE ON tab_sede
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoria
 BEFORE INSERT OR UPDATE ON tab_proveedor
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoria
 BEFORE INSERT OR UPDATE ON tab_usuario
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoria
 BEFORE INSERT OR UPDATE ON tab_producto
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoria
 BEFORE INSERT OR UPDATE ON tab_movimiento
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoria
 BEFORE INSERT OR UPDATE ON tab_inventario
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();



-- *******************************************************************************
-- DISPARADORES DE LA FUNCION RESPALDO PARA LOS REGISTROS QUE HAN SIDO BORRADOS *
-- *******************************************************************************

CREATE TRIGGER tri_auditoriadelete
 AFTER DELETE ON tab_categoria
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoriadelete
 AFTER DELETE ON tab_marca
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoriadelete
 AFTER DELETE ON tab_sede
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoriadelete
 AFTER DELETE ON tab_proveedor
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoriadelete
 AFTER DELETE ON tab_usuario
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoriadelete
 AFTER DELETE ON tab_producto
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoriadelete
 AFTER DELETE ON tab_movimiento
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoriadelete
 AFTER DELETE ON tab_inventario
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();



-- *******************************************************************************
-- DISPARADORES PARA GENERAR NÚMEROS DE IDENTIFICACIÓN DE TABLAS AUTOMÁTICOS *****
-- *******************************************************************************

CREATE TRIGGER tri_id_sede
	BEFORE INSERT ON tab_sede
	FOR EACH ROW EXECUTE PROCEDURE fun_id_sede();

CREATE TRIGGER tri_id_categoria
	BEFORE INSERT ON tab_categoria
	FOR EACH ROW EXECUTE PROCEDURE fun_id_categoria();

CREATE TRIGGER tri_id_marca
	BEFORE INSERT ON tab_marca
	FOR EACH ROW EXECUTE PROCEDURE fun_id_marca();

CREATE TRIGGER tri_id_movimiento
	BEFORE INSERT ON tab_movimiento
	FOR EACH ROW EXECUTE PROCEDURE fun_id_movimiento();

CREATE TRIGGER tri_id_inventario
	BEFORE INSERT ON tab_inventario
	FOR EACH ROW EXECUTE PROCEDURE fun_id_inventario();




-- *******************************************************************************
--INSERTS PARAR PROBAR EL SCRIPT *************************************************
-- *******************************************************************************

INSERT INTO tab_sede (nom_sede) VALUES ('BUCARAMANGA');
INSERT INTO tab_sede (nom_sede) VALUES ('PIEDECUESTA');
INSERT INTO tab_sede (nom_sede) VALUES ('BARRANCABERMEJA');
INSERT INTO tab_sede (nom_sede) VALUES ('GIRON');
INSERT INTO tab_sede (nom_sede) VALUES ('SOGAMOSO');
INSERT INTO tab_sede (nom_sede) VALUES ('CIMITARRA');
INSERT INTO tab_sede (nom_sede) VALUES ('VALLEDUPAR');
INSERT INTO tab_sede (nom_sede) VALUES ('PUERTO WILCHES');

INSERT INTO tab_usuario (id_usuario,nom_usuario,id_rol, contraseña) VALUES (123456,'SUPERUSUARIO',TRUE,1234);

INSERT INTO tab_proveedor VALUES (1,'MAXIBELT');
INSERT INTO tab_proveedor VALUES (2,'SERFELSA');
INSERT INTO tab_proveedor VALUES (3,'MOHAMED');
INSERT INTO tab_proveedor VALUES (4,'TERSA');
INSERT INTO tab_proveedor VALUES (5,'TEC ITALY');
INSERT INTO tab_proveedor VALUES (6,'VARIOS');

INSERT INTO tab_marca (nom_marca) VALUES ('SIN MARCA');
INSERT INTO tab_marca (nom_marca) VALUES ('TONOS');
INSERT INTO tab_marca (nom_marca) VALUES ('MAXIBELT');
INSERT INTO tab_marca (nom_marca) VALUES ('REVLON');
INSERT INTO tab_marca (nom_marca) VALUES ('TEC ITALY');
INSERT INTO tab_marca (nom_marca) VALUES ('ALFAPARF');
INSERT INTO tab_marca (nom_marca) VALUES ('MASGLO');
INSERT INTO tab_marca (nom_marca) VALUES ('PFIFFERY');
INSERT INTO tab_marca (nom_marca) VALUES ('BELL FRANZ');
INSERT INTO tab_marca (nom_marca) VALUES ('ALIZZ');
INSERT INTO tab_marca (nom_marca) VALUES ('DOLCE BELLA');
INSERT INTO tab_marca (nom_marca) VALUES ('KALU');
INSERT INTO tab_marca (nom_marca) VALUES ('ARDEL');
INSERT INTO tab_marca (nom_marca) VALUES ('ATENEA');
INSERT INTO tab_marca (nom_marca) VALUES ('STARTEX');
INSERT INTO tab_marca (nom_marca) VALUES ('AROBELL');
INSERT INTO tab_marca (nom_marca) VALUES ('PROKPILL');
INSERT INTO tab_marca (nom_marca) VALUES ('SPAI SONS');
INSERT INTO tab_marca (nom_marca) VALUES ('ORGANIC NAILS');
INSERT INTO tab_marca (nom_marca) VALUES ('PROFESIONAL NAIL');
INSERT INTO tab_marca (nom_marca) VALUES ('SIMONA');

INSERT INTO tab_categoria (nom_categoria) VALUES ('MAQUILLAJE');
INSERT INTO tab_categoria (nom_categoria) VALUES ('TINTES');
INSERT INTO tab_categoria (nom_categoria) VALUES ('CUIDADO ESTETICO DE MANOS Y PIES');
INSERT INTO tab_categoria (nom_categoria) VALUES ('BIOSEGURIDAD');
INSERT INTO tab_categoria (nom_categoria) VALUES ('CUIDADO CABELLO');
INSERT INTO tab_categoria (nom_categoria) VALUES ('ELECTRO');
INSERT INTO tab_categoria (nom_categoria) VALUES ('DEPILACIÓN');
INSERT INTO tab_categoria (nom_categoria) VALUES ('PEINADOS');
INSERT INTO tab_categoria (nom_categoria) VALUES ('CORTE DE CABELLO');
INSERT INTO tab_categoria (nom_categoria) VALUES ('VARIOS');

INSERT INTO tab_producto
(id_producto,nom_producto,nom_maquina,precio_costo,precio_venta,id_marca,id_categoria,id_proveedor) 
VALUES (1,'BROCHA CORTE','BROCHA CORTE',14000,20000,1,9,6);

INSERT INTO tab_producto
(id_producto,nom_producto,nom_maquina,precio_costo,precio_venta,id_marca,id_categoria,id_proveedor) 
VALUES (2,'SACHETS SURTIDOS X30 GR','SACHETSPROKP',2000,3000,17,5,6);

INSERT INTO tab_producto
(id_producto,nom_producto,nom_maquina,precio_costo,precio_venta,id_marca,id_categoria,id_proveedor) 
VALUES (3,'TRATAMIENTO CENIZO X300 ML','TRATAMCENIZO',11300,17000,17,5,6);

INSERT INTO tab_producto
(id_producto,nom_producto,nom_maquina,precio_costo,precio_venta,id_marca,id_categoria,id_proveedor) 
VALUES (4,'AMPOLLETA ACTIVADORA DE COLOR','AMPOLLETACTI',3770,5500,17,5,6);

INSERT INTO tab_producto
(id_producto,nom_producto,nom_maquina,precio_costo,precio_venta,id_marca,id_categoria,id_proveedor) 
VALUES (5,'SILK SYSTEM SHINE SPRAY 200GRS','SPRAYSILKSYS',30000,38000,5,5,6);

INSERT INTO tab_producto
(id_producto,nom_producto,nom_maquina,precio_costo,precio_venta,id_marca,id_categoria,id_proveedor) 
VALUES (6,'LIMA DESMANCHADORA','LIMADESMANCH',690,1000,14,5,6);

INSERT INTO tab_producto
(id_producto,nom_producto,nom_maquina,precio_costo,precio_venta,id_marca,id_categoria,id_proveedor) 
VALUES (7,'ACONDICIONADOR LUMINA','ACONDILUMINA',28666,35000,5,5,6);

INSERT INTO tab_producto
(id_producto,nom_producto,nom_maquina,precio_costo,precio_venta,id_marca,id_categoria,id_proveedor) 
VALUES (8,'ACONDICIONADOR METAMORFOSIS','ACONDICMETAM',32000,38000,5,5,6);

INSERT INTO tab_producto
(id_producto,nom_producto,nom_maquina,precio_costo,precio_venta,id_marca,id_categoria,id_proveedor) 
VALUES (9,'ACONDICIONADOR SHINE','ACONDICSHINE',36667,45000,5,5,6);

INSERT INTO tab_producto
(id_producto,nom_producto,nom_maquina,precio_costo,precio_venta,id_marca,id_categoria,id_proveedor) 
VALUES (10,'PALETA PANKEY X8 Y PAN STICK X6 LUXURY','PALETAPANKEY',63900,77000,2,1,6);


INSERT INTO tab_movimiento (id_producto, fecha, factura, movimiento, tipo_movimiento, cantidad, id_sede) VALUES (1,'2-05-2016','factura1','saldoinicial','saldoinicial',100,1);
INSERT INTO tab_movimiento (id_producto, fecha, factura, movimiento, tipo_movimiento, cantidad, id_sede) VALUES (1,'2-05-2016','factura2','compra','entrada',100,1);
INSERT INTO tab_movimiento (id_producto, fecha, factura, movimiento, tipo_movimiento, cantidad, id_sede) VALUES (1,'2-05-2016','factura3','venta','salida',2,1);
INSERT INTO tab_movimiento (id_producto, fecha, factura, movimiento, tipo_movimiento, cantidad, id_sede) VALUES (2,'2-05-2016','factura1','saldoinicial','saldoinicial',10,1);
INSERT INTO tab_movimiento (id_producto, fecha, factura, movimiento, tipo_movimiento, cantidad, id_sede) VALUES (2,'2-05-2016','factura2','compra','entrada',10,1);
INSERT INTO tab_movimiento (id_producto, fecha, factura, movimiento, tipo_movimiento, cantidad, id_sede) VALUES (2,'2-05-2016','factura3','venta','salida',5,1);

SELECT * FROM tab_respaldo;
SELECT * FROM tab_sede;
SELECT * FROM tab_usuario;
SELECT * FROM tab_proveedor;
SELECT * FROM tab_marca;
SELECT * FROM tab_categoria;
SELECT * FROM tab_producto;
SELECT * FROM tab_movimiento;
SELECT * FROM tab_inventario;	

TRUNCATE TABLE tab_movimiento;
TRUNCATE TABLE tab_inventario;
TRUNCATE TABLE tab_producto CASCADE;

DROP FUNCTION  fun_productoenmovimiento() CASCADE;
CREATE FUNCTION fun_productoenmovimiento() RETURNS "trigger"
 AS $$
 DECLARE wid SMALLINT;
 BEGIN
	INSERT INTO tab_inventario(id_producto,saldo_inicial,entradas,salidas,saldo_final) VALUES (NEW.id_producto,0,0,0,0); 
 RETURN NEW;
 END;
$$ LANGUAGE plpgsql; 

CREATE TRIGGER tri_productoenmovimiento
	AFTER INSERT ON tab_producto
	FOR EACH ROW EXECUTE PROCEDURE fun_productoenmovimiento();
	

DROP FUNCTION fun_operaciones() CASCADE;
CREATE FUNCTION fun_operaciones() RETURNS "trigger"
 AS $$
  DECLARE si BIGINT;
  DECLARE e BIGINT;
  DECLARE s BIGINT;
  DECLARE saldo BIGINT;
 BEGIN

SELECT SUM(cantidad) FROM tab_movimiento WHERE tipo_movimiento='saldoinicial' AND id_producto=NEW.id_producto INTO si; 
SELECT SUM(cantidad) FROM tab_movimiento WHERE tipo_movimiento='entrada' AND id_producto=NEW.id_producto  INTO e;
SELECT SUM(cantidad) FROM tab_movimiento WHERE tipo_movimiento='salida' AND id_producto=NEW.id_producto  INTO s;
IF si IS NULL then si=0;
end if;
IF e IS NULL then e=0;
end if;
IF s IS NULL then s=0;
end if;

saldo=(si+e)-s;

UPDATE tab_inventario SET(saldo_inicial,entradas,salidas,saldo_final)=(si,e,s,saldo); 

 RETURN NEW;
 END;
$$ LANGUAGE plpgsql; 

CREATE TRIGGER tri_operaciones
	AFTER INSERT ON tab_movimiento
	FOR EACH ROW EXECUTE PROCEDURE fun_operaciones();