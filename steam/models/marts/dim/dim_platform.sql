WITH dim_platform AS (
    SELECT
    *
    FROM {{ ref('int_platform') }}
)
SELECT * FROM dim_platform
{{ log('Platform dimension created successfully.', info=True) }}