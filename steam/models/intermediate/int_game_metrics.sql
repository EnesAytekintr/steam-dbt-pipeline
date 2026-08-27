WITH int_game_metrics AS (
    SELECT
    {{ dbt_utils.generate_surrogate_key(['appid', 'dbt_scd_id']) }} AS pk_surrogate_key,
    appid,
    price AS current_price,
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
    dbt_scd_id,
    dbt_valid_from,
    dbt_valid_to,
    dbt_valid_to IS NULL AS is_current
    FROM {{ ref('src_2025') }}
)
SELECT * FROM int_game_metrics
{{ log('Intermediate game metrics table created successfully.', info=True) }}