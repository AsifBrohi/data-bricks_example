--models/marts/dim_tracking_order_item_carriers

WITH source AS (
    select * from {{ source('stg','shippingitems')}}
)

, build_carrier AS (
    SELECT carrier
    FROM source 
    GROUP BY carrier
)
SELECT
    md5(carrier) as carrier_sk
    ,carrier
FROM build_carrier