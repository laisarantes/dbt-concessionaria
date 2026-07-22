with source as (

    select *
    from {{ source('raw', 'veiculo') }}

),

renamed as (

    select

        veiculo_id,
        modelo_id,
        fornecedor_id,

        upper(trim(chassi)) as chassi,

        initcap(trim(cor)) as cor,

        ano_fabricacao,

        case
            when upper(trim(status)) = 'DISPONIVEL' then 'Disponível'
            when upper(trim(status)) = 'DISPONÍVEL' then 'Disponível'
            when upper(trim(status)) = 'VENDIDO' then 'Vendido'
            when upper(trim(status)) = 'RESERVADO' then 'Reservado'
            else initcap(trim(status))
        end as status_veiculo,

        preco

    from source

)

select *
from renamed