WITH seasons AS (
    SELECT
        season_year,
        season_url
    FROM {{ ref('stg_formula1__seasons') }}
)

SELECT * FROM seasons
