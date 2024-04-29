SELECT *
FROM sales_data
WHERE EXTRACT(MONTH FROM sale_date) = 1
  AND EXTRACT(YEAR FROM sale_date) = 23;

----------------------------
SELECT EXTRACT(YEAR FROM sale_date) AS year,
       EXTRACT(MONTH FROM sale_date) AS month,
       SUM(sale_amount) AS total_sale_amount
FROM sales_data
WHERE EXTRACT(YEAR FROM sale_date) = 2023
GROUP BY EXTRACT(YEAR FROM sale_date), EXTRACT(MONTH FROM sale_date)
ORDER BY year, month;
-----------------------------
SELECT salesperson_id, SUM(sale_amount) AS total_sale_amount
FROM (
    SELECT salesperson_id, sale_amount
    FROM sales_data
    WHERE region_id = 1 AND EXTRACT(YEAR FROM sale_date) = 2023
) AS region_sales
GROUP BY salesperson_id
ORDER BY total_sale_amount DESC
LIMIT 3;