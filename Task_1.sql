 -- úkol 1 Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
WITH yearly_payroll AS (
    SELECT
        industry_branch_name,
    	payroll_year,
        AVG(payroll_value) AS avg_payroll,
        LAG(AVG(payroll_value)) OVER (PARTITION BY industry_branch_name ORDER BY payroll_year) AS previous_avg_payroll
    FROM
        t_katerina_pekarova_project_SQL_primary_final
    GROUP BY
        industry_branch_name, payroll_year
)
SELECT
	industry_branch_name,
    payroll_year,
    avg_payroll AS payroll_value,
    CASE
        WHEN avg_payroll > previous_avg_payroll THEN 'Increasing'
        WHEN avg_payroll < previous_avg_payroll THEN 'Decreasing'
        ELSE 'Stable'
    END AS payroll_trend
FROM
    yearly_payroll
ORDER BY
    industry_branch_name, payroll_year;
