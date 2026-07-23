with source as (

    select *
    from {{ source('raw', 'funcionario') }}

),

renamed as (

    select

        funcionario_id,

        cargo_id,

        loja_id,

        initcap(trim(nome)) as nome,

        nullif(
            {{ apenas_numeros('telefone') }},
            ''
        ) as telefone,

        lower(trim(email)) as email,

        initcap(nullif(trim(status), '')) as status_funcionario

    from source

)

select *
from renamed