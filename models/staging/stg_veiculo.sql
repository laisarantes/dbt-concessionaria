with source as (

    select *
    from {{ source('raw', 'veiculo') }}

),

renamed as (

    select

        veiculo_id,
        modelo_id,
        fornecedor_id,

        upper(trim(placa)) as placa,

        upper(trim(chassi)) as chassi,

        ano_fabricacao,

        initcap(trim(cor)) as cor,

        quilometragem,

        initcap(trim(condicao)) as condicao,

        case
            when upper(trim(status)) in ('DISPONIVEL', 'DISPONÍVEL')
                then 'Disponível'
            else initcap(trim(status))
        end as status_veiculo,

        preco

    from source

)

select *
from renamed