select*
from hrdata

--Total number of employees
select count(emp_no)
from hrdata

--Total number of attritions
select count(attrition)
from hrdata
where Attrition='yes'

--Attrition rate
select cast(100*count
	(case when attrition='Yes' then 1 end)/cast(count(*)as decimal(10,2))as decimal(10,2))
	from hrdata

--Total active Emloyees
select count(CF_attrition_label)
from hrdata 
where CF_attrition_label='current Employees'

--Employees average age
select cast(sum(age)/cast(count(*) as decimal(10,2))as decimal(10,2))
from hrdata

--Attrition by department
select department, count(attrition)
from hrdata
where Attrition='yes'
group by Department

--No of employees by age group
select cf_age_band,count(emp_no)
from hrdata
group by CF_age_band
order by 2 desc

--Attrition by Education field
select Education_Field, count(attrition)
from hrdata
where Attrition='yes'
group by Education_Field
order by 2 desc


--Attrition rates by Gender for different age groups
--under 25
select  CF_age_band,Gender,
count(case when attrition ='yes' then 1 end) as att_count, 1.00*count(case when attrition ='yes' then 1 end)
/( select(count(case when attrition ='yes' then 1 end)) from hrdata where CF_age_band='under 25')*100
from hrdata
where CF_age_band='under 25'
group by  CF_age_band,Gender
order by 1

--Agegroup(25-34)
select  CF_age_band,Gender,
count(case when attrition ='yes' then 1 end) as att_count, 1.00*count(case when attrition ='yes' then 1 end)
/( select(count(case when attrition ='yes' then 1 end)) from hrdata where CF_age_band='25 - 34')*100
from hrdata
where CF_age_band='25 - 34'
group by  CF_age_band,Gender
order by 1

--Agegroup(35-44)
select  CF_age_band,Gender,
count(case when attrition ='yes' then 1 end) as att_count, 1.00*count(case when attrition ='yes' then 1 end)
/( select(count(case when attrition ='yes' then 1 end)) from hrdata where CF_age_band='35 - 44')*100
from hrdata
where CF_age_band='35 - 44'
group by  CF_age_band,Gender
order by 1

--Agegroup(45-54)
select  CF_age_band,Gender,
count(case when attrition ='yes' then 1 end) as att_count, 1.00*count(case when attrition ='yes' then 1 end)
/( select(count(case when attrition ='yes' then 1 end)) from hrdata where CF_age_band='45 - 54')*100
from hrdata
where CF_age_band='45 - 54'
group by  CF_age_band,Gender
order by 1

--Agegroup(over 55)
select  CF_age_band,Gender,
count(case when attrition ='yes' then 1 end) as att_count, 1.00*count(case when attrition ='yes' then 1 end)
/( select(count(case when attrition ='yes' then 1 end)) from hrdata where CF_age_band='over 55')*100
from hrdata
where CF_age_band='over 55'
group by  CF_age_band,Gender
order by 1

--TESTING SLICER
--Total number of attritions
select count(emp_no)
from hrdata
where Education='High school'

--Attrition rate
select cast(100*count
	(case when attrition='Yes' then 1 end)/cast(count(*)as decimal(10,2))as decimal(10,2))
	from hrdata
where Education='Associates degree'

SELECT *
FROM (
    SELECT job_role, job_satisfaction ,Employee_Count
    FROM hrdata
) AS SourceTable
PIVOT (
    sum(employee_count)
    FOR job_satisfaction IN ([one], [two], [three], [four])
) AS PivotTable;









































