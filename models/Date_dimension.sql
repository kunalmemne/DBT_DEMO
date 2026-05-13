WITH CTE AS (
SELECT

STARTED_AT,
TO_TIMESTAMP(started_at) AS TIMESTAMP
,DATE(TO_TIMESTAMP(started_at)) AS DATE_STARTED_AT
,HOUR(TO_TIMESTAMP(started_at)) AS HOUR_STARTED_AT 
,
CASE 
WHEN DAYNAME(TO_TIMESTAMP(started_at))  IN ('Sat' , 'Sun')
then 'WEEKEND'
ELSE 'WEEKDAY' 
END AS DAY_TYPE 

,
CASE 
WHEN MONTH (TO_TIMESTAMP(started_at)) IN (12 ,1 ,2 )
THEN 'WINTER'
WHEN MONTH (TO_TIMESTAMP(started_at)) IN (3 ,4 ,5 )
THEN 'SPRING'
WHEN MONTH (TO_TIMESTAMP(started_at)) IN (6 ,7 ,8 )
THEN 'SUMMER'
ELSE 'AUTUMN'
END AS STATION_YEAR

FROM 
{{ source('demo', 'bike') }}
where STARTED_AT != 'started_at'

)

select * from cte