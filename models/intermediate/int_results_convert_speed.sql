with results as (

    select *  --  dbt_utils.star(ref('stg_formula1__results')) - doesn't work with unit test...
    from {{ ref('stg_formula1__results') }}

),

renamed as (

    select
        *,
        round({{ convert_speed_kph('fastest_lap_speed') }}, 3) as fastest_lap_speed_kph
    from results

)

select * from renamed
