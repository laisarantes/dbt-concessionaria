with loja as (
    select * from {{ ref('int_loja') }}
)

select *
from loja