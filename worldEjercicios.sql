use world;

describe city;
describe country;
describe countrylanguage;

show tables;

/*Selección. Unicidad. Alias. Columnas calculadas. Puntos del 1 al 5*/

/*1)Listar código, nombre, continente y población de todos los países. (Se esperan 4
columnas y 239 registros).*/
select count(*) from country;
select code,name,continent,population from country;

/*2)Listar solo el nombre de todos los lenguajes distintos que existan. (Se espera 1
columna y 457 registros).*/
select distinct language 
from countrylanguage  
order by language asc;

select count(distinct language)
from countrylanguage;

/*3)Listar nombre y población de cada ciudad, con los nombres de las columnas en
castellano. (Se esperan 2 columnas y 4079 registros).*/
select count(*)
from city;

describe city;

select name, population 
from city;

/*4)Listar el nombre, el GNP como 'Producto Bruto Nacional', el GNPOld como
'Producto Bruto Nacional Anterior' y la diferencia entre estos como 'Diferencia',
para todos los países. (Se esperan 4 columnas y 239 registros).*/
select name,gnp as 'Producto Bruto Nacional',
gnpold as'Producto Bruto Nacional Anterior', 
gnp - GNPOld as 'Diferencia'
from country;

/*5)Listar el nombre, la cantidad de habitantes, la superficie y una columna llamada
'Densidad' con el resultado de la densidad poblacional de todos los países. (Se
esperan 4 columnas y 239 registros).*/
select name,population,surfaceArea, 
Population/SurfaceArea as 'Densidad' 
from country;

/*Límites. Ordenamiento. Puntos del 6 al 10*/

/*6)Listar toda la información de los países, ordenados por población de manera
ascendente. (Se esperan 15 columnas y 239 registros).*/
select * 
from city 
order by population asc;

/*7)Listar nombre de los lenguajes en orden alfabético. (Se espera 1 columna y 984
registros).*/
select language 
from countrylanguage 
order by language asc;

/*Sin repetir*/
select distinct Language
from countrylanguage
order by Language asc;

/*8)Listar nombre y cantidad de habitantes de las veinte ciudades menos pobladas.
(Se esperan 2 columnas y 20 registros).*/
select name, population
from city
order by population asc limit 20;

/*9)Listar código, nombre y año de independencia de todos los países, ordenados
por antigüedad descendente. (Se esperan 3 columnas y 239 registros).*/
select code,name,IndepYear as 'Indenpendencia'
from country
order by IndepYear desc;

/*10)Listar nombre y continente de los cien países con mayor expectativa de vida. Si
hubiera países que tengan la misma expectativa de vida, mostrar primero a los
de menor superficie. (Se esperan 2 columnas y 100 registros).*/
select name,Continent,LifeExpectancy
from country
order by LifeExpectancy desc limit 100;


