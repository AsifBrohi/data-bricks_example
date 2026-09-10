WITH source AS (
    SELECT * FROM {{ source("stg","customers")}}
)

,customer_country AS (
    SELECT 
        country
    FROM source
    GROUP BY country
)
SELECT 
    md5(country) as customer_details_sk
    ,country as customer_country
FROM customer_country