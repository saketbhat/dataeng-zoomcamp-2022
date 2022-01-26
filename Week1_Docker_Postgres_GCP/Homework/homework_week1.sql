
--Question 3 : Count Records
--How many taxi trips were there on January 15?
--Consider only trips that started on January 15.

select count(*) from yellow_taxi_data where to_char(tpep_pickup_datetime ::DATE,'MM/DD') = '01/15' -- Ans: 53024;

--Question 4 : Largest tip of the day

--Find the largest tip for each day.
select max(tip_amount) as max_tip, tpep_pickup_datetime :: DATE as dt from
	yellow_taxi_data group by tpep_pickup_datetime :: DATE; 
  
-- On which day it was the largest tip in January?  
 Select * from (Select a.dt , dense_rank() over (order by a.max_tip desc) as ranking from (
select max(tip_amount) as max_tip, tpep_pickup_datetime :: DATE as dt from yellow_taxi_data 
	where TO_CHAR(tpep_pickup_datetime, 'MM') = '01' group by tpep_pickup_datetime :: DATE ) a ) b where b.ranking = 1 -- Ans : 2021-01-20;
  
 -- Question 5 : To be solved
 
 
 -- Question 6 : To be solved
  
  
