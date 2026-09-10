WITH source AS (
    SELECT * FROM {{ source("stg","shippingitems")}}
)
,countries AS (
    SELECT * FROM {{ ref("dim_tracking_order_countries")}}
) 

,carriers AS (
    SELECT * FROM {{ ref("dim_tracking_order_item_carriers")}}
)
,status_build AS (
    SELECT * FROM {{ ref("dim_tracking_order_item_status")}}
)

SELECT
    md5(s.tracking_id) AS tracking_sk
    ,s.tracking_id AS tracking_bk
    ,CONCAT_WS(',',s.street,s.city,s.state_or_region,s.zip_code) AS address
    ,s.zip_code
    ,s.estimated_delivery_date
    ,s.cost
    ,c.tracking_order_country_sk
    ,ca.carrier_sk
    ,st.status_sk
FROM source s
LEFT JOIN countries c ON c.tracking_order_country = s.country
LEFT JOIN carriers ca ON ca.carrier = s.carrier
LEFT JOIN status_build st ON st.status = s.status
GROUP BY
    s.tracking_id
    ,s.street
    ,s.city
    ,s.state_or_region
    ,s.zip_code
    ,s.estimated_delivery_date
    ,s.cost
    ,c.tracking_order_country_sk
    ,ca.carrier_sk
    ,st.status_sk