SELECT 
    co.country_id,
    co.country,
    COUNT(DISTINCT c.customer_id) as customer_count,
    SUM(p.amount) as total_sales
FROM country co
JOIN city ci ON co.country_id = ci.country_id
JOIN address a ON ci.city_id = a.city_id
JOIN customer c ON a.address_id = c.address_id
JOIN rental r ON c.customer_id = r.customer_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY co.country_id, co.country
ORDER BY total_sales DESC;