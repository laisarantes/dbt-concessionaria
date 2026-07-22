with source as (

    select *
    from {{ source('raw', 'loja') }}

),

renamed as (

    select
        loja_id,
        endereco_id,

        initcap(trim(nome)) as nome,

        nullif(
            regexp_replace(telefone, '[^0-9]', '', 'g'),
            ''
        ) as telefone,

        lower(trim(email)) as email,

        initcap(trim(status)) as status_loja

    from source

)

select *
from renamed