{{ config(
    materialized='ephemeral'
)}}

with customers as (
    select * from {{ ref('stg_customers')}}
),

orders as  (
    select * from {{ ref('stg_orders' )}}
),

repeat_customers as (
    select
        customer_id,
        COUNT(DISTINCT order_id) as num_orders,
        status

    from orders
    group by customer_id, status      
        
),

final as (
    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        repeat_customers.num_orders,
        repeat_customers.status

    from customers
    left join repeat_customers using (customer_id)
    where num_orders > 1
)

select * from final
order by num_orders desc