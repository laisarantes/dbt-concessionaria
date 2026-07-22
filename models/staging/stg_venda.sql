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
            when upper(trim(status)) = 'CONCLUIDA' then 'Concluída'
            when upper(trim(status)) = 'CONCLUÍDA' then 'Concluída'
            when upper(trim(status)) = 'CANCELADA' then 'Cancelada'
            when upper(trim(status)) = 'PENDENTE' then 'Pendente'
            else initcap(trim(status))
        end as status_venda

    from source

)

select *
from renamed