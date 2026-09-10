WITH source AS (
    select * from {{ source("stg","shippingitems")}}
)

,build_status AS (
    SELECT 
        status
    FROM source
    GROUP BY status
    
)
SELECT
    md5(status) as status_sk
    ,status
FROM build_status