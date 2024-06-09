with results as (

    select * from {{ ref('stg_formula1__results') }}

),

renamed as (

    select
        *,
        {{ convert_speed_kph('fastest_lap_speed') }} as fastest_lap_speed_kph
    from results

)

select * from renamed