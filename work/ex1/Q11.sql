SELECT country_id, COUNT(country_id)
FROM city
GROUP BY
    country_id
HAVING
    COUNT(country_id) >= 20
ORDER BY count DESC;