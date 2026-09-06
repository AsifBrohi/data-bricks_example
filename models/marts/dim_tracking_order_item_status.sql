WITH source AS (
    select * from {{source("stg","shippingitems")}}
)

select 
DISTINCT 
md5(status) as status_sk,
status 
from source