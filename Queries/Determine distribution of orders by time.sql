SELECT
HOUR(order_time) AS hour,
COUNT(order_id) AS order_count,
ROUND(COUNT(order_id) * 100.0 / SUM(COUNT(order_id)) OVER (), 2) AS percentage_of_total,
CASE
WHEN HOUR(order_time) BETWEEN 5 AND 11 THEN 'Morning'
WHEN HOUR(order_time) BETWEEN 12 AND 16 THEN 'Afternoon'
WHEN HOUR(order_time) BETWEEN 17 AND 20 THEN 'Evening'
ELSE 'Night'
END AS time_of_day
FROM orders
GROUP BY
HOUR(order_time),
CASE
WHEN HOUR(order_time) BETWEEN 5 AND 11 THEN 'Morning'
WHEN HOUR(order_time) BETWEEN 12 AND 16 THEN 'Afternoon'
WHEN HOUR(order_time) BETWEEN 17 AND 20 THEN 'Evening'
ELSE 'Night'
END
ORDER BY hour;