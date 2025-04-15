SELECT *
FROM orders;

SELECT *
FROM details;

-- Monthly Revenue and Order Volume ---

SELECT 
	  EXTRACT(YEAR FROM STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) AS Year,
      EXTRACT(MONTH FROM STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) AS Month,
      SUM(d.Amount) AS Revenue,
      COUNT(DISTINCT o.`Order ID`) AS Order_Volume
FROM orders o
JOIN details d
ON o.`Order ID` = d.`Order ID`    
GROUP BY 
     EXTRACT(YEAR FROM STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')),
     EXTRACT(MONTH FROM STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) 
ORDER BY Year, Month;


-- Top 5 months by revenue--

SELECT 
	  EXTRACT(YEAR FROM STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) AS Year,
      DATE_FORMAT(STR_TO_DATE(o.`Order Date`, '%d-%m-%Y'), '%M') AS Month,
      SUM(d.Amount) AS Revenue,
      COUNT(DISTINCT o.`Order ID`) AS Order_Volume
FROM orders o
JOIN details d
ON o.`Order ID` = d.`Order ID`    
GROUP BY 
     EXTRACT(YEAR FROM STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')),
      DATE_FORMAT(STR_TO_DATE(o.`Order Date`, '%d-%m-%Y'), '%M') 
ORDER BY Revenue DESC
LIMIT 5;


