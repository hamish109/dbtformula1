with circuits as (select * from {{ source('formula1', 'circuits') }}),

renamed as (
    select
        circuitid as circuit_id,
        circuitref as circuit_ref,
        name as circuit_name,
        location as circuit_location,
        country as circuit_country,
        lat as latitude,
        lng as longitude,
        url as circuit_url,
        to_number(iff(contains(alt, 'N'), null, alt)) as altitude
    from circuits
)

select *
from renamed
