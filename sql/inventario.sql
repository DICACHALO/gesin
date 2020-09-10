-- *******************************************************
-- INSTRUCCIONES PARA BORRAR VISTAS Y TABLAS             *
-- *******************************************************
DROP VIEW totales CASCADE;
DROP VIEW informe CASCADE;
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
DROP FUNCTION fun_operaciones() CASCADE;
DROP FUNCTION fun_productoenmovimiento() CASCADE;
DROP FUNCTION fun_disponibilidad() CASCADE;

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
 tipo 					VARCHAR(10)	NOT NULL DEFAULT 'VENTA',		--Identifica si es un producto para la venta, comodato, alquiler, o un libro
 descripcion			TEXT							NULL,		--Para agregar más detalles del producto
 precio_costo			INTEGER		 	  NOT NULL DEFAULT 0,		--Precio de compra del producto
 precio_venta			INTEGER		 	  NOT NULL DEFAULT 0,		--Precio de venta del producto
 id_marca				INTEGER						NOT NULL,
 id_categoria			INTEGER						NOT NULL,
 id_proveedor       	INTEGER        				NOT NULL,
 ind_disponibilidad 	SMALLINT	 	  NOT NULL DEFAULT 0, 		--Existencias del producto en el almacén
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
 id_producto 			INTEGER		 				NOT NULL,		--Código del producto
 fecha					DATE						NOT NULL,		--Fecha en la cual se generó la tranacción
 factura				VARCHAR(12)					NOT NULL,		--Número identificador del documento soporte de la transacción
 movimiento		 		VARCHAR(12)					NOT NULL,		--Identifica si es una compra, venta, saldo inicial, devolución por compra, devolución por venta, remisión
 tipo_movimiento		VARCHAR(12)					NOT NULL,		--Identifica si es una entrada o una salida de producto del inventario
 cantidad				SMALLINT					NOT NULL,		--Número de productos
 id_sede				INTEGER	DEFAULT 1			NOT NULL,		--Sede del instituto que provoca el movimiento
 observaciones			VARCHAR(50),								--Espacio para agregar información adicional de la transacción
 usr_insert         	VARCHAR(30)                 NOT NULL,	 	--Aquí comienza la sección de auditoría //Usuario que inserta nuevo dato
 fec_insert         	TIMESTAMP WITHOUT TIME ZONE NOT NULL,    	--Fecha de inserción
 usr_update         	VARCHAR(30),  							 	--Usuario que actualiza
 fec_update         	TIMESTAMP WITHOUT TIME ZONE,   				--Fecha de actualización
 FOREIGN KEY(id_producto) REFERENCES tab_producto(id_producto),
 FOREIGN KEY(id_sede) REFERENCES tab_sede(id_sede)
);

CREATE TABLE tab_inventario											--En esta tabla se condensa toda la información organizada de los movimientos realizados según producto
(
 id_inventario			INTEGER						NOT NULL,		--Asignado por el sistema
 id_producto 			INTEGER		 				NOT NULL,
 saldo_inicial			SMALLINT					NOT NULL,		--Número por el cual se inician existencias en el inventario
 entradas				SMALLINT					NOT NULL,		--Ingresos a inventario
 salidas				SMALLINT					NOT NULL,		--Egresos de inventario
 saldo_final			SMALLINT					NOT NULL,		--Existencias actuales de inventario
 usr_insert         	VARCHAR(30)                 NOT NULL,	 	--Aquí comienza la sección de auditoría //Usuario que inserta nuevo dato
 fec_insert         	TIMESTAMP WITHOUT TIME ZONE NOT NULL,    	--Fecha de inserción
 usr_update         	VARCHAR(30),  							 	--Usuario que actualiza
 fec_update         	TIMESTAMP WITHOUT TIME ZONE,   				--Fecha de actualización
 PRIMARY KEY(id_inventario, id_producto), 
 FOREIGN KEY(id_producto) REFERENCES tab_producto(id_producto)
);

--Vista para el informe final de inventario
CREATE VIEW informe AS 
SELECT b.id_producto, a.nom_producto, c.nom_marca, b.saldo_inicial, b.entradas,((b.saldo_inicial+b.entradas)*a.precio_costo) AS valor_entradas,
b.salidas,(b.salidas*a.precio_venta) AS valor_salidas,
b.saldo_final,(b.saldo_final*a.precio_costo) AS inventario_costo_total
FROM tab_producto a, tab_inventario b, tab_marca c
WHERE a.id_producto=b.id_producto AND a.id_marca=c.id_marca ORDER BY 1;

