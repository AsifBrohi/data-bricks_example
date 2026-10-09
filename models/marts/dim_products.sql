WITH source AS (
    SELECT * FROM {{source("stg","products")}}
)
,product_attributes AS (
    SELECT * FROM {{ ref("dim_product_attributes")}}
) 
SELECT
    md5(s.product_id) as product_sk
    ,s.product_id as product_bk
    ,s.name as product_name
    ,s.cost
    ,s.currency
    ,s.created_date
    ,pa.product_attributes_sk
FROM source s 
LEFT JOIN product_attributes pa ON s.product_bk=pa.product_bk