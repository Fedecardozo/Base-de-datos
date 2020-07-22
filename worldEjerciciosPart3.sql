-- Manejo de valores nulos. Operador LIKE.Comodines. --

/*21)Listar todos los datos de los países donde no se cuente con datos acerca de su
independencia. (Se esperan 15 columnas y 47 registros).*/
select *
from country 
where IndepYear IS NULL;

/*22)Listar todos los datos de los países donde no se tengan datos acerca del PBN
anterior ni de la expectativa de vida. (Se esperan 15 columnas y 17 registros).*/
select *
from country
where gnpold is null 
and LifeExpectancy is null;

/*23)Listar todos los datos de los países cuyo nombre comience y termine con 'A'.
(Se esperan 15 columnas y 13 registros).*/
select * 
from country 
where name like 'a%a';

/*24)Listar todos los datos de los países cuyo nombre sea compuesto (más de una
palabra). (Se esperan 15 columnas y 66 registros).*/
select *
from country
where name like '%% %%';

/*25)Listar todos los datos de las ciudades cuyo nombre o distrito contengan un '-'
(guión medio). (Se esperan 5 columnas y 372 registros).*/
select *
from city 
where name like '%-%'
or district like '%-%' ;




