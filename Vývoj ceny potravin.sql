    WITH yearly_avg AS (
    SELECT 
        category_code,
        YEAR(date_from) AS year,
        AVG(value) AS avg_value
    FROM 
        czechia_price
    GROUP BY 
        category_code,
        YEAR(date_from)),
    yearly_change AS (
    SELECT 
        category_code,
        year,
        avg_value,
        LAG(avg_value) OVER (PARTITION BY category_code ORDER BY year) AS previous_avg_value,
        (avg_value / LAG(avg_value) OVER (PARTITION BY category_code ORDER BY year)) - 1 AS rate_of_change
    FROM 
        yearly_avg),
    average_increase AS (
    SELECT 
        year,
        AVG(rate_of_change) * 100 AS average_annual_increase 
    FROM 
        yearly_change
    WHERE 
        previous_avg_value IS NOT NULL
    GROUP BY 
        year)
    SELECT 
    year,
    ROUND(average_annual_increase, 2) AS average_annual_increase 
    FROM 
    average_increase
    ORDER BY year;