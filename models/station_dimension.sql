    WITH BIKE AS (

        SELECT 
        start_station_id as station_id ,
        start_station_name as station_name,
        start_lat as station_lat,
        start_lng as start_station_lng

        FROM 
        {{ source('demo', 'bike') }}

 where RIDE_ID != 'ride_id'


      
    )

    select * from bike