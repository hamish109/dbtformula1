WITH pitstops AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['race_id', 'driver_id', 'stop_number']) }} AS pitstop_id,
        race_id,
        driver_id,
        stop_number,
        lap,
        pit_stop_time,
        pit_stop_duration_seconds,
        pit_stop_duration,
        pit_stop_milliseconds,
        max(stop_number) OVER (PARTITION BY race_id, driver_id) AS total_pit_stops_per_race
    FROM {{ ref('stg_formula1__pit_stops') }}
)

SELECT * FROM pitstops
