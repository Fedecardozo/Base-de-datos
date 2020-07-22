-- Unión de tablas --

/*26)Listar los nombres de los países sudamericanos junto a los nombres (alias
'Capital') de sus capitales. (Se esperan 2 columnas y 14 registros).*/
select country.name as 'Pais',city.name as 'Capital'
from city 
join country on country.Capital = city.ID
where Continent = 'south america';


/*27)Listar el código de país, junto a los nombres de las ciudades y su cantidad de
habitantes, de aquellos cuya expectativa de vida sea mayor a 80. (Se esperan 3
columnas y 253 registros).*/
-- El campo que comparten en esta situacion es el country code(city) y code(country)
select country.name as 'Paises',
 city.name as 'Ciudades',
 city.Population as 'Poblacion',
 country.LifeExpectancy as 'Expectativa de vida'
from country
join city on country.Code = city.CountryCode
where LifeExpectancy > 80;


/*28)Listar las capitales de los países cuya forma de gobierno sea una República
Federal. (Se esperan 2 columnas y 15 registros).*/
-- Se unen mediante country.capital y city.id
select country.name as 'Pais',
city.name as 'Capital', 
country.GovernmentForm as 'Gobierno'
from country
join city on country.Capital = city.ID
where country.GovernmentForm = 'federal republic'; 

/*29)Listar los lenguajes oficiales, junto al nombre de sus respectivos países, donde la
cantidad de habitantes de dicho país esté entre un millón y tres millones. (Se
esperan 2 columnas y 14 registros).*/
select country.name as 'Pais',
countrylanguage.Language 'Lenguaje'
from countrylanguage
join country on country.code = countrylanguage.countrycode
where country.population between 1000000 and 3000000
and countrylanguage.IsOfficial = 't';

/*30)Listar los códigos, los nombres locales y la región a la que pertenecen aquellos
países donde se hable español. (Se esperan 3 columnas y 28 registros).*/
select country.code as 'Codigo',
country.name as 'Nombre',
country.Region as 'Region'
from country
join countrylanguage on countrylanguage.CountryCode = country.Code
where countrylanguage.Language = 'spanish';

/*31)Listar los nombres y las capitales de los países en cuya capital se concentre más
de la mitad de su población total. (Se esperan 2 columnas y 14 registros).*/
select country.name as 'Pais',
city.name 'Capital'
from country
join city on city.id = country.capital
where city.Population > country.Population/2;

/*32)Listar los nombres y la superficie de los países africanos cuya capital coincida
con el nombre del distrito a la que pertenece. (Se esperan 2 columnas y 32
registros).*/
select country.name as 'Nombre',
country.SurfaceArea as 'Superficie'
from country
join city on city.id = country.capital
where country.Continent = 'Africa' 
and city.name = city.District;

/*33)Listar los nombres, las capitales y el año de independencia (sin nulos) de los 20
países más antiguos. (Se esperan 3 columnas y 20 registros).*/
select country.name as 'Nombres',
city.Name 'Capital',
country.IndepYear as 'Indenpendencia'
from country
join city on city.ID = country.capital
where country.IndepYear is not null
order by country.IndepYear asc limit 20;

/*34)Listar las ciudades junto a sus idiomas oficiales, donde no se hable español,
inglés, portugués, italiano, francés o alemán de manera oficial. (Se esperan 2
columnas y 2694 registros).*/
select city.name as 'Ciudad',
countrylanguage.Language'Idioma oficial',count(*)
from city
join countrylanguage on countrylanguage.CountryCode = city.CountryCode
where not Language in('spanish','english','french','portuguese','italian','german')
and countrylanguage.IsOfficial = 't';

/*35)Listar nombre, población y país de las diez ciudades europeas de habla inglesa
más pobladas. (Se esperan 3 columnas y 10 registros).*/
select country.name as 'Pais',
city.Name as 'Nombre', 
countryLanguage.Language as'Lenguaje' ,
city.Population as 'Poblacion'
from city
join country on city.id = country.Capital
join countrylanguage on city.CountryCode = countrylanguage.CountryCode
where country.Continent = 'europe' 
and countrylanguage.Language = 'english'
order by city.Population desc limit 10;






