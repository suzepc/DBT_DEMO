WITH CTE AS (
select 
STARTED_AT
from {{ source('demo', 'bike') }}
),
CTE2 AS (
select 
*
from CTE
where STARTED_AT !='started_at'
)
SELECT 
TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,
{{get_dayname('STARTED_AT')}}AS DAY_TYPE,
{{get_season('STARTED_AT')}} AS STATION_OF_YEAR
 FROM CTE2
