WITH source AS (
    SELECT * FROM {{ source("stg","customers")}}
)

,customers_grouped AS (
    SELECT 
        customer_id
        ,name
        ,email
        ,street
        ,city
        ,state_or_region
        ,zip_code
        ,country
        ,loyalty_tier
    FROM source
    GROUP BY
     customer_id
        ,name
        ,email
        ,street
        ,city
        ,state_or_region
        ,zip_code
        ,country
        ,loyalty_tier

)
SELECT 
    md5(customer_id) as customer_details_sk
    ,customer_id as customer_bk
    ,name as customer_name
    ,email as customer_email
    ,CONCAT_WS(',',street,city,state_or_region,zip_code) as customer_address
    ,zip_code
    ,country
FROM customers_grouped