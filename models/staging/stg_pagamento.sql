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

        quantidade_parcelas,

        coalesce(desconto, 0) as desconto,

        case
            when upper(trim(status_pagamento)) = 'PAGO'
                then 'Pago'

            when upper(trim(status_pagamento)) = 'CANCELADO'
                then 'Cancelado'

            when upper(trim(status_pagamento)) = 'PENDENTE'
                then 'Pendente'

            else initcap(trim(status_pagamento))

        end as status_pagamento,

        data_pagamento

    from source

)

select *
from renamed