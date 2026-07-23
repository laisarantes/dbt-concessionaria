with source as (

    select *
    from {{ source('raw', 'pagamento') }}

),

renamed as (

    select

        pagamento_id,

        venda_id,

        case
            when upper(trim(forma_pagamento)) in
                ('CARTAO DE CREDITO', 'CARTÃO DE CRÉDITO')
                then 'Cartão de Crédito'

            when upper(trim(forma_pagamento)) in
                ('TRANSFERENCIA', 'TRANSFERÊNCIA')
                then 'Transferência'

            else initcap(trim(forma_pagamento))

        end as forma_pagamento,

        coalesce(quantidade_parcelas, 1) as quantidade_parcelas,

        coalesce(desconto, 0) as desconto,

        initcap(trim(status_pagamento)) as status_pagamento,

        data_pagamento

    from source

)

select *
from renamed