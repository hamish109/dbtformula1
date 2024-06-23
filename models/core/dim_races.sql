WITH races AS (
    SELECT
        race_id,
        race_year,
        race_round,
        circuit_id,
        race_name,
        race_date,
        race_time,
        --race_url        AS race_url,
        fp1_date,
        fp1_time,
        fp2_date,
        fp2_time,
        fp3_date,
        fp3_time,
        quali_date,
        quali_time,
        sprint_date,
        sprint_time
    FROM {{ ref('stg_formula1__races') }}
)

SELECT * FROM races
