WITH source AS (
    SELECT * FROM {{source("stg","product_attributes")}}
)

SELECT 
    {{ dbt.hash(dbt.concat(['s.product_id', 's.color', 's.size', 's.material'])) }} as product_attributes_sk
    ,s.product_id as product_bk
    ,s.color as available_color
    ,s.size as available_size
    ,s.material

FROM source s
