
-- Funciones de agregación. Agrupamiento.

/*36)Mostrar según la tabla de países, la cantidad total de población, la población
máxima, la población mínima, el promedio de población y con cuántos registros
de población se cuenta. (Se esperan 5 columnas y 1 registro). */
select sum(Population),max(population),
min(population),avg(population),count(population)
from country;

/*37)Mostrar según la tabla de países, la cantidad total de población, la población
máxima, la población mínima y el promedio de población, por cada continente.
(Se esperan 5 columnas y 7 registros).*/
select Continent,sum(Population),max(population),
min(population),avg(population),count(population)
from country
group by Continent;

/*38)Agrupar a todos los países según el continente al que pertenecen. Mostrar los
continentes junto a la cantidad de naciones que pertenecen a cada uno. (Se
esperan 2 columnas y 7 registros).*/
select continent,count(name)
from country
group by Continent;

/*39)Agrupar a todas las ciudades según el país al que pertenecen. Mostrar los
códigos de países junto a la sumatoria total de habitantes de cada uno. (Se
esperan 2 columnas y 232 registros).*/
select CountryCode, sum(population)
from city
group by CountryCode;

/*40)Agrupar a todos los lenguajes según su nombre. Mostrar los nombres de los
lenguajes junto al porcentaje de habla mínimo registrado para cada uno. (Se
esperan 2 columnas y 457 registros).*/
select Language, min(Percentage)
from countrylanguage
group by Language;

/*41)Mostrar las distintas formas de gobierno posibles de los países europeos junto a
su correspondiente promedio de población que vive bajo estas circunstancias.
(Se esperan 2 columnas y 10 registros).*/
select GovernmentForm,avg(population)
from country
where Continent = 'europe'
group by GovernmentForm;

/*42)Mostrar las diez regiones de mayor expectativa de vida promedio. (Se esperan 2
columnas y 10 registros).*/
select Region,avg(LifeExpectancy)
from country
group by region
order by avg(LifeExpectancy) desc limit 10;

/*43)Mostrar los nombres de los diez distritos de mayor cantidad de ciudades con
cantidad de habitantes mayor al medio millón, junto a la cantidad de ciudades.
(Se esperan 3 columnas y 10 registros).*/
select District,count(name),Population
from city
group by District
having population > 500000 
order by count(name) desc limit 10;

/*44)Mostrar los nombres de los países que tengan ciudades en el Caribe, junto al
número de las mismas por país. (Se esperan 2 columnas y 24 registros).
select country.name,count(city.name)
from city
join country on city.CountryCode = country.Code
group by country.Region
having country.region = 'caribbean'; */

select country.name, count(city.Name)
from country
join city on country.code = city.CountryCode
where country.region = 'caribbean'
group by country.name;

/*45)Mostrar los lenguajes existentes junto a la cantidad de países que lo hablan de
manera oficial. (Se esperan 2 columnas y 102 registros).*/
select countrylanguage.Language, count(country.name)
from countrylanguage
join country on country.code = countrylanguage.CountryCode
where countrylanguage.IsOfficial = 't'
group by countrylanguage.Language; 

/*46)Mostrar listados los años de independencia (sin nulos) junto a la cantidad de
países que la hayan conseguido en ese año. Se desea visualizar aquellos años
donde más de un país se haya independizado. (Se esperan 2 columnas y 39
registros).*/
select IndepYear,count(Name)
from country
group by IndepYear asc
having count(name) > 1
and IndepYear is not null;

/*47)Listar los países junto a la cantidad de idiomas diferentes hablados, pero solo
aquellos donde se hablen entre tres y cinco idiomas diferentes. (Se esperan 2
columnas y 80 registros).*/
select country.name,count(countrylanguage.Language)
from country 
join countrylanguage on country.code = countrylanguage.CountryCode
group by country.name
having count(countrylanguage.language) between 3 and 5;

/*48)Mostrar los distritos, junto al nombre del país al que pertenecen, cuya población
total (también listada) no supere los diez mil habitantes. (Se esperan 3 columnas
y 35 registros).*/
select city.District, country.name, sum(city.Population)
from city
join country on country.Code = city.CountryCode
group by country.name
having not sum(city.Population) > 10000;

/*49)Mostrar las regiones junto a su densidad poblacional promedio, donde ésta
supere a la mitad de la densidad poblacional máxima. (Se esperan 2 columnas y 3
registros).*/
select region,
avg(population/SurfaceArea) as 'Densidad'
from country
group by region
having avg(population/SurfaceArea) > (max(population)/2);  

/*50)Mostrar los lenguajes oficiales junto a su porcentaje promedio de habla, cuyo
promedio no supere un dígito entero. (Se esperan 2 columnas y 7 registros).*/
select language as 'Lenguaje oficiales',
avg(Percentage) -- ,sum(percentage)/count(Percentage)
from countrylanguage
where IsOfficial = 't'
group by Language
having avg(Percentage) <= 9;

select * from countrylanguage;



