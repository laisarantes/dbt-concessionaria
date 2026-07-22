with source as (

    select *
    from {{ source('raw', 'cliente') }}

),

renamed as (

    select
        cliente_id,
        endereco_id,

        initcap(trim(nome)) as nome,

        regexp_replace(cpf, '[^0-9]', '', 'g') as cpf,

        nullif(
            regexp_replace(telefone, '[^0-9]', '', 'g'),
            ''
        ) as telefone,

        lower(trim(email)) as email,

        initcap(trim(status)) as status_cliente

    from source

)

select *
from renamed