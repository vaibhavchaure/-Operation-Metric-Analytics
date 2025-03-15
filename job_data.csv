use project;

# A) Job Reviewed Over Time: Calculate the number of jobs reviewed per hour for each day in november 2020.
select ds as date, hour(ds) as hour, count( * ) as job_reviewed, 
round(sum(time_spent) / 3600, 2) as per_hour
from job_data
where ds between '2020-11-01' and '2020-11-30'
group by ds, hour
order by ds, hour;


# B)  Throughput Analysis: Calculate the 7-day rolling average of throughput (events per second).
select ds, count(*) as total_events, count(*) / sum(time_spent) as event_per_sec,
avg(count(*) / sum(time_spent)) 
over(order by ds rows between 6 preceding and current row) as rolling_avg_7_days
from job_data
group by ds
order by ds;


# C) Language Share Analysis: Write an SQL query to calculate the percentage share of each language over the last 30 days.
select language, (count( * ) * 100.0 / (select count( * ) from job_data)) as percentage
from job_data
group by language
order by percentage desc;

# D) Duplicate Rows Detection: Write an SQL query to display duplicate rows from the job data table.
select job_id, count(*) as duplicate_count
from job_data
group by job_id
having count(*) > 1
order by duplicate_count desc;


