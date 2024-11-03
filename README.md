# EJERCICIO EVALUACIÓN MÓDULO 2

Este repositorio contiene el proyecto final de evaluación del módulo 2 del curso de Analista de Datos por Adalab, Promo k. 
El ejercicio está diseñado para demostrar las habilidades adquiridas en la creación, extracción y consulta de bases de datos usando MySQL.

## Tabla de Contenidos
1. [Descripción del Ejercicio](#descripción-del-ejercicio)
2. [Objetivos](#objetivos)
3. [Requisitos](#requisitos)
4. [Estructura de la BBDD Sakila](#estructura-de-la-bbdd-sakila)
5. [Ejemplo de consultas](#ejemplo-de-consultas)
6. [Autora](#autora)

## Descripción del Ejercicio

El objetivo de este proyecto es realizar un ejercicio práctico de MySQL que incluya diferentes tipos de consultas que permitan 
poner en práctica las diferentes funciones aprendidas para la gestión de las Bases de Datos.

## Objetivos

- Dominar el uso de las queries básicas
- Dominar las funciones agregadas y consultas avanzadas para obtener informacion especifica.
- Dominar el uso de _joins_ para combinar consultas de datos.
- Demostrar habilidades en el uso de Operadores especiales.
- Dominar el uso de suconsultas.
- Dominar el uso de las subconsultas correlacionadas y CTE's


## Requisitos

- MySQL Server
- MySQL Workbench

## Estructura de la BBDD Sakila

1. Base de datos que simula una tienda de alquiler de películas 

Tablas relacionadas con las peliculas
- **Film**: Almacena la información de las peliculas.
- **Actor**: contiene informacion sobre los actores.
- **Film_actor**: relaciona las peliculas con actores mediante sus id.
- **Category**: almacena las diferentes categorías de películas.
- **Film_category**: relaciona las peliculas con las categorías mediante sus ids.
- **Film_text**: contiene el titulo de cada pelicula y una descripción.
- **Language**: informacion sobre los diferentes idiomas codificados por id, relacionado con la tabla peliculas.
       
Tablas relacionadas con el alquiler de las peliculas: 
- **Rental**: contiene informacion sobre el alquiler de peliculas.
- **Inventory**: relaciona el alquiler con las peliculas mediante ids.
        
Tablas relacionadas con las tiendas de alquiler:
- **Store**: informacion sobre las diferentes tiendas.
- **Staff**: informacion sobre los diferentes trabajadores.
- **Payment**: informacion relacionada con los pagos, se relaciona con las tablas de customer, staff y rental.
- **Customer**: Tabla de informacion sobre los diferentes clientes y la tienda a la que están vinculados.
- **Address**: informacion sobre las direcciones de los clientes y de las 2 tiendas.
- **City**: información sobre las ciudades de la tabla de direcciones.
- **Country**: informacion sobre los paises relacionados con la tabla de direcciones. 

## Ejemplo de consultas
> Ejercicio 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.
![Captura de pantalla 2024-11-02 a las 18 40 33](https://github.com/user-attachments/assets/51ef38be-9204-4111-bb21-d5a84ecd8fb3)
                
> Ejercicio 10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas. 
![Captura de pantalla 2024-11-02 a las 18 38 23](https://github.com/user-attachments/assets/0b96e4df-9fc1-452b-9c2f-1a89996b3da8)

## Autora
* Patricia Sainz-Pardo Caraballo - Estudiante de Adalab. Curso Analista de Datos. Promo K.
* Perfil de GitHub: psainzpc
 
