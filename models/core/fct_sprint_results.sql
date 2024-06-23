WITH sprint_results AS (
    SELECT
        result_id,
        race_id,
        driver_id,
        constructor_id,
        driver_number,
        grid,
        driver_position,
        position_text,
        position_order,
        points,
        laps,
        sprint_time,
        milliseconds,
        fastest_lap,
        fastest_lap_time,
        status_id
    FROM {{ ref('stg_formula1__sprint_results') }}
)

SELECT * FROM sprint_results
