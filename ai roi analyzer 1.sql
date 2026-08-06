CREATE DATABASE  ai_roi_analyzer;
USE ai_roi_analyzer;
SHOW TABLES;  

USE ai_roi_analyzer;

RENAME TABLE `1_org_adoption` TO org_adoption;
RENAME TABLE `2_business_function` TO business_function;
RENAME TABLE `3_ai_tool_users` TO ai_tool_users;
RENAME TABLE `4_investment_by_country` TO investment_by_country;
RENAME TABLE `5_industry_adoption` TO industry_adoption;
RENAME TABLE `6_sentiment_by_country` TO sentiment_by_country;
RENAME TABLE `7_kpi_summary` TO kpi_summary;

SHOW TABLES;
SELECT * FROM org_adoption LIMIT 5;
SELECT * FROM business_function LIMIT 5;
SELECT * FROM ai_tool_users LIMIT 5;
SELECT * FROM investment_by_country LIMIT 5;
SELECT * FROM industry_adoption LIMIT 5;
SELECT * FROM sentiment_by_country LIMIT 5;  
SELECT * FROM kpi_summary LIMIT 5;
   

DESCRIBE org_adoption;
DESCRIBE business_function; 
DESCRIBE ai_tool_users;
DESCRIBE investment_by_country;
DESCRIBE industry_adoption;
DESCRIBE sentiment_by_country;
DESCRIBE kpi_summary;   

SELECT
SUM(year_label IS NULL) AS year_label_missing,
SUM(ai_any_function_pct IS NULL) AS ai_any_function_pct_missing,
SUM(genai_pct IS NULL) AS genai_pct_missing,
SUM(orgs_2plus_pct IS NULL) AS orgs_2plus_pct_missing,
SUM(top_function_1 IS NULL) AS top_function_1_missing,
SUM(top_function_2 IS NULL) AS top_function_2_missing,
SUM(top_function_3 IS NULL) AS top_function_3_missing,
SUM(sample_size_raw IS NULL) AS sample_size_raw_missing
FROM org_adoption;

SELECT
SUM(business_function IS NULL) AS business_function_missing,
SUM(y2021 IS NULL) AS y2021_missing,
SUM(y2022 IS NULL) AS y2022_missing,
SUM(y2023 IS NULL) AS y2023_missing,
SUM(early_2024 IS NULL) AS early_2024_missing,
SUM(late_2024 IS NULL) AS late_2024_missing,
SUM(y2025 IS NULL) AS y2025_missing
FROM business_function;

SELECT
SUM(tool_platform IS NULL) AS tool_platform_missing,
SUM(metric_type IS NULL) AS metric_type_missing,
SUM(period_label IS NULL) AS period_label_missing,
SUM(metric_value IS NULL) AS metric_value_missing,
SUM(unit IS NULL) AS unit_missing
FROM ai_tool_users;

SELECT
SUM(country IS NULL) AS country_missing,
SUM(y2019 IS NULL) AS y2019_missing,
SUM(y2020 IS NULL) AS y2020_missing,
SUM(y2021 IS NULL) AS y2021_missing,
SUM(y2022 IS NULL) AS y2022_missing,
SUM(y2023 IS NULL) AS y2023_missing,
SUM(y2024 IS NULL) AS y2024_missing
FROM investment_by_country;

SELECT
SUM(industry_sector IS NULL) AS industry_sector_missing,
SUM(y2022 IS NULL) AS y2022_missing,
SUM(y2023 IS NULL) AS y2023_missing,
SUM(early_2024 IS NULL) AS early_2024_missing,
SUM(late_2024 IS NULL) AS late_2024_missing,
SUM(y2025 IS NULL) AS y2025_missing
FROM industry_adoption;

SELECT
SUM(country IS NULL) AS country_missing,
SUM(pct_beneficial IS NULL) AS pct_beneficial_missing,
SUM(pct_believe_job_change IS NULL) AS pct_believe_job_change_missing,
SUM(pct_fear_job_loss IS NULL) AS pct_fear_job_loss_missing
FROM sentiment_by_country;

SELECT *
FROM kpi_summary;


SELECT COUNT(*) AS total_rows,
COUNT(DISTINCT CONCAT_WS('|',
year_label,
ai_any_function_pct,
genai_pct,
orgs_2plus_pct,
top_function_1,
top_function_2,
top_function_3,
sample_size_raw
)) AS unique_rows
FROM org_adoption;

SELECT COUNT(*) AS total_rows,
COUNT(DISTINCT CONCAT_WS('|',
business_function,
y2021,
y2022,
y2023,
early_2024,
late_2024,
y2025
)) AS unique_rows
FROM business_function;

SELECT COUNT(*) AS total_rows,
COUNT(DISTINCT CONCAT_WS('|',
tool_platform,
metric_type,
period_label,
metric_value,
unit
)) AS unique_rows
FROM ai_tool_users;

SELECT COUNT(*) AS total_rows,
COUNT(DISTINCT CONCAT_WS('|',
country,
y2019,
y2020,
y2021,
y2022,
y2023,
y2024
)) AS unique_rows
FROM investment_by_country;

SELECT COUNT(*) AS total_rows,
COUNT(DISTINCT CONCAT_WS('|',
industry_sector,
y2022,
y2023,
early_2024,
late_2024,
y2025
)) AS unique_rows
FROM industry_adoption;

SELECT COUNT(*) AS total_rows,
COUNT(DISTINCT CONCAT_WS('|',
country,
pct_beneficial,
pct_believe_job_change,
pct_fear_job_loss
)) AS unique_rows
FROM sentiment_by_country;  


SELECT DISTINCT year_label FROM org_adoption; 


SELECT DISTINCT business_function FROM business_function;

SELECT DISTINCT tool_platform FROM ai_tool_users;
SELECT DISTINCT metric_type FROM ai_tool_users;
SELECT DISTINCT period_label FROM ai_tool_users;

SELECT DISTINCT country FROM investment_by_country;

SELECT DISTINCT industry_sector FROM industry_adoption;

SELECT DISTINCT country FROM sentiment_by_country;

SELECT
year_label,
ai_any_function_pct AS ai_adoption_percentage,
genai_pct,
orgs_2plus_pct
FROM org_adoption
ORDER BY year_label;  

SELECT
business_function,
y2025
FROM business_function
ORDER BY y2025 DESC; 

SELECT
business_function,
y2021,
y2025,
(y2025 - y2021) AS growth
FROM business_function
ORDER BY growth DESC; 

SELECT
industry_sector,
y2025
FROM industry_adoption
ORDER BY y2025 DESC;  

SELECT
industry_sector,
y2022,
y2025,
(y2025 - y2022) AS growth
FROM industry_adoption
ORDER BY growth DESC;    


SELECT
tool_platform,
SUM(metric_value) AS total_users
FROM ai_tool_users
GROUP BY tool_platform
ORDER BY total_users DESC; 

 SELECT
country,
pct_beneficial
FROM sentiment_by_country
ORDER BY pct_beneficial DESC; 

SELECT
country,
pct_believe_job_change
FROM sentiment_by_country; (this query is also skipped for a reason )

SELECT
country,
pct_fear_job_loss
FROM sentiment_by_country;(this query is skiped for a reason )