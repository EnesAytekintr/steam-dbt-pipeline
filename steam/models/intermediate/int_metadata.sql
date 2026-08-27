WITH int_metadata AS (
    SELECT
    {{ dbt_utils.generate_surrogate_key(['appid', 'dbt_scd_id']) }} AS pk_metadata_id,
    appid,
    developers,
    publishers,
    categories,
    genres,
    tags,
    supported_languages,
    full_audio_languages,
    packages,
    dbt_scd_id,
    dbt_valid_from,
    dbt_valid_to,
    dbt_valid_to IS NULL AS is_current
    FROM {{ ref('src_2025') }}
)
SELECT * FROM int_metadata
{{ log('Intermediate metadata table created successfully.', info=True) }}