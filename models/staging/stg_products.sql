with base as (

    select * 
    from {{ source('northwind_traders','products') }}

),

final as (
    
    select 	
        *
    from base

)

select * from final