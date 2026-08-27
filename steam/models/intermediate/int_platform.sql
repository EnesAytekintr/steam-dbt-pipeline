WITH int_platform AS (
    SELECT
    {{ dbt_utils.generate_surrogate_key(['appid', 'dbt_scd_id']) }} AS pk_game_platform_id,
    appid,
    "windows" AS is_windows,
    linux AS is_linux,
    mac AS is_mac,
    dbt_scd_id,
    dbt_valid_from,
    dbt_valid_to,
    dbt_valid_to IS NULL AS is_current
    FROM {{ ref('src_2025') }}
)
SELECT * FROM int_platform
{{ log('Intermediate platform table created successfully.', info=True) }}