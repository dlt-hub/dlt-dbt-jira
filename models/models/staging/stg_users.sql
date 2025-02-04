/* Table: users */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'users' */
    self,
    account_id,
    account_type,
    email_address,
    avatar_urls___48x48,
    avatar_urls___24x24,
    avatar_urls___16x16,
    avatar_urls___32x32,
    display_name,
    active,
    locale,
    _dlt_load_id,
    _dlt_id,
FROM {{ source('raw_data', 'users') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )