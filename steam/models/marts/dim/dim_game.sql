WITH dim_game AS (
    SELECT 
    *
    FROM {{ ref('int_game') }}
)
SELECT * FROM dim_game
{{ log('Game dimension created successfully.', info=True) }}