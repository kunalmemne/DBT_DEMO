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
END AS DAY_TYPE ,

{{get_season('STARTED_AT')}} AS STATION_YEAR

FROM 
{{ source('demo', 'bike') }}
where STARTED_AT != 'started_at'

)

select * from cte