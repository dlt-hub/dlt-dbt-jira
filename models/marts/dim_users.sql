/* Table: users */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.self,
    t.account_id,
    t.account_type,
    t.email_address,
    t.avatar_urls___48x48,
    t.avatar_urls___24x24,
    t.avatar_urls___16x16,
    t.avatar_urls___32x32,
    t.display_name,
    t.active,
    t.locale,
    t._dlt_load_id,
    t._dlt_id,
FROM  {{ ref('stg_users') }} as t