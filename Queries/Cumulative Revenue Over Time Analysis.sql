SELECT
orders.order_date,
ROUND(SUM(order_details.quantity * pizzas.price), 2) AS daily_revenue,
ROUND(SUM(SUM(order_details.quantity * pizzas.price)) OVER (ORDER BY orders.order_date), 2)
AS cumulative_revenue
FROM
orders
JOIN
order_details ON orders.order_id = order_details.order_id
JOIN
pizzas ON order_details.pizza_id = pizzas.pizza_id
GROUP BY
orders.order_date
ORDER BY
orders.order_date;