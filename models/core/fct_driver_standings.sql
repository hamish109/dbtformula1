WITH driver_standings AS (
    SELECT
        driver_standings_id,
        race_id,
        driver_id,
        driver_points,
        driver_position,
        position_text,
        driver_wins
    FROM {{ ref('stg_formula1__driver_standings') }}
)

SELECT * FROM driver_standings
