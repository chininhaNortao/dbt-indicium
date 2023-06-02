with base as (

    select * 
    from {{ source('northwind_traders','employees') }}

),

final as (
    
    select 	
        *
    from base

)

select * from final