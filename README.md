# Analyzing-International-Debt-Statistics
## Introduction
![Image](https://github.com/user-attachments/assets/1d21e6f5-0ea3-4e80-a3f1-c02882782734)
Humans not only take debts to manage necessities. A country may also take debt to manage its economy. For example, infrastructure spending is one costly ingredient required for a country's citizens to lead comfortable lives. The World Bank is the organization that provides debt to countries.

In this project, you are going to analyze international debt data collected by The World Bank. The dataset contains information about the amount of debt (in USD) owed by developing countries across several categories. You are going to find the answers to the following questions:

- What is the number of distinct countries present in the database?
- What country has the highest amount of debt?
- What country has the lowest amount of repayments?

## Data

<img src="https://github.com/user-attachments/assets/394bb7b6-49e1-4707-8406-f7c46e647976" alt="Deskripsi Gambar" width="800">

You can download full dataset in : [here](https://github.com/user-attachments/files/18631784/international_debt.csv)

## International Debt Statistics
### 1. What is the number of distinct countries present in the database ?
````sql
select count(distinct country_name) as total_distinct_countries
from international_debt
````
**Answer**

<img src="https://github.com/user-attachments/assets/4f3fb630-ed26-4849-9171-9f54506f91c6" alt="Deskripsi Gambar" width="400">

- Total countries present in database is 124 countries

### 2. What country has the highest amount of debt ?
````sql
select country_name, 
	   sum(debt) as total_debt
from international_debt
group by country_name
order by total_debt desc 
limit 1;
````
**Answer**

<img src="https://github.com/user-attachments/assets/b9231b1d-0222-4957-b2b6-775c865d1af9" alt="Deskripsi Gambar" width="500">

- China has the highest amount of debt with total debt 285.793.494.734.1999997

### 3. What country has the lowest amount of principal repayments (indicated by the "DT.AMT.DLXF.CD" indicator code) ?
````sql
select country_name, 
	   indicator_name,
	   min(debt) as lowest_repayment
from international_debt
where indicator_code = 'DT.AMT.DLXF.CD'
group by country_name, indicator_name 
order by lowest_repayment 
limit 1;
````
**Answer**

<img src="https://github.com/user-attachments/assets/4aa304c1-3aac-4345-bb38-b8937323314b" alt="Deskripsi Gambar" width="700">

- Timor Leste has the lowest amount of principal repayment with total debt is 825.000
