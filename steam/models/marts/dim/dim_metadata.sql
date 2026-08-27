WITH dim_metadata AS (
    SELECT
    *
    FROM {{ ref('int_metadata') }}
)
SELECT * FROM dim_metadata
{{ log('Metadata dimension created successfully.', info=True) }}