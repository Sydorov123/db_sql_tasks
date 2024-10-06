Частина 1.1: Отримання списку фільмів та їх категорій (SELECT)
SELECT 
    f.title AS "Фільм", 
    f.length AS "Тривалість (хв)", 
    c.name AS "Жанр"
FROM 
    film f
JOIN 
    film_category fc ON f.film_id = fc.film_id
JOIN 
    category c ON fc.category_id = c.category_id;



Частина 1.2: Фільми, орендовані певним клієнтом (SELECT)
SELECT 
    cu.first_name AS "Ім'я", 
    cu.last_name AS "Прізвище", 
    f.title AS "Фільм", 
    r.rental_date AS "Оренда"
FROM 
    rental r
JOIN 
    inventory i ON r.inventory_id = i.inventory_id
JOIN 
    film f ON i.film_id = f.film_id
JOIN 
    customer cu ON r.customer_id = cu.customer_id
WHERE 
    cu.customer_id = <Код_клієнта>;


Частина 1.3: Популярність фільмів
SELECT 
    f.title AS "Фільм", 
    COUNT(r.rental_id) AS "Оренд"
FROM 
    rental r
JOIN 
    inventory i ON r.inventory_id = i.inventory_id
JOIN 
    film f ON i.film_id = f.film_id
GROUP BY 
    f.title
ORDER BY 
    COUNT(r.rental_id) DESC
LIMIT 5;



Частина 2.1: Додавання нового клієнта (INSERT)
INSERT INTO customer (first_name, last_name, address_id, store_id, active, create_date)
VALUES (
    'John', 
    'Doe', 
    (SELECT address_id FROM address WHERE address = '789 Oak St' AND city_id = (SELECT city_id FROM city WHERE city = 'Los Angeles')), 
    2, 
    1, 
    NOW()
);



Частина 2.2: Оновлення адреси клієнта (UPDATE)
UPDATE address
SET address = '987 Pine St'
WHERE address_id = (
    SELECT a.address_id 
    FROM customer cu
    JOIN address a ON cu.address_id = a.address_id
    WHERE cu.first_name = 'John' AND cu.last_name = 'Doe'
);



Частина 2.3: Видалення клієнта (DELETE)
DELETE FROM customer
WHERE first_name = 'John' AND last_name = 'Doe';


