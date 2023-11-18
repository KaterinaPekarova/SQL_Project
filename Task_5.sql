-- úkol 5 Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?
WITH combi_data AS (
    SELECT
        p.payroll_year,
        AVG(p.payroll_value) AS avg_payroll,
        AVG(p.price_value) AS avg_price,
        s.GDP
    FROM
        t_katerina_pekarova_project_SQL_primary_final p
    JOIN
        t_katerina_pekarova_project_SQL_secondary_final s ON p.payroll_year = s.year
    GROUP BY
        p.payroll_year, s.GDP
)
SELECT
    cd.payroll_year,
    cd.GDP,
    LAG(cd.GDP) OVER (ORDER BY cd.payroll_year) AS lag_GDP,
    ROUND((cd.GDP - LAG(cd.GDP) OVER (ORDER BY cd.payroll_year)) / LAG(cd.GDP) OVER (ORDER BY cd.payroll_year) * 100, 4) AS GDP_change_percent,
    ROUND((cd.avg_price - LAG(cd.avg_price) OVER (ORDER BY cd.payroll_year)) / LAG(cd.avg_price) OVER (ORDER BY cd.payroll_year) * 100, 4) AS price_change_percent,
    ROUND((cd.avg_payroll - LAG(cd.avg_payroll) OVER (ORDER BY cd.payroll_year)) / LAG(cd.avg_payroll) OVER (ORDER BY cd.payroll_year) * 100, 4) AS payroll_change_percent
FROM
    combi_data cd
ORDER BY
    cd.payroll_year;