with t_clientes_unicos as (
    select * from {{ ref('int_customers_month') }}
)

select
    mes,
    clientes_unicos,
    clientes_unicos - lag(clientes_unicos) over (order by mes) as diferenca_quantidade,
    round((clientes_unicos - lag(clientes_unicos) over (order by mes)) / lag(clientes_unicos) over (order by mes), 2) as diferenca_porcentagem
from
    t_clientes_unicos
order by
    mes