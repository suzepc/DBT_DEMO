with daily_weather as(

    select
     date(time) as daily_weather,
    weather,
    temp,
    pressure,
    humidity,
    clouds

      from {{source('demo','weather')}}

),
daily_weather_agg as(
 SELECT 
 daily_weather,
 weather,
round(avg(temp),2) as  avg_temp,
round(avg(pressure),2) as avg_pressure,
round(avg(humidity),2) as avg_humidity,
round(avg(clouds),2) as avg_clouds
 FROM daily_weather  
 GROUP BY daily_weather,weather
 qualify  ROW_NUMBER() OVER (PARTITION BY daily_weather order by COUNT(weather) desc )=1
)
select * from daily_weather_agg