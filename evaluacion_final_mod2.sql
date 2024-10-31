USE sakila;

# 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados
-- con el DISTINCT nos muestra valores únicos, no saldrán titulos repetidos
SELECT DISTINCT title AS películas
	FROM film;

# 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
SELECT title AS películas
	FROM film
    WHERE rating = "PG-13";

# 3. Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.
-- con el LIKE buscamos un patrón dentro de la columna indicada
SELECT title AS películas, description AS descripción
	FROM film
    WHERE description LIKE '%amazing%'; -- no uso el alias porque no lo lee en el where

# 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.
SELECT title AS películas
	FROM film
    WHERE length > 120;

# 5. Recupera los nombres de todos los actores.
SELECT first_name AS nombreActor
	FROM actor;

# 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.
SELECT first_name AS nombre, last_name AS apellido
	FROM actor
    WHERE last_name = "Gibson";

# 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.
SELECT CONCAT(first_name," ",last_name) AS actor_actriz
	FROM actor
    WHERE actor_id >= 10 AND actor_id <= 20;

# 8. Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.
-- con NOT IN exceptuamos el parámetro que no queremos que aparezca.
SELECT title AS tituloPelicula
	FROM film
    WHERE rating NOT IN ("R", "PG-13");

# 9. Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.
SELECT rating AS clasificación, COUNT(film_id) AS recuento
	FROM film
    GROUP BY rating;

/* 10.  Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre 
		y apellido junto con la cantidad de películas alquiladas.*/
SELECT customer_id AS "id cliente", first_name AS nombre, last_name AS apellido, COUNT(rental_id) AS "peliculas alquiladas"
	FROM customer
    INNER JOIN rental
    USING (customer_id)
    GROUP BY customer_id;

/*11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el
recuento de alquileres.*/
