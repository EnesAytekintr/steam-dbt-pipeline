{{
    config(
        materialized = 'incremental',
        unique_key = 'pk_surrogate_key',
        on_schema_change = 'fail',
        tags = ["fact"]
    )
}}

WITH game_metrics AS (
    SELECT
    * 
    FROM {{ ref('int_game_metrics') }}

    {% if is_incremental() %}
    {{ log('Prior data found...') }}
    WHERE pk_surrogate_key
    NOT IN 
    (SELECT pk_surrogate_key FROM {{ this }} WHERE pk_surrogate_key IS NOT NULL)
    {% endif %}
),

int_date AS (
    SELECT
    pk_release_date_id
    FROM {{ ref('int_date') }}
),

int_game AS (
    SELECT
    pk_game_id
    FROM {{ ref('int_game') }}
),

int_media AS (
    SELECT 
    pk_media_id
    FROM {{ ref('int_media') }}
),

int_metadata AS (
    SELECT 
    pk_metadata_id
    FROM {{ ref('int_metadata') }}
),

int_platform AS (
    SELECT
    pk_game_platform_id
    FROM {{ ref('int_platform') }}
),

fct_game_metrics AS (
    SELECT
        gm.*,
        dd.pk_release_date_id AS fk_release_date_id,
        dg.pk_game_id AS fk_game_id,
        dm.pk_media_id AS fk_media_id,
        dmd.pk_metadata_id AS fk_metadata_id,
        dp.pk_game_platform_id AS fk_game_platform_id
    FROM game_metrics gm   
    LEFT JOIN int_date dd ON gm.pk_surrogate_key = dd.pk_release_date_id
    LEFT JOIN int_game dg ON gm.pk_surrogate_key = dg.pk_game_id
    LEFT JOIN int_media dm ON gm.pk_surrogate_key = dm.pk_media_id
    LEFT JOIN int_metadata dmd ON gm.pk_surrogate_key = dmd.pk_metadata_id
    LEFT JOIN int_platform dp ON gm.pk_surrogate_key = dp.pk_game_platform_id
)

SELECT * 
FROM fct_game_metrics
{{ log('Fact icremental table created successfully.', info=True) }}
