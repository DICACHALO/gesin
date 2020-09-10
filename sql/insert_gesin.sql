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

INSERT INTO tab_usuario (id_usuario,nom_usuario,id_rol, contraseña) VALUES (123456,'SUPERUSUARIO',TRUE,123456);

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

INSERT INTO tab_compra VALUES
('C 0001','17-03-2016',1,'Esta es una compra inventada');

INSERT INTO tab_compra_detalle VALUES
('C 0001',1,20,2000,2200);

SELECT * FROM tab_respaldo;
SELECT * FROM tab_sede;
SELECT * FROM tab_usuario;
SELECT * FROM tab_proveedor;
SELECT * FROM tab_marca;
SELECT * FROM tab_categoria;
SELECT * FROM tab_producto;
SELECT * FROM tab_compra;
SELECT * FROM tab_compra_detalle;