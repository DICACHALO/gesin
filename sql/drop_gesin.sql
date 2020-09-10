-- *******************************************************
-- INSTRUCCIONES PARA BORRAR LAS TABLAS                  *
-- *******************************************************

DROP TABLE tab_ingreso_inicial_detalle;
DROP TABLE tab_ingreso_inicial;
DROP TABLE tab_devolucion_compra_detalle;
DROP TABLE tab_devolucion_compra;
DROP TABLE tab_devolucion_venta_detalle;
DROP TABLE tab_devolucion_venta;
DROP TABLE tab_venta_detalle;
DROP TABLE tab_venta;
DROP TABLE tab_compra_detalle;
DROP TABLE tab_compra;
DROP TABLE tab_remision_detalle;
DROP TABLE tab_remision;
DROP TABLE tab_inventario;
DROP TABLE tab_producto;
DROP TABLE tab_usuario;
DROP TABLE tab_sede;
DROP TABLE tab_respaldo;
DROP TABLE tab_alquilerproducto;
DROP TABLE tab_productoencomodato;
DROP TABLE tab_libro;
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
DROP FUNCTION fun_id_devolucionv() CASCADE;
DROP FUNCTION fun_id_devolucionc() CASCADE;
DROP FUNCTION fun_id_ingreso_inicial() CASCADE;
DROP FUNCTION fun_id_productoencomodato() CASCADE;
DROP FUNCTION fun_id_libro() CASCADE;