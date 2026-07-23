with source as (

    select *
    from {{ source('raw', 'fornecedor') }}

),

renamed as (

    select

        fornecedor_id,
        endereco_id,

        initcap(trim(nome)) as nome,

        nullif(
            {{ apenas_numeros('cnpj') }},
            ''
        ) as cnpj,

        nullif(
            {{ apenas_numeros('telefone') }},
            ''
        ) as telefone,

        lower(trim(email)) as email,

        case
            when upper(trim(status)) = 'ATIVA' then 'Ativo'
            when upper(trim(status)) = 'INATIVA' then 'Inativo'
            else initcap(trim(status))
        end as status_fornecedor

    from source

)

select *
from renamed