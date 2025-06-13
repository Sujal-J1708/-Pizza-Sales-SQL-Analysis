SELECT maximize profits.
pizza_types.name AS pizza_type,
ROUND(SUM(order_details.quantity * pizzas.price), 2) AS total_revenue
FROM
order_details
JOIN
pizzas ON order_details.pizza_id = pizzas.pizza_id
JOIN
pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY
pizza_types.name
ORDER BY
total_revenue DESC
LIMIT 3;