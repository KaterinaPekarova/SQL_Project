-- katka_93559
-- Vytvoření tabulky pomocné PAYROLL
CREATE OR REPLACE TABLE t_katerina_pekarova_pomocnapayroll AS
SELECT DISTINCT 
    cp.payroll_year,
    cp.industry_branch_code,
    cpib.name AS industry_branch_name,
    ROUND(AVG(cp.value), 2) AS payroll_value
FROM czechia_payroll cp 
LEFT JOIN czechia_payroll_industry_branch cpib ON cp.industry_branch_code = cpib.code
WHERE cp.value AND cp.industry_branch_code IS NOT NULL
GROUP BY payroll_year, industry_branch_code;

-- Zobrazení obsahu tabulky pomocné PAYROLL
SELECT *
FROM t_katerina_pekarova_pomocnapayroll;

-- Vytvoření tabulky pomocné PRICE
CREATE OR REPLACE TABLE t_katerina_pekarova_pomocnaprice AS
SELECT DISTINCT 
    YEAR(cpr.date_from) AS year_from,
    cpr.category_code,
    cpc.name AS category_name,
    ROUND(AVG(cpr.value), 2) AS price_value
FROM czechia_price cpr 
LEFT JOIN czechia_price_category cpc ON cpr.category_code = cpc.code
GROUP BY year_from, category_code;

-- Zobrazení obsahu tabulky pomocné PRICE
SELECT *
FROM t_katerina_pekarova_pomocnaprice;
