{% macro convert_speed_kph(column_name) %}

{{ column_name }} * 1.60934

{% endmacro %}
