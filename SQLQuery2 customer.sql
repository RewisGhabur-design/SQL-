SELECT *
FROM dbo.[Customer-Churn-Records]

SELECT 
    SUM(CASE WHEN ROWNUMBER IS NULL THEN 1 ELSE 0 END) AS null_RowNumber,
    SUM(CASE WHEN customerId IS NULL THEN 1 ELSE 0 END) AS null_CustomerId,
    SUM(CASE WHEN Surname IS NULL THEN 1 ELSE 0 END) AS null_Surname,
    SUM(CASE WHEN CreditScore IS NULL THEN 1 ELSE 0 END) AS null_CreditScore,
    SUM(CASE WHEN Geography IS NULL THEN 1 ELSE 0 END) AS null_Geography,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS null_Gender,
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS null_Age,
    SUM(CASE WHEN Tenure IS NULL THEN 1 ELSE 0 END) AS null_Tenure,
    SUM(CASE WHEN Balance IS NULL THEN 1 ELSE 0 END) AS null_Balance,
    SUM(CASE WHEN NumOfProducts IS NULL THEN 1 ELSE 0 END) AS null_NumOfProducts,
    SUM(CASE WHEN HasCrCard IS NULL THEN 1 ELSE 0 END) AS null_HasCrCard,
    SUM(CASE WHEN IsActiveMember IS NULL THEN 1 ELSE 0 END) AS null_IsActiveMember,
    SUM(CASE WHEN EstimatedSalary IS NULL THEN 1 ELSE 0 END) AS null_EstimatedSalary,
    SUM(CASE WHEN Exited IS NULL THEN 1 ELSE 0 END) AS null_Exited,
    SUM(CASE WHEN Complain IS NULL THEN 1 ELSE 0 END) AS null_Complain,
    SUM(CASE WHEN Satisfaction_Score IS NULL THEN 1 ELSE 0 END) AS null_Satisfaction_Score,
    SUM(CASE WHEN Card_Type IS NULL THEN 1 ELSE 0 END) AS null_Card_Type,
    SUM(CASE WHEN Point_Earned IS NULL THEN 1 ELSE 0 END) AS null_Point_Earned
    from dbo.[Customer-Churn-Records]

    SELECT
    SUM(Balance) AS total_sales
    from dbo.[Customer-Churn-Records]

    SELECT 
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(100.0 * SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS ChurnRate_Percent
FROM dbo.[Customer-Churn-Records];

SELECT
Geography,
round(100.0 * sum(case when Exited = 1 then 1 else 0 end) / count(*), 2) AS customer_rate
from dbo.[Customer-Churn-Records]
group by Geography
order by customer_rate desc;

select 
   Gender,
count(*) as total_customers,
 sum(case when exited = 1 then 1 else 0 end) churn_customers,
round (100.0 * sum(case when exited = 1 then 1 else 0 end) / count(*), 2) as churn_customer_percintage
from DBO.[Customer-Churn-Records]
GROUP BY Gender

SELECT 
    CASE 
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 40 THEN '25-40'
        WHEN Age BETWEEN 41 AND 60 THEN '41-60'
        ELSE '60+'
    END AS Age_Group,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS Churned,
    ROUND(100.0 * SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS ChurnRate
FROM dbo.[Customer-Churn-Records]
GROUP BY 
    CASE 
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 40 THEN '25-40'
        WHEN Age BETWEEN 41 AND 60 THEN '41-60'
        ELSE '60+'
    END
ORDER BY ChurnRate DESC;

SELECT 
COUNT(*) AS TOTAL_CUSTOMERS,
ROUND (100.0 * SUM(CASE WHEN exited = 1THEN 1 ELSE 0 END) / COUNT(*) , 2) AS TOTAL_CHURN
from dbo.[Customer-Churn-Records]
group by NumOfProducts
 
 SELECT 
COUNT(*) AS TOTAL_CUSTOMERS,
ROUND (100.0 * SUM(CASE WHEN exited = 1THEN 1 ELSE 0 END) / COUNT(*) , 2) AS TOTAL_CHURN
from dbo.[Customer-Churn-Records]
group by HasCrCard

 SELECT 
COUNT(*) AS TOTAL_CUSTOMERS,
ROUND (100.0 * SUM(CASE WHEN exited = 1THEN 1 ELSE 0 END) / COUNT(*) , 2) AS TOTAL_CHURN
from dbo.[Customer-Churn-Records]
group by IsActiveMember

 SELECT 
COUNT(*) AS TOTAL_CUSTOMERS,
ROUND (100.0 * SUM(CASE WHEN exited = 1THEN 1 ELSE 0 END) / COUNT(*) , 2) AS TOTAL_CHURN
from dbo.[Customer-Churn-Records]
group by Satisfaction_Score

 SELECT 
COUNT(*) AS TOTAL_CUSTOMERS,
ROUND (100.0 * SUM(CASE WHEN exited = 1THEN 1 ELSE 0 END) / COUNT(*) , 2) AS TOTAL_CHURN
from dbo.[Customer-Churn-Records]
group by Complain

 SELECT 
COUNT(*) AS TOTAL_CUSTOMERS,
ROUND (100.0 * SUM(CASE WHEN exited = 1THEN 1 ELSE 0 END) / COUNT(*) , 2) AS TOTAL_CHURN
from dbo.[Customer-Churn-Records]
group by Card_Type
order by Card_Type desc;


SELECT 
    CASE 
        WHEN Point_Earned < 1000 THEN 'Low Points'
        WHEN Point_Earned BETWEEN 1000 AND 5000 THEN 'Medium Points'
        ELSE 'High Points'
    END AS Point_Group,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS Churned,
    ROUND(100.0 * SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS ChurnRate
FROM dbo.[Customer-Churn-Records]
GROUP BY 
    CASE 
        WHEN Point_Earned < 1000 THEN 'Low Points'
        WHEN Point_Earned BETWEEN 1000 AND 5000 THEN 'Medium Points'
        ELSE 'High Points'
    END
ORDER BY ChurnRate DESC;