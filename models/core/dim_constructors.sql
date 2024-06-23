WITH constructors AS (
    SELECT * FROM {{ ref('stg_formula1__constructors') }}
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['constructor_id']) }} AS dim_constructor_id,
    constructor_id,
    constructor_ref,
    constructor_name,
    constructor_nationality
--constructor_url                         AS constructor_url
FROM constructors
