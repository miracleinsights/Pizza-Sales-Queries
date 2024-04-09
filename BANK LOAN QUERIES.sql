select loan_status,count(id) as loan_application,sum(loan_amount) as Total_amount_funded,
sum(Total_payment) as total_amount_received, ROUND(avg(int_rate)*100,4) AVG_int_rate,ROUND(avg(dti)*100,4) AS Avg_DTI
FROM Bank_loan_data
GROUP BY loan_status
ORDER BY COUNT(ID)

select loan_status,count(id) as MTd_loan_application,sum(loan_amount) as MTD_Total_amount_funded,
sum(Total_payment) as MTD_total_amount_received
FROM Bank_loan_data
WHERE MONTH(issue_date) =12 AND YEAR(ISSUE_DATE)=2021
GROUP BY loan_status
ORDER BY COUNT(ID)

SELECT
   distinct(COUNT(CASE WHEN loan_status = 'fully paid' OR loan_status = 'current' THEN loan_status END) * 100.0) /
	COUNT(loan_status) AS good_loan_percentage
FROM
    bank_loan_data;
SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) /
	COUNT(id) AS Good_Loan_Percentage
FROM bank_loan_data

--monthly trend

select DATENAME(MONTH,ISSUE_DATE)AS Month_name, count(id) as loan_application,sum(loan_amount) as Total_amount_funded,
sum(Total_payment) as total_amount_received
FROM Bank_loan_data
GROUP BY MONTH(ISSUE_DATE),DATENAME(MONTH,ISSUE_DATE)
ORDER BY MONTH(ISSUE_DATE)

--weekly trend 

select DATENAME(weekday,ISSUE_DATE)AS Month_name, count(id) as loan_application,sum(loan_amount) as Total_amount_funded,
sum(Total_payment) as total_amount_received
FROM Bank_loan_data
GROUP BY DATENAME(weekday,ISSUE_DATE)
ORDER BY 
    CASE
        WHEN DATENAME(WEEKDAY, issue_date) = 'Sunday' THEN 1
        WHEN DATENAME(WEEKDAY, issue_date) = 'Monday' THEN 2
        WHEN DATENAME(WEEKDAY, issue_date) = 'Tuesday' THEN 3
        WHEN DATENAME(WEEKDAY, issue_date) = 'Wednesday' THEN 4
        WHEN DATENAME(WEEKDAY, issue_date) = 'Thursday' THEN 5
        WHEN DATENAME(WEEKDAY, issue_date) = 'Friday' THEN 6
        WHEN DATENAME(WEEKDAY, issue_date) = 'Saturday' THEN 7
    END;


	select*
	from Bank_loan_data


	select purpose, count(id) as loan_application,sum(loan_amount) as Total_amount_funded,
sum(Total_payment) as total_amount_received
FROM Bank_loan_data
where grade='A'
group by 
		purpose













