
{% snapshot dim_drivers_snapshot %}

{{
   config(
       unique_key='driver_id',
       strategy='check',
       check_cols = 'all',
       post_hook = ["CREATE OR REPLACE VIEW {{ env_var('SNOWFLAKE_DATABASE') }}.{{ var('snapshot_view_schema') }}{{ generate_schema_name() }}.{{this.identifier}} AS SELECT * FROM {{this}};"],
   )
}}

SELECT * FROM {{ ref('stg_formula1__drivers') }}

{% endsnapshot %}