--Selección de datos para hallar totales del reporte final:
--SELECT SUM(valor_entradas) AS total_entradas, SUM(valor_salidas) AS total_salidas,SUM(inventario_costo_total) AS total_inventario FROM informe;

--Vista para capturar los totales de la tabla inventario y convertirlos luego en formato moneda
CREATE VIEW totales AS SELECT SUM(valor_entradas) AS total_entradas, SUM(valor_salidas) AS total_salidas, SUM(inventario_costo_total) AS total_inventario FROM informe;

--SELECT total_entradas::money, total_salidas::money, total_inventario::money FROM totales;

-- **********************************************************************************
-- TABLA PARA TENER INFORMACIÓN DEL USUARIO QUE BORRA ALGUN DATO DE CUALQUIER TABLA *
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
-- FUNCIÓN AUDITORIA PARA TENER INFORMACION DE LAS ACTUALIZACIONES E INSERCIONES DE DATOS EN LAS TABLAS *
-- ******************************************************************************************************

CREATE FUNCTION fun_auditoria() RETURNS "trigger"
 AS $$
 DECLARE wid_respaldo tab_respaldo.id_respaldo%TYPE; --Variable para guardar numeración automática en la tabla respaldo
 BEGIN
	 IF TG_OP = 'INSERT' THEN
	     NEW.usr_insert = CURRENT_USER;		 --Identifica el usuario que usa la aplicación en el momento de la inserción
	     NEW.fec_insert = CURRENT_TIMESTAMP; --Identifica la fecha y hora del sistema en el momento de la inserción
	    RETURN NEW;
	 END IF;
	  
	 IF TG_OP = 'UPDATE' THEN
	     NEW.usr_update = CURRENT_USER;		 --Identifica el usuario que usa la aplicación en el momento de la actualización
	     NEW.fec_update = CURRENT_TIMESTAMP; --Identifica la fecha y hora del sistema en el momento de la actualización
	       RETURN NEW;
	 END IF;
	  	  
	 IF TG_OP = 'DELETE' THEN
	    SELECT MAX(id_respaldo) INTO wid_respaldo FROM tab_respaldo;
	    IF wid_respaldo IS NULL OR wid_respaldo = 0 THEN wid_respaldo = 1;
	    ELSE
	    wid_respaldo = wid_respaldo + 1; --Para llevar un número consecutivo automático sin usar AUTOINCREMENT
	    END IF;
	    INSERT INTO tab_respaldo VALUES (wid_respaldo, tg_table_name, CURRENT_USER, CURRENT_TIMESTAMP); --Tg_table_name identifica la tabla del registro que fue eliminado
	    RETURN OLD;
	 END IF;
    RETURN NULL;
 END;
$$ LANGUAGE plpgsql;


-- ******************************************************************************************************
-- FUNCIONES PARA HACER NÚMEROS CONSECUTIVOS SIN NECESIDAD DEL CAMPO SERIAL *****************************
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


--***************************************************************************************
--Función para alistar la tabla inventario cada vez que se agrega un nuevo producto

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
	
--****************************************************************************************
--Función para actualizar la tabla inventario de acuerdo con cada movimiento realizado
--****************************************************************************************

CREATE FUNCTION fun_operaciones() RETURNS "trigger"
 AS $$
DECLARE si1 	BIGINT; 	--Variable para saldo inicial en la tabla inventario
DECLARE si2 	BIGINT;		--Variable para saldo inicial en la tabla movimiento
DECLARE e1 		BIGINT;		--Variable para entrada en la tabla inventario
DECLARE e2 		BIGINT;		--Variable para entrada en la tabla movimiento
DECLARE s1 		BIGINT;		--Variable para salida en la tabla inventario
DECLARE s2 		BIGINT;		--Variable para salida en la tabla movimiento
DECLARE sum  	BIGINT;		--Variable para sumar variables entre las tablas inventario y movimiento
DECLARE wsaldo 	BIGINT;		--Variable para saldo final en la tabla inventario
DECLARE wsi 	BIGINT;		--Variable para saldo inicial en la tabla inventario
DECLARE we 		BIGINT;		--Variable para entrada en la tabla inventario
DECLARE ws 		BIGINT;		--Variable para salida en la tabla inventario
DECLARE tm 		VARCHAR;	--Variable para tipo de movimiento en la tabla movimiento

 BEGIN
