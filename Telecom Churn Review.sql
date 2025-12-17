SELECT * FROM telecom_churn.customer_churn;

SELECT COUNT(*) FROM telecom_churn.customer_churn;

SELECT 
    COUNT(*) AS total_customers,
    ROUND(100 * SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate_percentage
FROM customer_churn;

SELECT AVG(Age) AS avg_age_churned
FROM customer_churn
WHERE Churn='Yes';

SELECT Contract, COUNT(*) AS churn_count
FROM customer_churn
WHERE Churn='Yes'
GROUP BY Contract
ORDER BY churn_count DESC
LIMIT 1;

SELECT 
    MIN(MonthlyCharges) AS min_charge,
    MAX(MonthlyCharges) AS max_charge,
    AVG(MonthlyCharges) AS avg_charge
FROM customer_churn
WHERE Churn='Yes';

SELECT Contract, 
    COUNT(*) AS churned_customers,
    ROUND(100 * COUNT(*) / (SELECT COUNT(*) FROM customer_churn), 2) AS churn_percentage
FROM customer_churn
WHERE Churn='Yes'
GROUP BY Contract
ORDER BY churn_percentage DESC;

SELECT customerID, TotalCharges
FROM customer_churn
WHERE Churn='Yes' 
AND TotalCharges > (SELECT AVG(TotalCharges) FROM customer_churn);

SELECT Churn,
    MIN(TotalCharges) AS min_total,
    MAX(TotalCharges) AS max_total,
    AVG(TotalCharges) AS avg_total
FROM customer_churn
GROUP BY Churn;

SELECT Contract, AVG(MonthlyCharges) AS avg_monthly
FROM customer_churn
WHERE Churn='Yes'
GROUP BY Contract;

SELECT customerID
FROM customer_churn
WHERE OnlineSecurity='Yes'
AND OnlineBackup='Yes'
AND Churn='No';

SELECT InternetService, StreamingTV, StreamingMovies, COUNT(*) AS cnt
FROM customer_churn
WHERE Churn='Yes'
GROUP BY InternetService, StreamingTV, StreamingMovies
ORDER BY cnt DESC
LIMIT 5;

SELECT gender, Partner, AVG(TotalCharges) AS avg_total
FROM customer_churn
GROUP BY gender, Partner;

SELECT 
CASE 
    WHEN Age < 30 THEN 'Below 30'
    WHEN Age BETWEEN 30 AND 50 THEN '30 - 50'
    ELSE 'Above 50'
END AS age_group,
AVG(MonthlyCharges) AS avg_monthly
FROM customer_churn
WHERE Churn='Yes'
GROUP BY age_group;

SELECT 
    AVG(Age) AS avg_age,
    AVG(TotalCharges) AS avg_total_charges
FROM customer_churn
WHERE MultipleLines='Yes' 
AND OnlineBackup='Yes';

SELECT Contract, 
    COUNT(*) AS senior_churn_count
FROM customer_churn
WHERE Age >= 65 AND Churn='Yes'
GROUP BY Contract
ORDER BY senior_churn_count DESC;

SELECT 
    AVG(MonthlyCharges) AS avg_monthly_charge
FROM customer_churn
WHERE MultipleLines='Yes'
AND StreamingTV='Yes';

