-- Sum of all points should be a positive number - of course it will be but this is a test of a test!
-- Fail if we return negative points
select
    race_id,
    sum(points) as total_points
from {{ ref('int_results_convert_speed' )}}
group by 1
having total_points < 0