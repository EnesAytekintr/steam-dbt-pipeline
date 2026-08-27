WITH dim_date AS (
    SELECT
    *
    FROM {{ ref('int_date') }}
)
SELECT * FROM dim_date
{{ log('Date dimension created successfully.', info=True) }}