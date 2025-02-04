/* Table: issues__changelog__histories */
/* Parent: { parent }} */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}
-- depends_on: {{ ref('stg_issues') }}

SELECT
/* select which columns will be available for table 'issues__changelog__histories' */
    id,
    author__self,
    author__account_id,
    author__email_address,
    author__avatar_urls,
    author__display_name,
    author__active,
    author__time_zone,
    author__account_type,
    created,
    _dlt_parent_id,
    _dlt_list_idx,
    _dlt_id,
FROM {{ source('raw_data', 'issues__changelog__histories') }}

/* we only load table items if the parent table has the parent item */
WHERE _dlt_parent_id IN ( SELECT _dlt_id FROM {{ ref('stg_issues') }} )
