with
    order_details as (select * from {{ ref("stg_order_details") }}),

    orders_1_product as (

        select t.*
        from order_details t
        where
            not exists (
                select 1
                from order_details t1
                where t1.order_id = t.order_id and t1.product_id <> t.product_id
            )

    )

select 
  order_id,
  (unit_price * quantity)                                      as receita,
  (unit_price * quantity) * discount                           as desconto,
  discount                                                     as porcent_desconto,
  (unit_price * quantity)-((unit_price * quantity) * discount) as faturado
from orders_1_product