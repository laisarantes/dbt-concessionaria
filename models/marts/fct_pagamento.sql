with pagamento as (

    select *
    from {{ ref('stg_pagamento') }}

),

venda as (

    select *
    from {{ ref('stg_venda') }}

),

joined as (

    select

        p.pagamento_id,
        p.venda_id,

        p.forma_pagamento,
        p.quantidade_parcelas,
        p.desconto,

        case
            when p.quantidade_parcelas = 1
                then 'À Vista'
            else 'Parcelado'
        end as tipo_pagamento,

        case
            when p.desconto > 0
                then 'Sim'
            else 'Não'
        end as possui_desconto,

        (v.valor_total - p.desconto) as valor_liquido,

        case
            when p.data_pagamento is null
                then 'Não'
            else 'Sim'
        end as pagamento_realizado,

        p.status_pagamento,
        p.data_pagamento,

        v.data_venda,
        v.valor_total,
        v.status_venda

    from pagamento p

    inner join venda v
        on p.venda_id = v.venda_id

)

select *
from joined