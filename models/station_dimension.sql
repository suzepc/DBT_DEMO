with BIKE as(
SELECT 
distinct
start_statio_id as station_id,
start_station_name,
start_lat,
start_lng
from {{source('demo','bike')}}
where RIDE_ID !='ride_id'
)
select * from BIKE