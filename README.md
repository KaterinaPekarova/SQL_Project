# SQL_Project

### O čem je projekt?

Cílem projektu je odpovědět na pět otázek týkajících se vývoje cen, mezd a HDP v České republice. Jsou použita následující data:

-	czechia_payroll – Informace o mzdách v různých odvětvích za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
-	czechia_payroll_industry_branch – Číselník odvětví v tabulce mezd.
-	czechia_price – Informace o cenách vybraných potravin za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
-	czechia_price_category – Číselník kategorií potravin, které se vyskytují v našem přehledu.
-	economies - HDP, GINI, daňová zátěž, atd. pro daný stát a rok.

### Tvorba tabulek
Nejdříve bylo zapotřebí vytvořit dvě hlavní tabulky, a to primární a sekundární.
První tabulka s názvem t_katerina_pekarova_project_SQL_primary_final je spojením dvou dílčích pomocných tabulek:
Pomocná tabulka payroll je složena z:
-	payroll_year – rok
-	industry_branch_code – kód odvětví
-	industry_branch_name  - připojené názvy odvětví z tabulky czechia_payroll_industry_branch 
-	payroll_value – mzdy

Pomocná tabulka price je složena z:
-	year – rok
-	category_code – kód kategorie potraviny
-	category_name – připojené názvy potravin z tabulky czechia_price_category
-	price_value - ceny

Tyto dvě dílčí tabulky byly vytvořeny z důvodu optimalizace a zrychlení při zpracovávání dat.

Sekundární tabulka má název t_katerina_pekarova_project_SQL_secondary_final a obsahuje údaje o vývoji HDP v České republice v průběhu let 1990 až do současnosti.

### Výzkumné otázky a závěr

Otázka 1 Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
Na základě vstupních dat byl vytvořen přehled, který obsahuje názvy jednotlivých odvětví, přehled sledovaných let (2000 - 2021), průměrnou hodnotu mzdy a byl také vytvořen nový sloupec s názvem payroll_trend obsahující informaci, zda došlo k meziročnímu nárůstu či poklesu. Z výsledků je patrné, že mezi rokem 2000 a 2021 došlo k nárůstu mezd ve všech odvětvích, nicméně meziročně docházelo i k poklesům.

Otázka 2 Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd? Pro zjištění odpovědi na tuto otázku byl vytvořen přehled obsahující rok 2006 a 2018 (jedná se o první a poslední srovnatelné období) a následně byly dopočteny litry mléka a kilogramy chleba. Výsledkem je množství potravin, které se dá za průměrnou cenu daného roku koupit za sumu všech mezd.

Otázka 3 Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)? Pro získání odpovědi byl opět porovnán první a poslední sledovaný rok (roky 2006 a 2018). Byly vytvořeny průměry cen za danou kategorii potraviny a porovnána procentuální změna. Z výsledků je patrné, že cukr krystalový a rajská jablka mezi lety zlevnily, naopak nejvíce zdražilo máslo.

Otázka 4 Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)? Byl sestaven kód, který analyzuje změny průměrných cen potravin a mezd za jednotlivé roky. Výsledkem je seznam, který zobrazuje roční hodnoty změn zaokrouhlené na 4 desetinná místa, a indikátor, zda je rozdíl mezi změnou cen potravin a mezd větší než 10 %. Vstupní data týkající se cen obsahují informace od roku 2006 do roku 2018 a data týkající se mezd informace mezi lety 2000 až 2021. Signifikantnějšího rozdílu můžeme zaznamenat v roce 2013.

Otázka 5 Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem? Byl vytvořen kód, který umožňuje analyzovat vztah mezi HDP, cenami potravin a mzdami v průběhu let a zkoumá meziroční změny v těchto proměnných. Jak již bylo řečeno, můžeme porovnávat pouze data od roku 2006 do 2018, neb údaje o cenách máme pouze z tohoto rozmezí. Z námi vytvořeného přehledu vyplývá, že mezi změnami HDP, cen a mezd neexistuje přímá závislost.
