with orders as (
    select * from {{ ref("stg_orders") }}
),

clientes_por_mes as (
    select
        format_timestamp('%Y-%m', order_date) as mes,
        count(distinct customer_id) as clientes_unicos
    from orders
    group by mes
    order by mes asc
)

select * from clientes_por_mes