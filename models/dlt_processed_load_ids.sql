{{
    config(
        materialized='incremental'
    )
}}
-- depends_on: {{ ref('dim__dlt_loads') }}
-- depends_on: {{ ref('dim_issues') }}
-- depends_on: {{ ref('dim_users') }}
-- depends_on: {{ ref('dim_workflows') }}
-- depends_on: {{ ref('dim_projects') }}
-- depends_on: {{ ref('dim_issues__transitions') }}
-- depends_on: {{ ref('dim_issues__operations__link_groups') }}
-- depends_on: {{ ref('dim_issues__operations__link_groups__groups') }}
-- depends_on: {{ ref('dim_issues__operations__link_groups__links') }}
-- depends_on: {{ ref('dim_issues__changelog__histories') }}
-- depends_on: {{ ref('dim_issues__changelog__histories__items') }}
-- depends_on: {{ ref('dim_projects__issue_types') }}
-- depends_on: {{ ref('dim_projects__project_keys') }}
/* we save all currently active load ids into the processed ids table */
select load_id, {{ current_timestamp() }} as inserted_at FROM {{ ref('dlt_active_load_ids') }}