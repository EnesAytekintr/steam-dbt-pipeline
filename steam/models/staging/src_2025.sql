WITH src_2025 AS (
    SELECT 
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
    release_date,
    price,
    discount,
    dlc_count,
    achievements,
    user_score,
    score_rank,
    metacritic_score,
    metacritic_url,
    positive,
    negative,
    recommendations,
    estimated_owners,
    peak_ccu,
    pct_pos_total,
    pct_pos_recent,
    num_reviews_total,
    num_reviews_recent,
    average_playtime_forever,
    average_playtime_2weeks,
    median_playtime_forever,
    median_playtime_2weeks,
    detailed_description,
    short_description,
    about_the_game,
    notes,
    reviews,
    support_url,
    support_email,
    website,
    header_image,
    screenshots,
    movies,
    developers,
    publishers,
    categories,
    genres,
    tags,
    supported_languages,
    full_audio_languages,
    packages,
    "windows",
    linux,
    mac,
    dbt_scd_id,
    dbt_valid_from,
    dbt_valid_to,
    dbt_valid_to IS NULL AS is_current
    FROM {{ ref('scd_march2025') }}
)
SELECT * FROM src_2025
{{ log("Staging completed successfully.", info=True) }}