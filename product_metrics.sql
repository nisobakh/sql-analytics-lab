-- Product Metrics SQL Examples

-- 1. Top 5 customers by total spend
SELECT customer_id, SUM(amount) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;

-- 2. Monthly revenue trend
SELECT DATE_TRUNC('month', order_date) AS month, SUM(amount) AS revenue
FROM orders
GROUP BY month
ORDER BY month;

-- 3. Product category with highest average order value
SELECT category, AVG(amount) AS avg_order_value
FROM orders
GROUP BY category
ORDER BY avg_order_value DESC
LIMIT 1;

-- 4. Daily active users
SELECT COUNT(DISTINCT user_id) AS daily_active_users, DATE(activity_date) AS day
FROM user_activity
GROUP BY day
ORDER BY day DESC;

-- 5. Conversion rate by channel
SELECT channel, 
       COUNT(DISTINCT user_id) FILTER (WHERE converted = TRUE) * 100.0 / COUNT(DISTINCT user_id) AS conversion_rate
FROM marketing_campaigns
GROUP BY channel
ORDER BY conversion_rate DESC;
