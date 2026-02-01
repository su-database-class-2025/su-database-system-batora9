SELECT country_id, COUNT(country_id)
FROM city
GROUP BY
    country_id
ORDER BY count DESC;