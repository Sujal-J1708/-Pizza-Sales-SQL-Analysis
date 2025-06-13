WITH pizza_revenue AS (
SELECT
pizza_types.category,
pizza_types.name AS pizza_type,
ROUND(SUM(order_details.quantity * pizzas.price), 2) AS total_revenue,
ROW_NUMBER() OVER (PARTITION BY pizza_types.category ORDER BY SUM(order_details.quantity * pizzas.price)
DESC) AS revenue_rank
FROM
order_details
JOIN
pizzas ON order_details.pizza_id = pizzas.pizza_id
JOIN
pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY
pizza_types.category, pizza_types.name
)
SELECT
category, pizza_type, total_revenue
FROM
pizza_revenue
WHERE
revenue_rank <= 3
ORDER BY
category, total_revenue DESC;
