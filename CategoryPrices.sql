WITH CategorizedProducts AS (
	SELECT ProductID, ps.Name as CategoryName
	FROM Production.Product p
	INNER JOIN Production.ProductSubcategory ps
		ON p.ProductSubcategoryID = ps.ProductSubcategoryID
)

-- zakladam, ¿e "wartoœæ sprzeda¿y dla poszczególnych kategorii" to srednia dla danych kategorii
SELECT CategoryName, AVG(OrderQty * (UnitPrice - UnitPriceDiscount)) AS ProductRevenue 
FROM CategorizedProducts cp
INNER JOIN Sales.SalesOrderDetail s1
	ON s1.ProductID = cp.ProductID
INNER JOIN Sales.SalesOrderHeader s2
	ON s1.SalesOrderID = s2.SalesOrderID
GROUP BY CategoryName
ORDER BY CategoryName