--Aquí se captura el dato para el tipo de movimiento que recién se ha ingresado en la tabla movimiento
	SELECT NEW.tipo_movimiento FROM tab_movimiento WHERE id_producto=NEW.id_producto INTO tm;

--Se analiza que tipo de movimiento se ha realizado para llevar un acumulado

--Suma de saldo inicial
		IF tm='saldoinicial' THEN
		 SELECT cantidad FROM tab_movimiento WHERE tipo_movimiento='saldoinicial' and id_producto=NEW.id_producto INTO si1; 
		 SELECT saldo_inicial FROM tab_inventario WHERE id_producto=NEW.id_producto INTO si2;
		 sum=si1+si2; 
		 UPDATE tab_inventario SET (saldo_inicial)=(sum) WHERE id_producto=NEW.id_producto; 
		END IF;

--Suma de entradas a inventario

		IF tm='entrada' THEN
		 SELECT cantidad FROM tab_movimiento WHERE tipo_movimiento='entrada' and id_producto=NEW.id_producto INTO e1; 
		 SELECT entradas FROM tab_inventario WHERE id_producto=NEW.id_producto INTO e2;
			 sum=e1+e2;
		 UPDATE tab_inventario SET (entradas)=(sum) WHERE id_producto=NEW.id_producto; 
		END IF;

--Suma de las salidas de la tabla movimiento para actualizar la tabla inventario
		IF tm='salida' THEN
		 SELECT cantidad FROM tab_movimiento WHERE tipo_movimiento='salida' and id_producto=NEW.id_producto INTO s1; 
		 SELECT salidas FROM tab_inventario WHERE id_producto=NEW.id_producto INTO s2;
		 	sum=s1+s2;
		 UPDATE tab_inventario SET (salidas)=(sum) WHERE id_producto=NEW.id_producto; 
		END IF;

--Se toman los datos de saldo inicial, entradas y salidas para luego hallar el saldo final
	SELECT saldo_inicial FROM tab_inventario where id_producto=NEW.id_producto INTO wsi; 
	SELECT entradas FROM tab_inventario where id_producto=NEW.id_producto INTO we;
	SELECT salidas FROM tab_inventario where id_producto=NEW.id_producto INTO ws;

	wsaldo=(wsi+we)-(ws);

--Actualizacion de saldo final en la tabla inventario
	UPDATE tab_inventario SET(saldo_final)=(wsaldo) WHERE id_producto=NEW.id_producto; 
 
 RETURN NEW;
 END;
$$ LANGUAGE plpgsql; 

CREATE TRIGGER tri_operaciones
	AFTER INSERT ON tab_movimiento
	FOR EACH ROW EXECUTE PROCEDURE fun_operaciones(); --Este disparador permite que cada vez que haya una inserción en la tabla movimiento inmediatamente hace las operaciones de la funcion para actualizar la tabla inventario


-- ***********************************************************************************************
--FUNCIÓN PARA DETERMINAR CUANTOS PRODUCTOS HAY CON BAJO STOCK ***********************************
-- ***********************************************************************************************

CREATE FUNCTION fun_disponibilidad() RETURNS "trigger"
 AS $$
 DECLARE wdisponibilidad BIGINT; --Variable para guardar el ultimo dato que existe de saldo final de la tabla inventario
 BEGIN
	SELECT NEW.saldo_final FROM tab_inventario WHERE id_producto=NEW.id_producto INTO wdisponibilidad;
	UPDATE tab_producto SET(ind_disponibilidad)=(wdisponibilidad) WHERE id_producto=NEW.id_producto; --Aquí se actualiza la tabla producto según el saldo final que se ha hallado en las operaciones de la tabla inventario
 RETURN NEW;
 END;
$$ LANGUAGE plpgsql; 

CREATE TRIGGER tri_disponibilidad
	AFTER INSERT OR UPDATE ON tab_inventario --El disparador se activa en cada inserción o actualización de la tabla inventario
	FOR EACH ROW EXECUTE PROCEDURE fun_disponibilidad();

--La siguiente instrucción permite determinar cuáles son los productos que están por debajo del límite asignado:
-- SELECT nom_producto, ind_disponibilidad AS cantidad from tab_producto WHERE ind_disponibilidad<min_inventario;


-- ***********************************************************************************************
--INSERTS PARAR INICALIZAR EL PROGRAMA EL SCRIPT *************************************************
-- ***********************************************************************************************

