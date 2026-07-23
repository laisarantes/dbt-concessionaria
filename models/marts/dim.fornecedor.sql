with fornecedor as (
    select * from {{ ref('int_fornecedor') }}
)

select *
from fornecedor