with source as (

    select *
    from {{ source('raw', 'cliente') }}

),

renamed as (

    select

        cliente_id,
        endereco_id,

        initcap(trim(nome)) as nome,

        nullif(
            {{ apenas_numeros('cpf') }},
            ''
        ) as cpf,

        nullif(
            {{ apenas_numeros('telefone') }},
            ''
        ) as telefone,

        lower(trim(email)) as email,

        initcap(trim(status)) as status_cliente

    from source

)

select *
from renamed