select * from international_debt

-- 1. What is the number of distinct countries present in the database ?
select count(distinct country_name) as total_distinct_countries
from international_debt
-- 2. What country has the highest amount of debt ?
select country_name, 
	   sum(debt) as total_debt
from international_debt
group by country_name
order by total_debt desc 
limit 1;
-- 3. What country has the lowest amount of principal repayment (indicated by the "DT.AMT.DLXF.CD" indicator code) ?
select country_name, 
	   indicator_name,
	   min(debt) as lowest_repayment
from international_debt
where indicator_code = 'DT.AMT.DLXF.CD'
group by country_name, indicator_name 
order by lowest_repayment 
limit 1;