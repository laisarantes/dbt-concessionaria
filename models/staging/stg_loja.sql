with source as (
    SELECT * FROM {{source('raw', 'loja')}}
)

renamed as (
   SELECT
   loja_id,
   endereco_id,
   initcap(trim(nome)) as nome,
   regexp_replace(telefone, '[0-9]')



    from source
)

SELECT * FROM renamed