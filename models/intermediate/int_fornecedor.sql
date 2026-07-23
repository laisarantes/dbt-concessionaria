with fornecedor as (

    select * from {{ ref('stg_fornecedor') }}

),

endereco as (

    select * from {{ ref('stg_endereco') }}

),

joined as (

    select

        f.fornecedor_id,
        f.nome,
        f.telefone,
        f.email,
        f.status_fornecedor,

        e.rua,
        e.numero,
        e.bairro,
        e.cidade,
        e.estado,
        e.cep

    from fornecedor f

    left join endereco e
        on f.endereco_id = e.endereco_id

)

select *
from joined