with funcionario as (
    select * from {{ ref('int_funcionario') }}
)

select *
from funcionario