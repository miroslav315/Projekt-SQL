CREATE TABLE Miroslav_Spremo_project_SQL_primary_final AS
SELECT 
cp.id AS price_id,
cp.value AS price_value,
cp.category_code,
cp.region_code,
cp2.id AS payroll_id,
cp2.value AS payroll_value,
cp2.value_type_code,
cp2.unit_code,
cp2.calculation_code,
cp2.industry_branch_code,
cp2.payroll_year,
cp2.payroll_quarter
FROM 
    czechia_price cp
JOIN 
    czechia_payroll cp2
ON 
    cp2.payroll_year = YEAR(cp.date_from);