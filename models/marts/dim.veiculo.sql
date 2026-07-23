with veiculo as (
    select * from {{ ref('int_veiculo') }}
)

select *
from veiculo