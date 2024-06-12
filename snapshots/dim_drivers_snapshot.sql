
{% snapshot dim_drivers_snapshot %}

{{
   config(
       unique_key='driver_id',
       strategy='check',
       check_cols = 'all',
       post_hook = ["CREATE OR REPLACE VIEW FORMULA1_DEV.DEV_PUBLIC.{{this.identifier}} AS SELECT * FROM {{this}};"],
   )
}}

SELECT * FROM {{ ref('stg_formula1__drivers') }}

{% endsnapshot %}



--{{ env_var('DBT_DATABASE') }}
