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

CREATE TABLE tab_compra
(
 id_compra				VARCHAR(10)					NOT NULL,	  --El usuario ingresa el número de radicado de la compra
 fecha_compra			DATE						NOT NULL,
 id_proveedor			INTEGER						NOT NULL,
 observaciones 			VARCHAR(50)						NULL,
 usr_insert    			VARCHAR(30)                 NOT NULL,	  --Aquí comienza la sección de auditoría //Usuario que inserta nuevo dato
 fec_insert    			TIMESTAMP WITHOUT TIME ZONE NOT NULL,     --Fecha de inserción
 usr_update    			VARCHAR(30),  							  --Usuario que actualiza
 fec_update    			TIMESTAMP WITHOUT TIME ZONE,   			  --Fecha de actualización
 PRIMARY KEY(id_compra),
 FOREIGN KEY(id_proveedor) REFERENCES tab_proveedor(id_proveedor)
);

CREATE TABLE tab_compra_detalle
(
 id_compra				VARCHAR(10)					NOT NULL,	  --El usuario ingresa el número de radicado de la compra
 id_producto 			INTEGER		 				NOT NULL,	  --Número de identificación del producto
 cantidad				SMALLINT					NOT NULL,	  --Número de productos comprados
 precio_costo			BIGINT						NOT NULL,
 precio_costo_IVA 		BIGINT						NOT NULL,
 usr_insert    			VARCHAR(30)                 NOT NULL,	  --Aquí comienza la sección de auditoría //Usuario que inserta nuevo dato
 fec_insert    			TIMESTAMP WITHOUT TIME ZONE NOT NULL,     --Fecha de inserción
 usr_update    			VARCHAR(30),  							  --Usuario que actualiza
 fec_update    			TIMESTAMP WITHOUT TIME ZONE,   			  --Fecha de actualización
 PRIMARY KEY(id_compra, id_producto),
 FOREIGN KEY(id_compra) REFERENCES tab_compra(id_compra),
 FOREIGN KEY(id_producto) REFERENCES tab_producto(id_producto)
);

CREATE TABLE tab_ingreso_inicial
(
 id_ingreso_inicial		INTEGER						NOT NULL,		--Asignado por el sistema
 fecha_si 				DATE		 				NOT NULL,
 observaciones			VARCHAR(50)						NULL,
 usr_insert         	VARCHAR(30)                 NOT NULL,	 	--Aquí comienza la sección de auditoría //Usuario que inserta nuevo dato
 fec_insert         	TIMESTAMP WITHOUT TIME ZONE NOT NULL,    	--Fecha de inserción
 usr_update         	VARCHAR(30),  							 	--Usuario que actualiza
 fec_update         	TIMESTAMP WITHOUT TIME ZONE,   				--Fecha de actualización
 PRIMARY KEY (id_ingreso_inicial)
);

CREATE TABLE tab_ingreso_inicial_detalle
(
 id_ingreso_inicial		INTEGER						NOT NULL,		--Asignado por el sistema
 id_producto			INTEGER						NOT NULL,
 cantidad 				INTEGER		 	  NOT NULL DEFAULT 0,
 usr_insert         	VARCHAR(30)                 NOT NULL,	 	--Aquí comienza la sección de auditoría //Usuario que inserta nuevo dato
 fec_insert         	TIMESTAMP WITHOUT TIME ZONE NOT NULL,    	--Fecha de inserción
 usr_update         	VARCHAR(30),  							 	--Usuario que actualiza
 fec_update         	TIMESTAMP WITHOUT TIME ZONE,   				--Fecha de actualización
 PRIMARY KEY(id_ingreso_inicial, id_producto),
 FOREIGN KEY(id_ingreso_inicial) REFERENCES tab_ingreso_inicial(id_ingreso_inicial), 
 FOREIGN KEY(id_producto) REFERENCES tab_producto(id_producto)
);

CREATE TABLE tab_remision
(
 id_remision			VARCHAR(10)					NOT NULL,		--Asignado por el usuario
 fecha_remision			DATE						NOT NULL,
 id_sede			INTEGER						NOT NULL,
 observaciones 			VARCHAR(50)						NULL,
 usr_insert    			VARCHAR(30)                 NOT NULL,	   --Aquí comienza la sección de auditoría //Usuario que inserta nuevo dato
 fec_insert    			TIMESTAMP WITHOUT TIME ZONE NOT NULL,      --Fecha de inserción
 usr_update    			VARCHAR(30),  							   --Usuario que actualiza
 fec_update    			TIMESTAMP WITHOUT TIME ZONE,   			   --Fecha de actualización
 PRIMARY KEY(id_remision),
 FOREIGN KEY(id_sede) REFERENCES tab_sede(id_sede)
);

