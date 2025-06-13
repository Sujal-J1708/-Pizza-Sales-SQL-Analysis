SELECT
orders.order_date,
DAYNAME(orders.order_date) AS day_name,
COUNT(DISTINCT orders.order_id) AS total_orders,
SUM(order_details.quantity) AS total_pizzas,
ROUND(SUM(order_details.quantity) * 1.0 / COUNT(DISTINCT orders.order_id),
2) AS avg_pizzas_per_order,
MIN(order_details.quantity) AS min_pizzas_in_order,
MAX(order_details.quantity) AS max_pizzas_in_order
FROM
orders
JOIN
order_details ON orders.order_id = order_details.order_id
GROUP BY orders.order_date
ORDER BY orders.order_date;