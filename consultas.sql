--Clientes que compraron $100.000 en los últimos 60 días
SELECT *
  FROM CLIENTE C JOIN FACTURA F ON C.dcto = F.dctoCliente
WHERE F.totalFactura = 100000 AND F.fecha BETWEEN DATEADD(DAY,-60,GETDATE()) AND GETDATE();
 

--100 productos más vendidos en los últimos 30 días
-- Se hace para los 100 repuestos mas utilizados en mantenimientos.

SELECT TOP 100 REPUESTO.nombreRepuesto, SUM(DETALLE_REPUESTOS.cantidad) AS cantidad
  FROM REPUESTO R JOIN DETALLE_REPUESTOS DR ON R.IdRepuesto = DR.IdRepuesto
	JOIN MANTENIMIENTO M ON M.IdMantenimiento = DR.IdMantenimiento
	JOIN MANTENIMIENTO_FACTURA MF ON M.IdMantenimiento = MF.IdMantenimiento
	JOIN FACTURA F ON F.IdFactura = MF.IdFactura
WHERE F.fecha BETWEEN DATEADD(DAY,-30,GETDATE()) AND GETDATE();

GROUP BY R.IdRepuesto
ORDER BY SUM(DETALLE_REPUESTOS.cantidad) DESC;


--tiendas que han vendido más de 100 UND del producto 100 en los últimos 60 días.
-- no hay tabla de tiendas


--clientes con más de un mantenimento en últimos 30 días
SELECT C.nombre1, C.nombre2, C.apellido1, C.apellido2, C.tipoDcto, C.dcto, 
  FROM CLIENTE C JOIN FACTURA F ON C.dcto = F.dctoCliente
	JOIN MANTENIMIENTO_FACTURA MF ON F.IdFactura = MF.IdFactura
	JOIN MANTENIMIENTO M ON M.IdMantenimiento = MF.IdMantenimiento
	
WHERE M.fecha BETWEEN DATEADD(DAY,-30,GETDATE()) AND GETDATE();

GROUP  BY C.dcto
HAVING COUNT(M.dcto)>1


-- Procedimiento que reste la cantidad de productos del inventario de las tiendas cada que se presente una venta.

IF OBJECT_ID('sp_RESTAR_STOCK_REPUESTO') IS NOT NULL
BEGIN 
DROP PROC sp_RESTAR_STOCK_REPUESTO
END 
GO
CREATE PROC sp_RESTAR_STOCK_REPUESTO
	@cantidad int,
	@IdRepuesto int,
AS 
BEGIN 
 
UPDATE REPUESTO
SET 
	cantidad = cantidad - @cantidad
	
WHERE  IdRepuesto = @IdRepuesto
END
GO
