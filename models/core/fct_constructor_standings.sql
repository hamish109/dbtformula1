WITH constructor_standings AS (
    SELECT
        constructor_standings_id,
        race_id,
        constructor_id,
        points,
        constructor_position,
        position_text,
        wins
    FROM {{ ref('stg_formula1__constructor_standings') }}
)

SELECT * FROM constructor_standings
