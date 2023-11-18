-- úkol 2 Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
WITH food_data AS (
    SELECT
        tl.payroll_year,
        AVG(CASE WHEN tl.category_code = '114201' THEN tl.price_value ELSE 0 END) AS avg_milk_price,
        AVG(CASE WHEN tl.category_code = '111301' THEN tl.price_value ELSE 0 END) AS avg_bread_price,
        tl.payroll_value
    FROM
        t_katerina_pekarova_project_SQL_primary_final tl
    WHERE
        tl.payroll_year IN (2006, 2018)
    GROUP BY
        tl.payroll_year, tl.payroll_value
)
SELECT
    d.payroll_year,
   	(ROUND(d.payroll_value / d.avg_milk_price, 2)) AS liters_of_milk,
    (ROUND(d.payroll_value / d.avg_bread_price, 2)) AS kilograms_of_bread
FROM
    food_data d
GROUP BY payroll_year 
ORDER BY
    d.payroll_year;