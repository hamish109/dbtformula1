WITH status AS (
    SELECT
        status_id,
        status
    FROM {{ ref('stg_formula1__status') }}
)

SELECT * FROM status