INSERT INTO tab_sede (nom_sede) VALUES ('BUCARAMANGA');
INSERT INTO tab_sede (nom_sede) VALUES ('PIEDECUESTA');
INSERT INTO tab_sede (nom_sede) VALUES ('BARRANCABERMEJA');
INSERT INTO tab_sede (nom_sede) VALUES ('GIRON');
INSERT INTO tab_sede (nom_sede) VALUES ('SOGAMOSO');
INSERT INTO tab_sede (nom_sede) VALUES ('CIMITARRA');
INSERT INTO tab_sede (nom_sede) VALUES ('VALLEDUPAR');
INSERT INTO tab_sede (nom_sede) VALUES ('PUERTO WILCHES');

INSERT INTO tab_usuario (id_usuario,nom_usuario,id_rol, contraseña) VALUES (1234,'SUPERUSUARIO',TRUE,1234);

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

INSERT INTO tab_producto
(id_producto,nom_producto,nom_maquina,tipo,precio_costo,precio_venta,id_marca,id_categoria,id_proveedor) 
VALUES (20,'LIBRO MANICURE Y PEDICURE','LIBMANI','LIBRO',0,0,2,1,3);

INSERT INTO tab_producto
(id_producto,nom_producto,nom_maquina,tipo,precio_costo,precio_venta,id_marca,id_categoria,id_proveedor) 
VALUES (21,'LIBRO MAQUILLAJE ARTISTICO','LIBMAQAR','LIBRO',0,0,2,1,6);

INSERT INTO tab_producto
(id_producto,nom_producto,nom_maquina,tipo,precio_costo,precio_venta,id_marca,id_categoria,id_proveedor) 
VALUES (22,'PLANCHA A12','PLAN12','ALQUILER',0,1200,2,1,6);

INSERT INTO tab_producto
(id_producto,nom_producto,nom_maquina,tipo,precio_costo,precio_venta,id_marca,id_categoria,id_proveedor) 
VALUES (23,'SECADOR A12','PLAN12','COMODATO',0,1200,2,1,6);


INSERT INTO tab_movimiento (id_producto, fecha, factura, movimiento, tipo_movimiento, cantidad, id_sede) VALUES (1,'2-05-2016','factura1','saldoinicial','saldoinicial',100,1);
INSERT INTO tab_movimiento (id_producto, fecha, factura, movimiento, tipo_movimiento, cantidad, id_sede) VALUES (1,'2-05-2016','factura2','compra','entrada',100,1);
INSERT INTO tab_movimiento (id_producto, fecha, factura, movimiento, tipo_movimiento, cantidad, id_sede) VALUES (1,'2-05-2016','factura3','venta','salida',2,1);
INSERT INTO tab_movimiento (id_producto, fecha, factura, movimiento, tipo_movimiento, cantidad, id_sede) VALUES (2,'2-05-2016','factura1','saldoinicial','saldoinicial',10,1);
INSERT INTO tab_movimiento (id_producto, fecha, factura, movimiento, tipo_movimiento, cantidad, id_sede) VALUES (2,'2-05-2016','factura2','compra','entrada',10,1);
INSERT INTO tab_movimiento (id_producto, fecha, factura, movimiento, tipo_movimiento, cantidad, id_sede) VALUES (2,'2-05-2016','factura3','venta','salida',5,1);
INSERT INTO tab_movimiento (id_producto, fecha, factura, movimiento, tipo_movimiento, cantidad, id_sede) VALUES (4,'2-05-2016','factura3','compra','entrada',5,1);
INSERT INTO tab_movimiento (id_producto, fecha, factura, movimiento, tipo_movimiento, cantidad, id_sede) VALUES (4,'2-05-2016','factura3','venta','salida',2,1);
INSERT INTO tab_movimiento (id_producto, fecha, factura, movimiento, tipo_movimiento, cantidad, id_sede) VALUES (5,'2-05-2016','factura3','compra','entrada',500,1);

--SQL PARA VER TODAS LAS TABLAS

SELECT * FROM tab_respaldo;
SELECT * FROM tab_sede;
SELECT * FROM tab_usuario;
SELECT * FROM tab_proveedor;
SELECT * FROM tab_marca;
SELECT * FROM tab_categoria;
SELECT * FROM tab_producto;
SELECT * FROM tab_movimiento;
SELECT * FROM tab_inventario;
SELECT * FROM informe; --vista reporte