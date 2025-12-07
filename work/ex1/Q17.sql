SELECT 
    cat.category_id,
    cat.name as category,
    ROUND(AVG(EXTRACT(DAY FROM r.return_date - r.rental_date)), 2) as avg_rental_days
FROM category cat
JOIN film_category fc ON cat.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.return_date IS NOT NULL
GROUP BY cat.category_id, cat.name
ORDER BY avg_rental_days DESC;