 -- úkol 4 Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
WITH avg_yearly AS (
  SELECT
    payroll_year,
    AVG(payroll_value) AS avg_payroll,
    AVG(price_value) AS avg_price
  FROM
    t_katerina_pekarova_project_SQL_primary_final
  GROUP BY
    payroll_year
),
diff_yearly AS (
  SELECT
    avgy.payroll_year,
    (avgy.avg_price - LAG(avgy.avg_price) OVER (ORDER BY avgy.payroll_year)) / LAG(avgy.avg_price) OVER (ORDER BY avgy.payroll_year) * 100 AS price_change_percentage,
    (avgy.avg_payroll - LAG(avgy.avg_payroll) OVER (ORDER BY avgy.payroll_year)) / LAG(avgy.avg_payroll) OVER (ORDER BY avgy.payroll_year) * 100 AS payroll_change_percentage
  FROM
    avg_yearly avgy
)
SELECT
  diffy.payroll_year,
  round(diffy.price_change_percentage, 4) AS price_change_perc,
  round(diffy.payroll_change_percentage, 4) AS payroll_change_perc,
  CASE WHEN (diffy.price_change_percentage - diffy.payroll_change_percentage) > 10 THEN 'Yes' ELSE 'No' END AS difference_over_ten_perc
FROM
  diff_yearly diffy
WHERE
  diffy.payroll_change_percentage IS NOT NULL;