WITH source AS (
    SELECT * FROM {{source("stg","shippingitems")}}
)

,build_country AS (
    SELECT country 
    FROM source 
    GROUP BY country
) 
SELECT 
    md5(country) AS tracking_order_country_sk
    ,country AS tracking_order_country
FROM build_country