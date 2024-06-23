select *
from {{ ref('dim_drivers_snapshot') }}
where driver_number = 40
