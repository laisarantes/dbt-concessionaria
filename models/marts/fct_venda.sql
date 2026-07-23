with venda as (

    select *
    from {{ ref('stg_venda') }}

),

joined as (

    select

        v.venda_id,

        v.cliente_id,
        v.funcionario_id,
        v.loja_id,
        v.veiculo_id,

        v.data_venda,
        v.valor_total,
        v.status_venda,

        case
            when v.valor_total >= 200000 then 'Premium'
            when v.valor_total >= 100000 then 'Intermediária'
            else 'Popular'
        end as categoria_venda,

        case
            when extract(month from v.data_venda) between 1 and 3 then '1º Trimestre'
            when extract(month from v.data_venda) between 4 and 6 then '2º Trimestre'
            when extract(month from v.data_venda) between 7 and 9 then '3º Trimestre'
            else '4º Trimestre'
        end as trimestre

    from venda v

)

select *
from joined