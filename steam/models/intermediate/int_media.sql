WITH int_media AS (
    SELECT
    {{ dbt_utils.generate_surrogate_key(['appid', 'dbt_scd_id']) }} AS pk_media_id,
    appid,
    header_image,
    screenshots,
    movies,
    dbt_scd_id,
    dbt_valid_from,
    dbt_valid_to,
    dbt_valid_to IS NULL AS is_current
    FROM {{ ref('src_2025') }}
)
SELECT * FROM int_media
{{ log('Intermediate media table created successfully.', info=True) }}