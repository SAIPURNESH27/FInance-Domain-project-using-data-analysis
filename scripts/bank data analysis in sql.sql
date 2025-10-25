select * from bank_loan_data

--total applications
select count(id) as total_applications
from bank_loan_data

--Month_To_DAte

select count(id) as MTD_total_applications from bank_loan_data
where month(issue_date) =12 and year(issue_date)=2021

--Previous_Month_To_DAte

select count(id) as PMTD_total_applications from bank_loan_data
where month(issue_date) =11 and year(issue_date)=2021

--total_funded_amount
select sum(loan_amount) as funded_amount from bank_loan_data

--total_funded_amount_Month_To_Date
select sum(loan_amount) as MTD_funded_amount from bank_loan_data
where month(issue_date) =12 and year(issue_date)=2021

--total_funded_amount_Previous_Month_To_Date
select sum(loan_amount) as PMTD_funded_amount from bank_loan_data
where month(issue_date) =11 and year(issue_date)=2021

--total amount recieved
select sum(total_payment) as total_amount_recieved from bank_loan_data

--total amount recieved MTD
select sum(total_payment) as MTD_total_amount_recieved from bank_loan_data
where month(issue_date) =12 and year(issue_date)=2021

--total amount recieved PMTD
select sum(total_payment) as PMTD_total_amount_recieved from bank_loan_data
where month(issue_date) =11 and year(issue_date)=2021

--average interest rate

select round(avg(int_rate),4)*100 as average_intrest_rate
from bank_loan_data

--MTD_average interest rate
select round(avg(int_rate),4)*100 as MTD_average_intrest_rate
from bank_loan_data
where month(issue_date) =12 and year(issue_date)=2021

--PMTD_average interest rate
select round(avg(int_rate),4)*100 as PMTD_average_intrest_rate
from bank_loan_data
where month(issue_date) =11 and year(issue_date)=2021

--average debt-to-income ratio
select round(avg(dti),4)*100 as avg_dti from bank_loan_data

--MTD_average debt-to-income ratio
select round(avg(dti),4)*100 as MTD_avg_dti 
from bank_loan_data
where month(issue_date) =12 and year(issue_date)=2021

--PMTD_average debt-to-income ratio
select round(avg(dti),4)*100 as PMTD_avg_dti 
from bank_loan_data
where month(issue_date) =11 and year(issue_date)=2021


select loan_status from bank_loan_data

--good loan application percentage
select 
     (count(case when loan_status='Fully Paid' or loan_status='Current'
     then id end)*100)/count(id) as good_loan_percentage
     from bank_loan_data

--good loan applications
select 
     (count(case when loan_status='Fully Paid' or loan_status='Current'
     then id end)) as good_loan_applications from bank_loan_data

--good loan funded amount
select 
     (sum(case when loan_status='Fully Paid' or loan_status='Current'
     then loan_amount end)) as good_loan_funded_amount from bank_loan_data

--good loan total amount recieved
select 
     (sum(case when loan_status='Fully Paid' or loan_status='Current'
     then total_payment end)) as good_loan_amount_recieved 
     from bank_loan_data

--bad loan percentage

select (count(case when loan_status='Charged Off' then id end)*100.0)/count(id)
as bad_loan_percentage
from bank_loan_data

--bad loan applications
select (count(case when loan_status='Charged Off' then id end))
as bad_loan_applications
from bank_loan_data

--bad loan funded amount
select (sum(case when loan_status='Charged Off' then loan_amount end))
as bad_loan_funded_amount
from bank_loan_data

--bad loan amount recieved
select (sum(case when loan_status='Charged Off' then total_payment end))
as bad_loan_amount_recieved
from bank_loan_data

--loan status
select 
     loan_status,
     count(id) total_loan_applications,
     sum(total_payment) total_payment_recieved,
     sum(loan_amount) total_funded_amount,
     avg(int_rate*100) interest_rate,
     avg(dti *100) as DTI
     from bank_loan_data
     group by loan_status

--MTD amount recieved and funded

select 
     loan_status,
     sum(total_payment) MTD_Total_amount_recieved,
     sum(loan_amount) MTD_Total_funded_amount
     from bank_loan_data
     where month(issue_date)=12
     group by loan_status

--bank loan report
select 
month(issue_date) month_number,
     datename(month,issue_date) month_name,
     count(id) total_loan_applications,
     sum(loan_amount) total_funded_amount,
     sum(total_payment) total_amount_recieved
     from bank_loan_data
     group by month(issue_date),datename(month,issue_date)
     order by month(issue_date)

--state
select 
     address_state state,
     count(id) total_loan_applications,
     sum(loan_amount) total_funded_amount,
     sum(total_payment) total_amount_recieved
     from bank_loan_data
     group by address_state
     order by count(id) DESC

--term
select 
     term,
     count(id) total_loan_applications,
     sum(loan_amount) total_funded_amount,
     sum(total_payment) total_amount_recieved
     from bank_loan_data
     group by term
     order by term

--emp_length
select 
     emp_length,
     count(id) total_loan_applications,
     sum(loan_amount) total_funded_amount,
     sum(total_payment) total_amount_recieved
     from bank_loan_data
     group by emp_length
     order by count(id) DESC

--purpose
select 
     purpose,
     count(id) total_loan_applications,
     sum(loan_amount) total_funded_amount,
     sum(total_payment) total_amount_recieved
     from bank_loan_data
     group by purpose
     order by count(id) DESC

--home ownership
select 
     home_ownership,
     count(id) total_loan_applications,
     sum(loan_amount) total_funded_amount,
     sum(total_payment) total_amount_recieved
     from bank_loan_data
     group by home_ownership
     order by count(id) DESC

select 
     purpose as purpose,
     count(id) total_loan_applications,
     sum(loan_amount) total_funded_amount,
     sum(total_payment) total_amount_recieved
     from bank_loan_data
     where grade='A'
     group by purpose 
     order by purpose








