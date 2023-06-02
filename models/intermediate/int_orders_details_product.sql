with
    order_details as (
        select * from {{ ref("stg_order_details") }}
)


select 
  order_id,
  product_id,
  (unit_price * quantity) as receita,
  (unit_price * quantity) * discount as desconto,
  discount as porcent_desconto,
  (unit_price * quantity)-((unit_price * quantity) * discount) as faturado
from order_details