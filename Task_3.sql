 -- úkol 3 Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
WITH data_yearly AS (
    SELECT 
        category_name,
        price_year_from,
        price_value
    FROM 
        t_katerina_pekarova_project_SQL_primary_final
    WHERE 
        price_year_from IN (
            (SELECT MIN(price_year_from) FROM t_katerina_pekarova_project_SQL_primary_final),
            (SELECT MAX(price_year_from) FROM t_katerina_pekarova_project_SQL_primary_final)
        )
)
SELECT 
    category_name,
    ROUND(AVG((price_value / lag_price) - 1), 4) AS avg_percent_increase
FROM 
    (
        SELECT 
            category_name,
            price_year_from,
            price_value,
            LAG(price_value) OVER (PARTITION BY category_name ORDER BY price_year_from) AS lag_price
        FROM 
            data_yearly
    ) AS lagged_prices
GROUP BY 
    category_name
ORDER BY 
    avg_percent_increase ASC;