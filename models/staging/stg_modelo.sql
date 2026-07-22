with source as (

    select *
    from {{ source('raw', 'modelo') }}

),

renamed as (

    select

        modelo_id,
        marca_id,

        initcap(trim(nome)) as nome,

        ano_modelo,

        case
            when upper(trim(cambio)) = 'AUTOMATICO' then 'Automático'
            when upper(trim(cambio)) = 'CVT' then 'CVT'
            when upper(trim(cambio)) = 'S-TRONIC' then 'S-Tronic'
            else initcap(trim(cambio))
        end as cambio,

        initcap(trim(combustivel)) as combustivel

    from source

)

select *
from renamed