WITH source AS (
    SELECT * FROM {{source("stg","customers")}}
)

customer_details AS (
    SELECT * FROM {{ref("dim_customer_details")}}
)

select * from customer_details