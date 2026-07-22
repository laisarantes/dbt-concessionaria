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
            regexp_replace(telefone, '[^0-9]', '', 'g'),
            ''
        ) as telefone,

        lower(trim(email)) as email,

        case
            when upper(trim(status)) = 'ATIVO' then 'Ativo'
            when upper(trim(status)) = 'INATIVO' then 'Inativo'
            else initcap(nullif(trim(status), ''))
        end as status_funcionario

    from source

)

select *
from renamed