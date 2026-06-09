/*
Monthly sales volume (2010-2011)
Excluded 2009 as it only contains December data
*/

SELECT strftime('%Y-%m', InvoiceDate) AS Month, SUM(Quantity) AS total_quantity
FROM online_retail_II
WHERE strftime('%Y', InvoiceDate) != '2009'
GROUP BY Month
ORDER BY Month ASC

/* 
Annual revenue (2010-2011)
Excuded 2009 as it only contains December data
*/

SELECT strftime('%Y', InvoiceDate) AS Year, CAST(SUM(Quantity*Price)AS INTEGER) AS total_revenue
FROM online_retail_II
WHERE strftime('%Y', InvoiceDate) != '2009'
GROUP BY Year
ORDER BY Year ASC

/* 
Top export countries
*/

SELECT Country, SUM(Quantity) AS total_quantity
FROM online_retail_II
GROUP BY Country
ORDER BY total_quantity DESC
LIMIT 10

/*
Best-selling products
*/

SELECT StockCode, Description, SUM(Quantity) AS total_quantity
FROM online_retail_II
GROUP BY StockCode, Description
ORDER BY total_quantity DESC
LIMIT 5
