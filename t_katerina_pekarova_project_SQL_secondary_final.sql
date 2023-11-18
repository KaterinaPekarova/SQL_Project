-- Dodatečná tabulka t_katerina_pekarova_project_SQL_secondary_final
CREATE OR REPLACE TABLE t_katerina_pekarova_project_SQL_secondary_final AS
SELECT 
    country,
    year,
    GDP,
    population
FROM 
    economies e 
WHERE 
    country = 'Czech Republic' AND year > '1989';

   
-- Zobrazení obsahu sekundární tabulky
SELECT *
FROM t_katerina_pekarova_project_SQL_secondary_final;
