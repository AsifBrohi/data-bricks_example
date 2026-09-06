--models/marts/dim_tracking_order_item_carriers

with source AS (
    select * from {{ source('stg','shippingitems')}}
)

, carrier AS (
    select carrier
    from source 
    group by carrier
)
select 
md5(carrier) as carrier_sk,
carrier
from carrier