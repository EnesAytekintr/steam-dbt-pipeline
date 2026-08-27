WITH int_date AS (
    SELECT 
    {{ dbt_utils.generate_surrogate_key(['appid', 'dbt_scd_id']) }} AS pk_release_date_id,
    appid,
    release_date,
    dbt_scd_id,
    dbt_valid_from,
    dbt_valid_to,
    dbt_valid_to IS NULL AS is_current
    FROM {{ ref('src_2025') }}
)
SELECT * FROM int_date
{{ log('Intermediate date table created successfully.', info=True) }}