{% macro convert_speed_kph(column_name) %}

{{ column_name }} * {{ var("mph_to_kph_factor") }}

{% endmacro %}
