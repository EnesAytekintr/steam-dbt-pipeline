WITH dim_media AS (
    SELECT
    *
    FROM {{ ref('int_media') }}
)
SELECT * FROM dim_media
{{ log('Media dimension created successfully.', info=True) }}