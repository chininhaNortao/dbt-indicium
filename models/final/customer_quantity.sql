with t_clientes_unicos as (
    select * from {{ ref('int_customers_month') }}
),

calculo_diferena_quantide as (
    select
        PARSE_DATE('%Y-%m', mes) as mes,
        clientes_unicos,
        clientes_unicos - lag(clientes_unicos) over (order by mes) as diferenca_quantidade,
        round((clientes_unicos - lag(clientes_unicos) over (order by mes)) / lag(clientes_unicos) over (order by mes), 2) as diferenca_porcentagem
    from
        t_clientes_unicos
    order by
        mes
)

select * from calculo_diferena_quantide