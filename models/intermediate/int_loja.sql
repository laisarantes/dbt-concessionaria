with loja as (

    select * from {{ ref('stg_loja') }}

),

endereco as (

    select * from {{ ref('stg_endereco') }}

),

joined as (

    select

        l.loja_id,
        l.nome,
        l.telefone,
        l.email,
        l.status_loja,

        e.rua,
        e.numero,
        e.bairro,
        e.cidade,
        e.estado,
        e.cep

    from loja l

    left join endereco e
        on l.endereco_id = e.endereco_id

)

select *
from joined