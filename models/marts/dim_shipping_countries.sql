with source AS (
    select * from {{source("stg","shippingitems")}}
)

select 
DISTINCT 
md5(country) as country_sk,
country
from source