-- 1°Construir consultas para inserta, modificar y borrar en customer, staff y actor
SELECT * FROM customer
--Insertar customer
INSERT INTO customer (store_id, first_name, last_name, email, address_id, activebool, create_date, last_update, active)
VALUES (3,'John', 'Doe', 'john.doe@example.com', 607, 'true', '2024-01-02', '2024-01-02', 1 );
SELECT * FROM customer;
--Actualizar customer
UPDATE customer
SET first_name = 'Juan', last_name = 'Perez', email = 'jane.doe@example.com'
WHERE customer_id = 602;
SELECT * FROM customer;
--Eliminar customer
DELETE FROM customer
WHERE customer_id = 602;
SELECT * FROM customer;

SELECT * FROM staff;
-- Insertar un staff
INSERT INTO staff (first_name, last_name, address_id, email, store_id, active, username, password, last_update, picture)
VALUES ('Alice', 'Smith', 606, 'alice.smith@example.com', 101, 'true', 'alice1', 'password123', NOW(), null);
SELECT * FROM staff;
--Modificar un staff
UPDATE staff
SET first_name = 'Alicia', last_name='Mendez', email = 'alicia.mendez@example.com'
WHERE staff_id = 7;
SELECT * FROM staff;
--Eliminar un staff
DELETE FROM staff
WHERE staff_id = 7;
SELECT * FROM staff;

SELECT * FROM actor;
--Insertar un actor
INSERT INTO actor (first_name, last_name, last_update)
VALUES ('Robert', 'Downey Jr.', NOW());
SELECT * FROM actor;
--Actualizar un actor
UPDATE actor
SET first_name='Chris'
WHERE actor_id = 201;
SELECT * FROM actor;
--Eliminar actor
DELETE FROM actor
WHERE actor_id = 204;
SELECT * FROM actor;

--Listar todas las “rental” con los datos del “customer” dado un año y mes
SELECT r.rental_id, r.rental_date, r.return_date, c.first_name AS customer_first_name, c.last_name AS customer_last_name
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id
WHERE rental_date BETWEEN '2005-06-01' AND '2005-06-30';

--3. Listar Número, Fecha (payment_date) y Total (amount) de todas las “payment”


SELECT payment_id Numero, payment_date Fecha, amount Total FROM payment;

--4. Listar todas las “film” del año 2006 que contengan un “rental_rate” mayor a 4.0

SELECT f.film_id, f.title, f.release_year, f.rental_rate
FROM film f
WHERE f.release_year = 2006 AND f.rental_rate > 4.0;

-- 5 Realiza un Diccionario de datos que contenga el nombre de las tablas y columnas, si
--éstas pueden ser nulas, y su tipo de dato correspondiente.
SELECT
    t1.TABLE_NAME AS tabla_nombre,
    t1.COLUMN_NAME AS columna_nombre,
    t1.IS_NULLABLE AS columna_nulo,
    t1.DATA_TYPE AS columna_tipo_dato,
    COALESCE(t1.NUMERIC_PRECISION,
    t1.CHARACTER_MAXIMUM_LENGTH) AS columna_longitud
FROM 
    INFORMATION_SCHEMA.COLUMNS t1
    INNER JOIN PG_CLASS t2 ON (t2.RELNAME = t1.TABLE_NAME)
WHERE 
    t1.TABLE_SCHEMA = 'public'
ORDER BY
    t1.TABLE_NAME;





















