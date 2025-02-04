import dlt
from dlt_plus.const import ALLOWED_DBT_VERSION

if __name__ == "__main__":
    """
    Execute this file to run your transformations, you can also just copy this code
    into your main dlt runner file and execute the transformation right after your
    pipeline.run(...) command
    """
    p = dlt.pipeline(pipeline_name="jira_pipeline", destination="duckdb")
    venv = dlt.dbt.get_venv(p, dbt_version=ALLOWED_DBT_VERSION)
    dbt = dlt.dbt.package(p, "dbt_jira_pipeline", venv=venv)

    # run transformations
    models = dbt.run_all(
        # add any additional vars you need in dbt here
        additional_vars={},
        # change this to save your transformation results into another dataset
        destination_dataset_name=p.dataset_name + "_transformed",
    )

    # run tests
    dbt.test(destination_dataset_name=p.dataset_name + "_transformed")