{{ config(
  enabled=true
) }}
WITH qualifying AS (
    SELECT
        qualifying_id,
        race_id,
        driver_id,
        constructor_id,
        driver_number,
        qualifying_position,
        q1_time,
        q2_time,
        q3_time
    FROM {{ ref('stg_formula1__qualifying') }}
)

SELECT * FROM qualifying
