with cargo as (
    select * from {{ ref('stg_cargo') }}
)

select *
from cargo