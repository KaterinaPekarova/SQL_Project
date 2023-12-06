-- úkol 2 Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
WITH selected_years AS (
    SELECT
        payroll_year,
        SUM(payroll_value) AS total_payroll,
        AVG(CASE WHEN category_code = '114201' THEN price_value END) AS avg_milk_price,
        AVG(CASE WHEN category_code = '111301' THEN price_value END) AS avg_bread_price
    FROM
        t_katerina_pekarova_project_SQL_primary_final
    WHERE
        payroll_year IN (2006, 2018)
    GROUP BY
        payroll_year
)
SELECT
    sy.payroll_year,
    SUM(sy.total_payroll) AS total_payroll,
    ROUND(AVG(sy.avg_milk_price), 2) AS avg_milk_price,
    ROUND(AVG(sy.avg_bread_price), 2) AS avg_bread_price,
    ROUND(SUM(sy.total_payroll) / AVG(sy.avg_milk_price), 2) AS liters_of_milk,
    ROUND(SUM(sy.total_payroll) / AVG(sy.avg_bread_price), 2) AS kilograms_of_bread
FROM
    selected_years sy
GROUP BY
    sy.payroll_year
ORDER BY
    sy.payroll_year;
