WITH lap_times AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['race_id', 'driver_id', 'lap']) }} AS lap_times_id,
        race_id,
        driver_id,
        lap,
        driver_position,
        lap_time_formatted,
        official_laptime,
        lap_time_milliseconds
    FROM {{ ref('stg_formula1__lap_times') }}
)

SELECT * FROM lap_times