CREATE TABLE tab_remision_detalle
(
 id_remision			VARCHAR(10)					NOT NULL,	  --El usuario ingresa el número de radicado de la remision
 id_producto 			INTEGER		 				NOT NULL,	  --Número de identificación del producto
 cantidad				SMALLINT					NOT NULL,	  --Número de productos comprados
 usr_insert    			VARCHAR(30)                 NOT NULL,	  --Aquí comienza la sección de auditoría //Usuario que inserta nuevo dato
 fec_insert    			TIMESTAMP WITHOUT TIME ZONE NOT NULL,     --Fecha de inserción
 usr_update    			VARCHAR(30),  							  --Usuario que actualiza
 fec_update    			TIMESTAMP WITHOUT TIME ZONE,   			  --Fecha de actualización
 PRIMARY KEY(id_remision, id_producto),
 FOREIGN KEY(id_remision) REFERENCES tab_remision(id_remision),
 FOREIGN KEY(id_producto) REFERENCES tab_producto(id_producto)
);

CREATE TABLE tab_venta
(
 id_venta				VARCHAR(10)					NOT NULL,	  --El usuario ingresa el número de la factura 
 fecha_venta			DATE						NOT NULL,
 observaciones 			VARCHAR(50)						NULL,
 usr_insert    			VARCHAR(30)                 NOT NULL,	  --Aquí comienza la sección de auditoría //Usuario que inserta nuevo dato
 fec_insert    			TIMESTAMP WITHOUT TIME ZONE NOT NULL,     --Fecha de inserción
 usr_update    			VARCHAR(30),  							  --Usuario que actualiza
 fec_update    			TIMESTAMP WITHOUT TIME ZONE,   			  --Fecha de actualización
 PRIMARY KEY (id_venta)
);

CREATE TABLE tab_venta_detalle
(
 id_venta				VARCHAR(10)					NOT NULL,
 id_producto 			INTEGER		 				NOT NULL,	  --Número de identificación del producto
 cantidad				SMALLINT					NOT NULL,	  --Número de productos comprados
 precio_venta			BIGINT						NOT NULL,
 usr_insert    			VARCHAR(30)                 NOT NULL,	  --Aquí comienza la sección de auditoría //Usuario que inserta nuevo dato
 fec_insert    			TIMESTAMP WITHOUT TIME ZONE NOT NULL,     --Fecha de inserción
 usr_update    			VARCHAR(30),  							  --Usuario que actualiza
 fec_update    			TIMESTAMP WITHOUT TIME ZONE,   			  --Fecha de actualización
 PRIMARY KEY (id_venta, id_producto),
 FOREIGN KEY (id_venta) REFERENCES tab_venta(id_venta),
 FOREIGN KEY(id_producto) REFERENCES tab_producto(id_producto)
);

CREATE TABLE tab_devolucion_venta
(
 id_devolucionv			INTEGER 					NOT NULL,	  --Número de identificación de la devolución asignado automáticamente por el sistema
 id_venta				VARCHAR(10)					NOT NULL,	  --El usuario ingresa el número de la factura
 fecha_devolucionv		DATE						NOT NULL,
 observaciones 			VARCHAR(50)						NULL,
 usr_insert    			VARCHAR(30)                 NOT NULL,	  --Aquí comienza la sección de auditoría //Usuario que inserta nuevo dato
 fec_insert    			TIMESTAMP WITHOUT TIME ZONE NOT NULL,     --Fecha de inserción
 usr_update    			VARCHAR(30),  							  --Usuario que actualiza
 fec_update    			TIMESTAMP WITHOUT TIME ZONE,   			  --Fecha de actualización
 PRIMARY KEY (id_devolucionv),
 FOREIGN KEY (id_venta) REFERENCES tab_venta (id_venta)
);

