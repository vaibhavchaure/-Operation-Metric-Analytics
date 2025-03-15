use project;

# 1. Weekly User Engagement: Write an SQL query to calculate the weekly user engagement.
select yearweek(occurred_at) as week,  
count(distinct user_id) as active_users  
from events  
where event_type = 'engagement' and event_name = 'login'  
group by week  
order by week;

# 2. User Growth Analysis: Write an SQL query to calculate the user growth for the product.
select date(created_at) as day,  
count(user_id) as total_users,  
count(case when activated_at is not null then user_id end) as activated_users  
from users  
group by day  
order by day;


# 3. Weekly Retention Analysis: Write an SQL query to calculate the weekly retention of users based on their sign-up cohort.
select yearweek(u.created_at) as week, yearweek(e.occurred_at) as activity_week,  
count(distinct e.user_id) as retained_users  
from users u  
join events e on u.user_id = e.user_id  
group by week, activity_week  
order by week, activity_week;

#4 Weekly Engagement Per Device: Write an SQL query to calculate the weekly engagement per device.
select year(str_to_date(occurred_at, '%Y-%m-%d %H:%i:%s')) as year, 
week(str_to_date(occurred_at, '%Y-%m-%d %H:%i:%s')) as week_number, device, 
count(distinct user_id) as active_users
from events
where occurred_at is not null
group by year, week_number, device
order by year desc, week_number desc, active_users desc;

#5 Email Engagement Analysis: Write an SQL query to calculate the email engagement metrics.

select date_format(str_to_date(occurred_at, '%d-%m-%Y %H:%i'), '%Y-%u') as week_number, action,
count(distinct user_id) as unique_users,
count(*) as total_events
from email_events
where action in ('sent_weekly_digest', 'email_opened', 'email_clicked')
group by week_number, action
order by week_number, action;




