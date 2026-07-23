with veiculo as (

    select *
    from {{ ref('stg_veiculo') }}

),

modelo as (

    select *
    from {{ ref('stg_modelo') }}

),

fornecedor as (

    select *
    from {{ ref('stg_fornecedor') }}

),

joined as (

    select

        v.veiculo_id,
        v.modelo_id,
        v.fornecedor_id,

        m.nome as modelo,
        m.ano_modelo,
        m.cambio,
        m.combustivel,

        f.nome as fornecedor,
        f.cnpj,
        f.telefone as telefone_fornecedor,
        f.email as email_fornecedor,
        f.status_fornecedor,

        v.placa,
        v.chassi,
        v.ano_fabricacao,
        v.cor,
        v.quilometragem,
        v.condicao,
        v.status_veiculo,
        v.preco,

        case
            when v.quilometragem = 0 then 'Zero Km'
            when v.quilometragem <= 20000 then 'Baixa'
            when v.quilometragem <= 60000 then 'Média'
            else 'Alta'
        end as faixa_quilometragem,

        case
            when v.preco >= 200000 then 'Premium'
            when v.preco >= 100000 then 'Intermediário'
            else 'Popular'
        end as categoria_preco,

        case
            when v.ano_fabricacao = extract(year from current_date)
                then 'Lançamento'
            else 'Demais'
        end as categoria_ano

    from veiculo v

    inner join modelo m
        on v.modelo_id = m.modelo_id

    inner join fornecedor f
        on v.fornecedor_id = f.fornecedor_id

)

select *
from joined


