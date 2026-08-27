{% snapshot scd_march2025 %}
{{
    config(
        target_schema='dev',
        unique_key='appid',
        updated_at='updated_at',
        strategy='timestamp',
        invalidates_hard_deletes=True
    )
}}

SELECT 
    appid,
    "name",
    release_date,
    required_age,
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
    updated_at::TIMESTAMP AS updated_at
FROM {{ source('steam', 'steam_march2025') }}

{% endsnapshot %}