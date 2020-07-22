/*Filtrado de registros. Operadores relacionales
y lógicos. Operadores IN y BETWEEN.*/

/*11)Listar todos los datos de los países que no cuenten con habitantes. (Se esperan
15 columnas y 7 registros).*/
select * 
from country
where population = 0;

/*12)Listar todos los datos de los países cuya expectativa de vida supere los setenta y
cinco años, ordenados bajo este concepto de forma ascendente. (Se esperan 15
columnas y 62 registros).*/
select *
from country
where LifeExpectancy > 75
order by LifeExpectancy asc;

/*13)Listar todos los datos de los países cuya independencia haya ocurrido a partir de
la segunda mitad del siglo XIX y su forma de gobierno sea una monarquía
constitucional. (Se esperan 15 columnas y 20 registros).*/
select *
from country
where IndepYear > 1850
and GovernmentForm in ('constitutional monarchy'); 

/*14)Listar todos los datos de los diez países europeos de mayor PBN. (Se esperan 15
columnas y 10 registros).*/
select *
from country
where Continent = 'europe'
order by gnp desc limit 10;

/*15)Listar todos los datos de los países cuyo nombre registrado coincida con su
nombre local. (Se esperan 15 columnas y 104 registros).*/
select *
from country
where name = LocalName;

/*16)Listar todos los datos de los países cuya independencia se haya dado a partir de
la segunda mitad del siglo XX. (Se esperan 15 columnas y 110 registros).*/
select *
from country 
where IndepYear > 1950; 

/*17)Listar todos los datos de los países situados en Europa, Asia o Sudamérica. (Se
esperan 15 columnas y 111 registros).*/
select *
from country 
where Continent = 'europe'
or Continent = 'asia'
or Continent = 'south america';

/*18)Listar todos los datos de todos los países, excepto los africanos. (Se esperan 15
columnas y 181 registros).*/
select *
from country 
where Continent != 'africa';

/*19)Listar todos los datos de las ciudades argentinas fuera de la provincia de Buenos
Aires. (Se esperan 5 columnas y 26 registros).*/
select *
from city
where CountryCode = 'arg' 
and District != 'buenos aires';

/*20)Listar todos los datos de las ciudades de entre 125 mil y 130 mil habitantes. (Se
esperan 5 columnas y 138 registros).*/
select *
from city
where population between 125000 and 130000
order by population asc;








