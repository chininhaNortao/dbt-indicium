with base as (

    select * 
    from {{ source('northwind_traders','shippers') }}

),

final as (
    
    select 	
        *
    from base

)

select * from final