-- úkol 1 Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
SELECT
  industry_branch_name,
  MIN(payroll_year) AS min_year,
  MAX(payroll_year) AS max_year,
  AVG(CASE WHEN payroll_year = MINYear THEN payroll_value END) AS avg_payroll_min_year,
  AVG(CASE WHEN payroll_year = MAXYear THEN payroll_value END) AS avg_payroll_max_year,
  CASE WHEN AVG(CASE WHEN payroll_year = MINYear THEN payroll_value END) <
            AVG(CASE WHEN payroll_year = MAXYear THEN payroll_value END) THEN 'Increasing'
       WHEN AVG(CASE WHEN payroll_year = MINYear THEN payroll_value END) >
            AVG(CASE WHEN payroll_year = MAXYear THEN payroll_value END) THEN 'Decreasing'
       ELSE 'Stable' END AS trend
FROM (
  SELECT
    industry_branch_name,
    payroll_year,
    payroll_value,
    MIN(payroll_year) OVER (PARTITION BY industry_branch_name) AS MINYear,
    MAX(payroll_year) OVER (PARTITION BY industry_branch_name) AS MAXYear
  FROM
    t_katerina_pekarova_project_SQL_primary_final
) AS Subtable
GROUP BY
  industry_branch_name
ORDER BY
  industry_branch_name;