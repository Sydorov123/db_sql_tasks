1.Кількість фільмів у кожній категорії
SELECT 
    c.name AS category_name, 
    COUNT(f.film_id) AS total_films
FROM 
    category c
JOIN 
    film_category fc ON c.category_id = fc.category_id
JOIN 
    film f ON fc.film_id = f.film_id
GROUP BY 
    c.name;


2.Середня тривалість фільмів у кожній категорії
SELECT 
    c.name AS category_name, 
    AVG(f.length) AS avg_length
FROM 
    category c
JOIN 
    film_category fc ON c.category_id = fc.category_id
JOIN 
    film f ON fc.film_id = f.film_id
GROUP BY 
    c.name;

3.Мінімальна та максимальна тривалість фільмів
SELECT 
    MIN(f.length) AS min_length, 
    MAX(f.length) AS max_length
FROM 
    film f;


4.Загальна кількість клієнтів:
SELECT 
    COUNT(customer_id) AS total_customers
FROM 
    customer;


5.Сума платежів для кожного клієнта
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS full_name, 
    SUM(p.amount) AS total_amount
FROM 
    customer c
JOIN 
    payment p ON c.customer_id = p.customer_id
GROUP BY 
    c.customer_id;

6.Топ-5 клієнтів за сумою платежів
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS full_name, 
    SUM(p.amount) AS total_amount
FROM 
    customer c
JOIN 
    payment p ON c.customer_id = p.customer_id
GROUP BY 
    c.customer_id
ORDER BY 
    total_amount DESC
LIMIT 5;

7.Кількість орендованих фільмів кожним клієнтом
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS full_name, 
    COUNT(r.rental_id) AS rentals_count
FROM 
    customer c
JOIN 
    rental r ON c.customer_id = r.customer_id
GROUP BY 
    c.customer_id;

8.Середній вік фільмів
SELECT 
    AVG(EXTRACT(YEAR FROM CURRENT_DATE) - f.release_year) AS avg_film_age
FROM 
    film f;

9.Кількість орендованих фільмів за період
SELECT 
    COUNT(r.rental_id) AS rentals_count
FROM 
    rental r
WHERE 
    r.rental_date BETWEEN '2023-01-01' AND '2023-12-31'; -- Вкажіть бажаний період

10.Сума платежів по місяцям
SELECT 
    DATE_TRUNC('month', p.payment_date) AS payment_month, 
    SUM(p.amount) AS total_amount
FROM 
    payment p
GROUP BY 
    payment_month
ORDER BY 
    payment_month;

11.Максимальна сума платежу клієнта
SELECT 
    c.customer_id, 
    MAX(p.amount) AS max_amount
FROM 
    customer c
JOIN 
    payment p ON c.customer_id = p.customer_id
GROUP BY 
    c.customer_id;

12.Середня сума платежів для кожного клієнта
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS full_name, 
    AVG(p.amount) AS avg_payment
FROM 
    customer c
JOIN 
    payment p ON c.customer_id = p.customer_id
GROUP BY 
    c.customer_id;

13.Кількість фільмів за рейтингом:
SELECT 
    f.rating AS film_rating, 
    COUNT(f.film_id) AS films_count
FROM 
    film f
GROUP BY 
    f.rating;

14.Середня сума платежів по магазинам
SELECT 
    s.store_id, 
    AVG(p.amount) AS avg_payment
FROM 
    store s
JOIN 
    customer c ON s.store_id = c.store_id
JOIN 
    payment p ON c.customer_id = p.customer_id
GROUP BY 
    s.store_id;