CREATE TABLE tab_devolucion_venta_detalle
(
 id_devolucionv			INTEGER						NOT NULL,
 id_producto 			INTEGER		 				NOT NULL,	  --Número de identificación del producto
 cantidad				SMALLINT					NOT NULL,	  --Número de productos comprados
 usr_insert    			VARCHAR(30)                 NOT NULL,	  --Aquí comienza la sección de auditoría //Usuario que inserta nuevo dato
 fec_insert    			TIMESTAMP WITHOUT TIME ZONE NOT NULL,     --Fecha de inserción
 usr_update    			VARCHAR(30),  							  --Usuario que actualiza
 fec_update    			TIMESTAMP WITHOUT TIME ZONE,   			  --Fecha de actualización
 PRIMARY KEY (id_devolucionv, id_producto),
 FOREIGN KEY (id_devolucionv) REFERENCES tab_devolucion_venta (id_devolucionv),
 FOREIGN KEY(id_producto) REFERENCES tab_producto(id_producto)
);

CREATE TABLE tab_devolucion_compra
(
id_devolucionc			INTEGER 					NOT NULL,	  --Número de identificación de la devolución asignado automáticamente
id_compra				VARCHAR(10)					NOT NULL,	  --El usuario ingresa el número de la factura
fecha_devolucionc		DATE						NOT NULL,
 observaciones 			VARCHAR(50)						NULL,
 usr_insert    			VARCHAR(30)                 NOT NULL,	  --Aquí comienza la sección de auditoría //Usuario que inserta nuevo dato
 fec_insert    			TIMESTAMP WITHOUT TIME ZONE NOT NULL,     --Fecha de inserción
 usr_update    			VARCHAR(30),  							  --Usuario que actualiza
 fec_update    			TIMESTAMP WITHOUT TIME ZONE,   			  --Fecha de actualización
 PRIMARY KEY(id_devolucionc),
 FOREIGN KEY (id_compra) REFERENCES tab_compra (id_compra)
);

