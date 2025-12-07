SELECT 
    cat.category_id,
    cat.name as category,
    COUNT(DISTINCT f.film_id) as rental_count,
    SUM(p.amount) as total_amount
FROM category cat
JOIN film_category fc ON cat.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY cat.category_id, cat.name
ORDER BY total_amount DESC;