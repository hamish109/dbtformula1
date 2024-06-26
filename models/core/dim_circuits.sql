{{ config(
    tags=["dimension", "track"]
) }}

WITH circuits AS (
    SELECT * FROM {{ ref('stg_formula1__circuits') }}
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['circuit_id']) }}      AS dim_circuit_id,
   *
FROM circuits