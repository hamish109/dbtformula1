with results as (

    select * from {{ ref('fct_results') }}

),

races as (

    select * from {{ ref('dim_races') }}

),

drivers as (

    select * from {{ ref('dim_drivers_snapshot') }}

),

constructors as (

    select * from {{ ref('dim_constructors') }}

),

status as (

    select * from {{ ref('dim_status') }}

),

int_results as (
    select
        results.result_id,
        results.race_id,
        races.race_year,
        races.race_round,
        races.circuit_id,
        races.race_name,
        races.race_date,
        results.race_time,
        results.driver_id,
        results.driver_number,
        cast(datediff('year', drivers.date_of_birth, races.race_date) as int) as drivers_age_years,
        drivers.driver_nationality,
        results.constructor_id,
        constructors.constructor_name,
        constructors.constructor_nationality,
        races.grid,
        races.driver_position,
        results.position_text,
        results.position_order,
        results.points,
        results.laps,
        results.milliseconds,
        results.fastest_lap,
        results.driver_rank,
        results.fastest_lap_time,
        results.fastest_lap_speed,
        results.status_id,
        status.status,
        drivers.forename || ' ' || drivers.surname as driver,
        case when drivers.driver_position is null then 1 else 0 end as dnf_flag
    from results
    left join races
        on results.race_id = races.race_id
    left join drivers
        on results.driver_id = drivers.driver_id
    left join constructors
        on results.constructor_id = constructors.constructor_id
    left join status
        on results.status_id = status.status_id
)

select * from int_results
