 create view [dbo].[main_analytics] as 
select
	t.name as theme_name,t.id as theme_id,t.parent_id as theme_parent_id,
	s.set_num ,s.name as set_name,s.year,cast(s.num_parts as numeric)as num_parts,
case 
	when year between 1901 and 2000 then '20th century'
	when year between 2001 and 2100 then '21st century'
end as century
from sets s
join themes t
on s.theme_id=t.id

--total number of parts per theme
select theme_name,sum(num_parts) as total_num_parts
from main_analytics
group by theme_name
order by 2 desc

--total number of parts per year
select year,sum(num_parts) as total_num_parts
from main_analytics
group by year
order by 2 desc

--how many sets where created in each century in the dataset
select century,count(set_num) as Total_set_count
from main_analytics
where theme_parent_id is not null
group by century



--what percentage of sets ever released in 21st century were train themed
;with cte as(
select theme_name,century,count(set_num) as total_set_num,sum(count(set_num)) over () as total,
cast(1.00*(count(set_num))/(sum(count(set_num)) over ())as decimal(4,4))*100 as percentage_
from main_analytics
where century='21st century' 
group by theme_name,century)
  
  select*
  from cte
  where theme_name like '%train%'

  --What was the most popular theme by year in terms of sets released in 21st century
  SELECT YEAR,THEME_NAME,total_set_num
  FROM(
		select year,theme_name,count(set_num) as total_set_num,ROW_NUMBER() over (partition by YEAR ORDER BY count(set_num)DESC) as RN
		from main_analytics
		where century='21st century'
		group by year,theme_name
		)m
where RN=1
order by 3 desc

--what is the most produced color of lego in terms of quantity of parts
select  top 5 c.name as color,sum(i.quantity) quantity_oF_parts
from inventory_parts i
join colors c
on i.color_id=c.id
group by c.name
order by 2 desc

select*
from inventory_parts






