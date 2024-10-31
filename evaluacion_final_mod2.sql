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
-- con el between buscamos valores entre un parametro y otro
SELECT CONCAT(first_name," ",last_name) AS actor_actriz
	FROM actor
    WHERE actor_id BETWEEN 10 AND 20;

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
-- TABLA RENTAL: rental_id, inventory_id. COUNT(rental_id)
-- TABLE INVENTORY: inventory_id, film_id
-- TABLA FILM_CATEGORY: film_id, category_id
-- TABLA CATEGORY: category_id, name

SELECT name AS categoria, COUNT(rental_id) AS recuento
	FROM category
INNER JOIN film_category
	USING (category_id)
INNER JOIN inventory
	USING (film_id)
INNER JOIN rental
	USING (inventory_id)
GROUP BY name;

/*12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la
clasificación junto con el promedio de duración*/
SELECT rating AS clasificación, AVG(length)
	FROM film 
    GROUP BY rating;
    
# 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".
-- TABLA ACTOR: first_name, last_name, actor_id
-- TABLA FILM_ACTOR: actor_id, film_id
-- TABLA FILM: film_id, title

SELECT first_name AS nombre, last_name AS apellido
	FROM actor
INNER JOIN film_actor
	USING (actor_id)
INNER JOIN film
	USING (film_id)
WHERE title = "Indian Love";

# 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.
SELECT title AS título, DESCRIPTION
	FROM film
    WHERE description LIKE '%dog%' OR description LIKE '%cat%';

# 15. Hay algún actor o actriz que no apareca en ninguna película en la tabla film_actor.
-- No hay ningún actor o actriz que no aparezca en ninguna película en la tabla film_actor. 
SELECT DISTINCT first_name, last_name
FROM actor
LEFT JOIN film_actor
USING (actor_id);

# 16. Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010
SELECT title
FROM film
WHERE release_year BETWEEN 2005 AND 2010;

# 17. Encuentra el título de todas las películas que son de la misma categoría que "Family".
SELECT title AS "titulo película", name AS categoría
	FROM film
INNER JOIN film_category
	USING(film_id)
INNER JOIN category
	USING (category_id)
WHERE name = "Family";

# 18. Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.
SELECT first_name AS nombre, last_name AS apellido
	FROM actor
    INNER JOIN film_actor
    USING (actor_id)
    GROUP BY actor_id
    HAVING COUNT(film_id) > 10;

# 19. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla film.
SELECT title AS pelicula, length AS duración
	FROM film
    WHERE rating = "R" AND length > 120;

/* 20.  Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y muestra el
nombre de la categoría junto con el promedio de duración.*/
SELECT rating AS categoria, AVG(length) AS "promedio duración"
	FROM film
    GROUP BY rating
    HAVING AVG(length) > 120; 

/* 21. . Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor junto con la
cantidad de películas en las que han actuado.*/

SELECT first_name AS nombre, last_name AS apellido, COUNT(film_id) AS cantidadPeliculas
	FROM actor
    INNER JOIN film_actor
    USING (actor_id)
    GROUP BY actor_id
    HAVING COUNT(film_id) >= 5;
    
/*22. Encuentra el título de todas las películas que fueron alquiladas por más de 5 días. Utiliza una subconsulta para
encontrar los rental_ids con una duración superior a 5 días y luego selecciona las películas correspondientes.*/
-- con DATEDIFF calculamos la diferencia entre 2 fechas

SELECT DISTINCT title AS pelicula
	FROM film
INNER JOIN inventory
	USING (film_id)
INNER JOIN rental
	USING (inventory_id)
WHERE rental_id IN (
					SELECT rental_id
						FROM rental
						WHERE DATEDIFF(return_date, rental_date) > 5);
                        
/*23. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría "Horror".
Utiliza una subconsulta para encontrar los actores que han actuado en películas de la categoría "Horror" y luego
exclúyelos de la lista de actores.*/

SELECT first_name AS nombre, 
		last_name AS apellido
FROM actor
WHERE actor_id NOT IN (
						SELECT actor_id
							FROM actor
						INNER JOIN film_actor
							USING (actor_id)
						INNER JOIN film
							USING (film_id)
						INNER JOIN film_category
							USING (film_id)
						INNER JOIN category 
							USING (category_id)
							WHERE name = "Horror");

# 24. BONUS: Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla film.

SELECT title AS pelicula, length AS duración
FROM film 
WHERE length > 180 AND title IN (
								SELECT title 
									FROM film
								INNER JOIN film_category
									USING (film_id)
								INNER JOIN category
									USING (category_id)
								WHERE name = "Comedy");

/* 25. BONUS: Encuentra todos los actores que han actuado juntos en al menos una película. La consulta debe
mostrar el nombre y apellido de los actores y el número de películas en las que han actuado juntos. */
    
SELECT  CONCAT(a1.first_name, " ", a1.last_name) AS "ACTOR/ACTRIZ 1",
		CONCAT(a2.first_name, " ", a2.last_name) AS "ACTOR/ACTRIZ 2",
		COUNT(fa1.film_id) AS "peliculas compartidas"
	FROM 
		film_actor AS fa1
	JOIN film_actor AS fa2 
		ON fa1.film_id = fa2.film_id AND fa1.actor_id < fa2.actor_id
	JOIN actor AS a1 
        ON fa1.actor_id = a1.actor_id
	JOIN actor a2 
		ON fa2.actor_id = a2.actor_id
	GROUP BY 
		a1.actor_id, a2.actor_id
	HAVING 
		COUNT(fa1.film_id)>0;

                                    
									
                            
    
                            





    

