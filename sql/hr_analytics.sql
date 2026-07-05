-- HR Analytics SQL Queries
-- Cross-validation queries for Power BI dashboard

USE hr_analytics;

-- 1. Overall Attrition Rate
SELECT 
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
    ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS Attrition_Rate
FROM hr_data;

-- 2. Attrition by Department
SELECT Department,
    COUNT(*) AS Total,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Left_Co,
    ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS Rate
FROM hr_data
GROUP BY Department
ORDER BY Rate DESC;

-- 3. Overtime vs Attrition
SELECT OverTime,
    COUNT(*) AS Total,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Left_Co,
    ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS Rate
FROM hr_data
GROUP BY OverTime;

-- 4. Age Group Analysis
SELECT 
    CASE 
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age <= 34 THEN '25-34'
        WHEN Age <= 44 THEN '35-44'
        WHEN Age <= 54 THEN '45-54'
        ELSE '55+'
    END AS AgeGroup,
    COUNT(*) AS Total,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Left_Co,
    ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS Rate
FROM hr_data
GROUP BY AgeGroup
ORDER BY Rate DESC;

-- 5. Salary Slab Analysis
SELECT 
    CASE 
        WHEN MonthlyIncome < 3000 THEN 'Below 3K'
        WHEN MonthlyIncome <= 6000 THEN '3K-6K'
        WHEN MonthlyIncome <= 10000 THEN '6K-10K'
        ELSE 'Above 10K'
    END AS Salary_Slab,
    COUNT(*) AS Total,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Left_Co,
    ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS Rate
FROM hr_data
GROUP BY Salary_Slab
ORDER BY Rate DESC;

-- 6. Job Satisfaction Analysis
SELECT JobSatisfaction,
    COUNT(*) AS Total,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Left_Co,
    ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS Rate
FROM hr_data
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

-- 7. Education Field Analysis
SELECT EducationField,
    COUNT(*) AS Total,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Left_Co,
    ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS Rate
FROM hr_data
GROUP BY EducationField
ORDER BY Rate DESC;

-- 8. Work Life Balance Analysis
SELECT WorkLifeBalance,
    COUNT(*) AS Total,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Left_Co,
    ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS Rate
FROM hr_data
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;
