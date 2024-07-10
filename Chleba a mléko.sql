 -- Dotaz 1: Poslední období pro mléko
SELECT 
    cz_price.*, 
    cz_payroll.*, 
    cz_payroll.value / cz_price.value AS celkem_mleka_posledni_obdobi
FROM 
    czechia_price cz_price 
JOIN 
    czechia_payroll cz_payroll 
ON 
    cz_payroll.payroll_year = YEAR(cz_price.date_from)
WHERE 
    cz_price.category_code = 114201 
    AND cz_payroll.value IS NOT NULL 
    AND cz_payroll.value_type_code = 5958 
ORDER BY 
    cz_price.date_from DESC;

-- Dotaz 2: Poslední období pro chleba
SELECT 
    cz_price.*, 
    cz_payroll.*, 
    cz_payroll.value / cz_price.value AS celkem_chleba_posledni_obdobi
FROM 
    czechia_price cz_price 
JOIN 
    czechia_payroll cz_payroll 
ON 
    cz_payroll.payroll_year = YEAR(cz_price.date_from)
WHERE 
    cz_price.category_code = 111301 
    AND cz_payroll.value IS NOT NULL 
    AND cz_payroll.value_type_code = 5958 
ORDER BY 
    cz_price.date_from DESC;

-- Dotaz 3: První období pro chleba
SELECT 
    cz_price.*, 
    cz_payroll.*, 
    cz_payroll.value / cz_price.value AS celkem_chleba_prvni_obdobi
FROM 
    czechia_price cz_price 
JOIN 
    czechia_payroll cz_payroll 
ON 
    cz_payroll.payroll_year = YEAR(cz_price.date_from)
WHERE 
    cz_price.category_code = 111301 
    AND cz_payroll.value IS NOT NULL 
    AND cz_payroll.value_type_code = 5958 
ORDER BY 
    cz_price.date_from ASC;

-- Dotaz 4: První období pro mléko
SELECT 
    cz_price.*, 
    cz_payroll.*, 
    cz_payroll.value / cz_price.value AS celkem_mleka_prvni_obdobi
FROM 
    czechia_price cz_price 
JOIN 
    czechia_payroll cz_payroll 
ON 
    cz_payroll.payroll_year = YEAR(cz_price.date_from)
WHERE 
    cz_price.category_code = 114201 
    AND cz_payroll.value IS NOT NULL 
    AND cz_payroll.value_type_code = 5958 
ORDER BY 
    cz_price.date_from ASC;