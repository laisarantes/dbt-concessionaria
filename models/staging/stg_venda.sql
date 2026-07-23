with source as (

    select *
    from {{ source('raw', 'venda') }}

),

renamed as (

    select

        venda_id,
        cliente_id,
        funcionario_id,
        loja_id,
        veiculo_id,

        data_venda,

        valor_total,

        case
            when upper(trim(status)) in ('CONCLUIDA', 'CONCLUÍDA')
                then 'Concluída'
            else initcap(trim(status))
        end as status_venda

    from source

)

select *
from renamed