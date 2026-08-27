WITH int_game AS (
    SELECT
    {{ dbt_utils.generate_surrogate_key(['appid', 'dbt_scd_id']) }} AS pk_game_id,
    appid,
    CASE
        WHEN
        "name" IS NULL THEN 'N/A'
        ELSE
        "name"
    END AS "name", 
    CASE
        WHEN 
        required_age < 0 THEN 0
        ELSE
        required_age
    END AS required_age, 
    detailed_description,
    short_description,
    about_the_game AS about_game,
    notes,
    reviews,
    support_url,
    support_email,
    website,
    dbt_scd_id,
    dbt_valid_from,
    dbt_valid_to,
    dbt_valid_to IS NULL AS is_current
    FROM {{ ref('src_2025') }}
)
SELECT * FROM int_game
{{ log('Intermediate game table created successfully.', info=True) }}