with source as (

    select *
    from {{ source('raw', 'marca') }}

),

renamed as (

    select

        marca_id,

        case
            when upper(trim(nome)) = 'TOYTA' then 'Toyota'
            when upper(trim(nome)) = 'MADZA' then 'Mazda'
            when upper(trim(nome)) = 'MAZDAA' then 'Mazda'
            when upper(trim(nome)) = 'HONDAA' then 'Honda'
            else initcap(nullif(trim(nome), ''))
        end as nome,

        case
            when upper(trim(pais_origem)) = 'JP' then 'Japão'
            when upper(trim(pais_origem)) = 'EUA' then 'Estados Unidos'
            when upper(trim(pais_origem)) = 'UK' then 'Reino Unido'
            else initcap(trim(pais_origem))
        end as pais_origem,

        initcap(nullif(trim(status), '')) as status_marca

    from source

)

select *
from renamed