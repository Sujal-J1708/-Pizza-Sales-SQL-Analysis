SELECT
pizza_types.category,
COUNT(pizzas.pizza_id) AS pizza_count,
ROUND(COUNT(pizzas.pizza_id) * 100.0 / SUM(COUNT(pizzas.pizza_id)) OVER (),
2) AS percentage_of_total
FROM
pizza_types
JOIN
pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
GROUP BY
pizza_types.category
ORDER BY
pizza_count DESC;