CREATE TABLE tab_devolucion_compra_detalle
(
 id_devolucionc			INTEGER						NOT NULL,	  --Número de identificación de la devolución asignado automáticamente
 id_producto 			INTEGER		 				NOT NULL,	  --Número de identificación del producto
 cantidad				SMALLINT					NOT NULL,	  --Número de productos comprados
 usr_insert    			VARCHAR(30)                 NOT NULL,	  --Aquí comienza la sección de auditoría //Usuario que inserta nuevo dato
 fec_insert    			TIMESTAMP WITHOUT TIME ZONE NOT NULL,     --Fecha de inserción
 usr_update    			VARCHAR(30),  							  --Usuario que actualiza
 fec_update    			TIMESTAMP WITHOUT TIME ZONE,   			  --Fecha de actualización
 PRIMARY KEY(id_devolucionc, id_producto),
 FOREIGN KEY(id_devolucionc) REFERENCES tab_devolucion_compra(id_devolucionc),
 FOREIGN KEY(id_producto) REFERENCES tab_producto(id_producto)
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

CREATE TABLE tab_libro
(
 id_libro				INTEGER						NOT NULL,		--Identificación de la marca asignada automáticamente por el sistema
 nom_libro				VARCHAR(50)					NOT NULL,		--Nombre de la categoria. Puede ser: MAQUILLAJE, CUIDADO ESTÉTICO DE MANOS Y PIES, TINTES, BIOSEGUIRIDAD...
 nom_maquina			VARCHAR(12)	 				NOT NULL,		--Nombre del producto en la máquina registradora
 cantidad 				INTEGER		 	  NOT NULL DEFAULT 0, 		--Existencias del producto en bodega
 usr_insert        	 	VARCHAR(30)                 NOT NULL,	 	--Aquí comienza la sección de auditoría //Usuario que inserta nuevo dato
 fec_insert         	TIMESTAMP WITHOUT TIME ZONE NOT NULL,    	--Fecha de inserción
 usr_update         	VARCHAR(30),  							 	--Usuario que actualiza
 fec_update         	TIMESTAMP WITHOUT TIME ZONE,   			 	--Fecha de actualización
 PRIMARY KEY(id_libro)
);

CREATE TABLE tab_alquilerproducto
(
 id_producto 			INTEGER		 				NOT NULL,	 	--Número de identificación del producto asignado por el usuario
 nom_prod				VARCHAR(30)	 				NOT NULL,	 	--Nombre del producto para alquiler
 nom_maquina			VARCHAR(12)	 				NOT NULL,		--Nombre del producto en la máquina registradora
 precio_alquiler		INTEGER		 	  NOT NULL DEFAULT 0,
 id_marca				INTEGER						NOT NULL,
 id_categoria			INTEGER						NOT NULL,
 id_proveedor       	INTEGER        				NOT NULL,
 cantidad 				INTEGER		 	  NOT NULL DEFAULT 0, 		--Existencias del producto en bodega
 usr_insert         	VARCHAR(30)                 NOT NULL,	 	--Aquí comienza la sección de auditoría //Usuario que inserta nuevo dato
 fec_insert         	TIMESTAMP WITHOUT TIME ZONE NOT NULL,    	--Fecha de inserción
 usr_update         	VARCHAR(30),  							 	--Usuario que actualiza
 fec_update         	TIMESTAMP WITHOUT TIME ZONE,   				--Fecha de actualización
 PRIMARY KEY(id_producto),
 FOREIGN KEY(id_marca) REFERENCES tab_marca(id_marca),
 FOREIGN KEY(id_categoria) REFERENCES tab_categoria(id_categoria),
 FOREIGN KEY(id_proveedor) REFERENCES tab_proveedor(id_proveedor)
);

CREATE TABLE tab_productoencomodato									--Productos que se entregan en forma de préstamo a las estudiantes o docentes
(
 id_productoencomodato	INTEGER		 				NOT NULL,	 	--Número de identificación del producto asignado por el usuario
 nom_prod				VARCHAR(30)	 				NOT NULL,	 	--Nombre del producto para alquiler
 id_marca				INTEGER						NOT NULL,
 id_categoria			INTEGER						NOT NULL,
 id_proveedor       	INTEGER        				NOT NULL,
 cantidad 				INTEGER		 	  NOT NULL DEFAULT 0, 		--Existencias del producto en bodega
 observaciones 			VARCHAR(50)						NULL,
 usr_insert         	VARCHAR(30)                 NOT NULL,	 	--Aquí comienza la sección de auditoría //Usuario que inserta nuevo dato
 fec_insert         	TIMESTAMP WITHOUT TIME ZONE NOT NULL,    	--Fecha de inserción
 usr_update         	VARCHAR(30),  							 	--Usuario que actualiza
 fec_update         	TIMESTAMP WITHOUT TIME ZONE,   				--Fecha de actualización
 PRIMARY KEY(id_productoencomodato),
 FOREIGN KEY(id_marca) REFERENCES tab_marca(id_marca),
 FOREIGN KEY(id_categoria) REFERENCES tab_categoria(id_categoria),
 FOREIGN KEY(id_proveedor) REFERENCES tab_proveedor(id_proveedor)
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

CREATE FUNCTION fun_id_devolucionv() RETURNS "trigger"
 AS $$
 DECLARE wid SMALLINT;
 BEGIN
	SELECT MAX(id_devolucionv) FROM tab_devolucion_venta INTO wid;
	IF wid IS NULL OR wid = 0 THEN wid =1;
	NEW.id_devolucionv=wid;
	RETURN NEW;
	ELSE
	wid=wid+1;
	NEW.id_devolucionv=wid;
	RETURN NEW;
	END IF;
 RETURN NULL;
 END;
$$ LANGUAGE plpgsql; 

CREATE FUNCTION fun_id_devolucionc() RETURNS "trigger"
 AS $$
 DECLARE wid SMALLINT;
 BEGIN
	SELECT MAX(id_devolucionc) FROM tab_devolucion_compra INTO wid;
	IF wid IS NULL OR wid = 0 THEN wid =1;
	NEW.id_devolucionc=wid;
	RETURN NEW;
	ELSE
	wid=wid+1;
	NEW.id_devolucionc=wid;
	RETURN NEW;
	END IF;
 RETURN NULL;
 END;
$$ LANGUAGE plpgsql; 

CREATE FUNCTION fun_id_ingreso_inicial() RETURNS "trigger"
 AS $$
 DECLARE wid SMALLINT;
 BEGIN
	SELECT MAX(id_ingreso_inicial) FROM tab_ingreso_inicial INTO wid;
	IF wid IS NULL OR wid = 0 THEN wid =1;
	NEW.id_ingreso_inicial=wid;
	RETURN NEW;
	ELSE
	wid=wid+1;
	NEW.id_ingreso_inicial=wid;
	RETURN NEW;
	END IF;
 RETURN NULL;
 END;
$$ LANGUAGE plpgsql; 

CREATE FUNCTION fun_id_productoencomodato() RETURNS "trigger"
 AS $$
 DECLARE wid SMALLINT;
 BEGIN
	SELECT MAX(id_productoencomodato) FROM tab_productoencomodato INTO wid;
	IF wid IS NULL OR wid = 0 THEN wid =1;
	NEW.id_productoencomodato=wid;
	RETURN NEW;
	ELSE
	wid=wid+1;
	NEW.id_productoencomodato=wid;
	RETURN NEW;
	END IF;
 RETURN NULL;
 END;
$$ LANGUAGE plpgsql; 

CREATE FUNCTION fun_id_libro() RETURNS "trigger"
 AS $$
 DECLARE wid SMALLINT;
 BEGIN
	SELECT MAX(id_libro) FROM tab_libro INTO wid;
	IF wid IS NULL OR wid = 0 THEN wid =1;
	NEW.id_libro=wid;
	RETURN NEW;
	ELSE
	wid=wid+1;
	NEW.id_libro=wid;
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
 BEFORE INSERT OR UPDATE ON tab_inventario
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoria
 BEFORE INSERT OR UPDATE ON tab_remision
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoria
 BEFORE INSERT OR UPDATE ON tab_remision_detalle
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoria
 BEFORE INSERT OR UPDATE ON tab_compra
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoria
 BEFORE INSERT OR UPDATE ON tab_compra_detalle
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoria
 BEFORE INSERT OR UPDATE ON tab_venta
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoria
 BEFORE INSERT OR UPDATE ON tab_venta_detalle
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoria
 BEFORE INSERT OR UPDATE ON tab_devolucion_venta
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoria
 BEFORE INSERT OR UPDATE ON tab_devolucion_venta_detalle
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoria
 BEFORE INSERT OR UPDATE ON tab_devolucion_compra
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoria
 BEFORE INSERT OR UPDATE ON tab_devolucion_compra_detalle
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoria
 BEFORE INSERT OR UPDATE ON tab_ingreso_inicial
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoria
 BEFORE INSERT OR UPDATE ON tab_ingreso_inicial_detalle
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoria
 BEFORE INSERT OR UPDATE ON tab_alquilerproducto
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoria
 BEFORE INSERT OR UPDATE ON tab_productoencomodato
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoria
 BEFORE INSERT OR UPDATE ON tab_libro
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
 AFTER DELETE ON tab_inventario
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoriadelete
 AFTER DELETE ON tab_remision
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoriadelete
 AFTER DELETE ON tab_remision_detalle
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoriadelete
 AFTER DELETE ON tab_compra
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoriadelete
 AFTER DELETE ON tab_compra_detalle
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoriadelete
 AFTER DELETE ON tab_venta
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoriadelete
 AFTER DELETE ON tab_venta_detalle
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoriadelete
 AFTER DELETE ON tab_devolucion_venta
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoriadelete
 AFTER DELETE ON tab_devolucion_venta_detalle
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoriadelete
 AFTER DELETE ON tab_devolucion_compra
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoriadelete
 AFTER DELETE ON tab_devolucion_compra_detalle
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoriadelete
 AFTER DELETE ON tab_ingreso_inicial
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoriadelete
 AFTER DELETE ON tab_ingreso_inicial_detalle
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoriadelete
 AFTER DELETE ON tab_alquilerproducto
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoriadelete
 AFTER DELETE ON tab_productoencomodato
 FOR EACH ROW EXECUTE PROCEDURE fun_auditoria();

CREATE TRIGGER tri_auditoriadelete
 AFTER DELETE ON tab_libro
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

CREATE TRIGGER tri_id_inventario
	BEFORE INSERT ON tab_inventario
	FOR EACH ROW EXECUTE PROCEDURE fun_id_inventario();

CREATE TRIGGER tri_id_devolucionv
	BEFORE INSERT ON tab_devolucion_venta
	FOR EACH ROW EXECUTE PROCEDURE fun_id_devolucionv();

CREATE TRIGGER tri_id_devolucionc
	BEFORE INSERT ON tab_devolucion_compra
	FOR EACH ROW EXECUTE PROCEDURE fun_id_devolucionc();

CREATE TRIGGER tri_id_ingreso_inicial
	BEFORE INSERT ON tab_ingreso_inicial
	FOR EACH ROW EXECUTE PROCEDURE fun_id_ingreso_inicial();

CREATE TRIGGER tri_id_ingreso_inicial
	BEFORE INSERT ON tab_productoencomodato
	FOR EACH ROW EXECUTE PROCEDURE fun_id_productoencomodato();

CREATE TRIGGER tri_id_ingreso_inicial
	BEFORE INSERT ON tab_libro
	FOR EACH ROW EXECUTE PROCEDURE fun_id_libro();