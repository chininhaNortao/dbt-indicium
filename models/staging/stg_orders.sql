with base as (

    select * 
    from {{ source('northwind_traders','orders') }}

),

final as (
    
    select 	
        *
    from base

)

select * from final