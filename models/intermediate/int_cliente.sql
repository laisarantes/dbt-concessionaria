with cliente as (

    select *
    from {{ ref('stg_cliente') }}

),

endereco as (

    select *
    from {{ ref('stg_endereco') }}

),

joined as (

    select

        c.cliente_id,
        c.nome,
        c.cpf,
        c.telefone,
        c.email,
        c.status_cliente,

        e.endereco_id,
        e.rua,
        e.numero,
        e.bairro,
        e.cidade,
        e.estado,
        e.cep

    from cliente c
    left join endereco e
        on c.endereco_id = e.endereco_id

)

select *
from joined