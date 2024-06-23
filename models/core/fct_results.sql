{{ config(
    tags=["race", "laptimes"],
    materialized = "incremental",
    unique_key = "result_id",
    incremental_strategy='delete+insert',
    on_schema_change='fail'
) }}

WITH results AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['result_id']) }} AS fct_result_id,
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
        race_time,
        milliseconds,
        fastest_lap,
        driver_rank,
        fastest_lap_time,
        fastest_lap_speed,
        status_id,
        fastest_lap_speed_kph
    FROM {{ ref('int_results_convert_speed') }}
)

SELECT * FROM results
