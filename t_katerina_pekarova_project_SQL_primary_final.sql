-- Vytvoření tabulky t_katerina_pekarova_project_SQL_primary_final
CREATE OR REPLACE TABLE t_katerina_pekarova_project_SQL_primary_final AS
SELECT
    ppa.payroll_year,
    ppa.industry_branch_name,
    ppa.payroll_value,
    ppr.year_from AS price_year_from,
    ppr.category_code,
    ppr.category_name,
    ppr.price_value
FROM t_katerina_pekarova_pomocnapayroll ppa
LEFT JOIN t_katerina_pekarova_pomocnaprice ppr ON ppa.payroll_year = ppr.year_from;

-- Zobrazení obsahu tabulky t_katerina_pekarova_project_SQL_primary_final
SELECT *
FROM t_katerina_pekarova_project_SQL_primary_final;