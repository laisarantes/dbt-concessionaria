with source as (

    select *
    from {{ source('raw', 'endereco') }}

),

renamed as (

    select
        endereco_id,

        initcap(trim(rua)) as rua,

        nullif(trim(numero), '') as numero,

        case
            when upper(trim(bairro)) = 'COCO' then 'Cocó'
            else initcap(trim(bairro))
        end as bairro,

        case
            when upper(trim(cidade)) = 'MARACANAU' then 'Maracanaú'
            when upper(trim(cidade)) = 'QUIXADA' then 'Quixadá'
            else initcap(trim(cidade))
        end as cidade,

        case
            when upper(trim(estado)) in ('CE', 'CEARÁ') then 'CE'
            else upper(trim(estado))
        end as estado,

        nullif(
           {{apenas_numeros('cep')}}, 
           ''
        ) as cep

    from source

)

select *
from renamed