{% test positive_value(model, column_name) %}


{{
    config(
        enabled=true,
        severity='error',
        tags = ['bi']
    )
}}


with validation as (

    select
        {{ column_name }} as positive_value_field

    from {{ model }}

),

validation_errors as (

    select
        positive_value_field

    from validation

    where positive_value_field < 0

)

select *
from validation_errors

{% endtest %}
