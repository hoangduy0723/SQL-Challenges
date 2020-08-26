-- 1. https://www.hackerrank.com/challenges/projects/problem


select Start_Date, MIN(End_Date)
from 
    (select Start_Date from Projects where Start_Date not in 
    (select End_Date from Projects)) a,
    (select End_Date from Projects where End_Date 
    not in (select Start_Date from Projects)) b 
where Start_Date < End_Date
group by Start_Date  order by min(end_date)- start_date asc, Start_Date;

