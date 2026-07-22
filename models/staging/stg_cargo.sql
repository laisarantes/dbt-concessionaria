with source as (

    select *
    from {{ source('raw', 'cargo') }}

),

renamed as (

    select
        cargo_id,

        case
            when upper(trim(nome)) = 'VENDEDR' then 'Vendedor'
            when upper(trim(nome)) = 'GERENTEE' then 'Gerente'
            when upper(trim(nome)) = 'CONSLTOR' then 'Consultor'
            when upper(trim(nome)) = 'ANALISTAA' then 'Analista'
            when upper(trim(nome)) = 'MECANICO' then 'Mecânico'
            else initcap(nullif(trim(nome), ''))
        end as nome

    from source

)

select *
from renamed