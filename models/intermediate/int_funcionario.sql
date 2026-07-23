with funcionario as (

    select *
    from {{ ref('stg_funcionario') }}

),

cargo as (

    select *
    from {{ ref('stg_cargo') }}

),

loja as (

    select *
    from {{ ref('stg_loja') }}

),

joined as (

    select

        f.funcionario_id,

        f.cargo_id,
        c.nome as cargo,

        f.loja_id,
        l.nome as loja,

        f.nome,
        f.telefone,
        f.email,
        f.status_funcionario

    from funcionario f

    left join cargo c
        on f.cargo_id = c.cargo_id

    left join loja l
        on f.loja_id = l.loja_id

)

select *
from joined