with results as (

    select * 
    from {{ ref('stg_formula1__results') }}

),

renamed as (

    select
        *,
        round({{ convert_speed_kph('fastest_lap_speed') }},3) as fastest_lap_speed_kph
    from results

)

select * from renamed
