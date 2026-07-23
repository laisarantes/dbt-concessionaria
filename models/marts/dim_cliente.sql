with cliente as (
    select * from {{ ref('int_cliente') }}
)

select *
from cliente