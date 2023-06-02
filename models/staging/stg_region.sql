with base as (

    select * 
    from {{ source('northwind_traders','region') }}

),

final as (
    
    select 	
        *
    from base

)

select * from final