https://quickstarts.snowflake.com/

# Notes

- Tables
    - Transient
    - Temporary
    - Permanent
    - External
- Stages
    - User
    - Table
    - Named
    - External
- Time travel
    - 1 day standard
    - 90 days enterprise
    - 7 days extra in fail safe (requires asking support)
- Usage
    - SNOWFLAKE.ACCOUNT_USAGE.QUERY_HISTORY 365 days
    - Query history 14 days
- Cache
    - Cache will be only used if the queries are identical including letter casing
    - Query result Caches last 24 hours, time restart every timegets queried until 31 days
    - Warehouse Cache is cleared when warehouse gets suspended
    - Warehouse cache on ssd while on
- Conda
    - conda create -n sandbox python=3.9
    - conda activate my_python311_env
- Udf
    - Scalar
    - Vector ( receice and output pandas)
    - Tabular
    - Named or anonymous
    - They live in a stage if named
    - Anonymous are just lambdas
