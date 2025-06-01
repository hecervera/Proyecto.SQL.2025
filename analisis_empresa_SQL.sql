/** Actividad final SQL **/

-- Llamar a la base de datos
use db_empresa;

-- 1.	Total gastado por cada cliente. 
-- Mostrar el nombre de los clientes y el total que ha gastado en todas sus compras.

-- Se eligieron las columnnas "NOMBRE" de la tabla "CLIENTE" y "TOTAL_VENTA" de la tabla "VENTA".

SELECT 
	C.NOMBRE Nombre_cliente, ROUND(SUM(V.TOTAL_VENTA)) Total_gastado
FROM 
	CLIENTE C
INNER JOIN 
	VENTA V ON C.ID_CLIENTE = V.CLIENTE_ID_CLIENTE
GROUP BY 
	Nombre_Cliente
ORDER BY 
	Total_Gastado DESC;

-- 2.	Clientes con gasto superior al promedio
-- Mostrar los nombres de los clientes cuyo gasto total 
-- es mayor al promedio del total gastado por todos los clientes.

-- Se uso el mismo código anterior y se añadió un flitro mediante 
-- una subconsulta en donde se comparó el total 
-- gastado de cada cliente con el promedio 
-- de los gastos totales de los clientes.

SELECT 
	C.NOMBRE Nombre_cliente, ROUND(SUM(V.TOTAL_VENTA)) Total_gastado
FROM 
	CLIENTE C
INNER JOIN 
	VENTA V ON C.ID_CLIENTE = V.CLIENTE_ID_CLIENTE
GROUP BY 
	Nombre_Cliente
HAVING 
	Total_gastado > (SELECT 
							AVG(V.TOTAL_VENTA) Total_gastado
						FROM 
							CLIENTE C
						INNER JOIN 
							VENTA V ON C.ID_CLIENTE = V.CLIENTE_ID_CLIENTE)
ORDER BY 
		Total_gastado DESC;

-- Adicionalemnte, se sacó por aparte el promedio del total gastado 
-- de los clientes, con el fin de comparar con los datos 
-- arrojados en la tabla anterior.

SELECT 
	ROUND(AVG(TOTAL_VENTA))
FROM
	VENTA;

-- 3.	Producto más vendido por cantidad total
-- Nombre y cantidad del producto que más unidades ha vendido.

-- Se trabajó con las columnas "NOMBRE" de la tabla "PRODUCTO" y "CANTIDAD" de la tabla "DETALLE_VENTA"
SELECT 
	P.NOMBRE Nombre_producto, SUM(DV.CANTIDAD) Cantidad_vendida
FROM 
	PRODUCTO P
INNER JOIN 
	DETALLE_VENTA DV ON P.ID_PRODUCTO = DV.PRODUCTO_ID_PRODUCTO
GROUP BY
	Nombre_producto
ORDER BY 
	Cantidad_vendida DESC
LIMIT 1;
	
-- 4.	Colaborador con más ventas en dinero
-- Nombre y total del colaborador que ha vendido más dinero en total.

SELECT C.NOMBRE Nombre_colaborador, ROUND(SUM(TOTAL_VENTA)) as Total_vendido
FROM
	COLABORADOR C
INNER JOIN 
	VENTA V ON C.ID_COLABORADOR = V.COLABORADOR_ID_COLABORADOR
GROUP BY
	Nombre_colaborador
ORDER BY 
    Total_vendido DESC
LIMIT 1;

-- 5.	Productos más vendidos y con mayor precio
-- Mostrar los productos que se han vendido en más de 3 ventas distintas y que su precio sea superior a $100.000.

SELECT 
    P.NOMBRE AS Nombre_Producto,
    COUNT(DISTINCT DV.VENTA_ID_VENTA) AS Ventas_distintas,
    SUM(DV.CANTIDAD) AS Cantidad_vendida,
    round(SUM(DV.SUB_TOTAL)) Total
FROM 
    PRODUCTO P
INNER JOIN 
    DETALLE_VENTA DV ON P.ID_PRODUCTO = DV.PRODUCTO_ID_PRODUCTO
WHERE 
    P.PRECIO > 100000
GROUP BY 
    P.NOMBRE
HAVING 
    COUNT(DISTINCT DV.VENTA_ID_VENTA) > 3
ORDER BY 
    Cantidad_vendida DESC;








