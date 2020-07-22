create database Empresa;

drop database clientes;

use empresa;

create table cliente(
id integer(11) not null,
dni varchar(10) not null,
nombre varchar(30) not null,
apellido varchar(30) not null,
genero enum('Femenino', 'Masculino') not null,
fecha_nacimiento date not null default '0000-00-00',
mail varchar(45),
movil char(10),
domicilio varchar(60),
barrio varchar(30),
nacionalidad varchar(15) not null, 
primary key (id)

);

-- Insert
/*12169851', 'Luis Enrique', 'Pérez', 'HOMBRE', '1954-06-01',
'perez_luisenrique@ma1l.com', '1157319468', 'Pujol 416', 'Caballito', 'Uruguay'*/
insert into cliente (id,dni,nombre,apellido,genero,fecha_nacimiento,mail,movil,domicilio,barrio,nacionalidad)
values ('12169851', '22222','Juan', 'Pérez', 'Masculino', '1954-06-01',
'perez_luisenrique@ma1l.com', '1157319468', 'Pujol 416', 'Caballito', 'Uruguay');

/*17278290 Florencia 33333 Santos Femenino 1963-07-12 flor.santos@ma
1l.com 1148434346 Piran 3015 Villa
Urquiza Argentina
16839283 Luisa Nina Escudero Femenino 1962-03-22
lulu62@hushma
1l.com 1175940343 Superi 348
1º A
Colegiales Colombia
19164274
Carlos
Alberto Medina HOMBRE 1966-04-26
medinacarlosalb
erto@z0h0.com 1123423451 Mexico
2121 Balvanera Argentina*/

insert into cliente (id,dni,nombre,apellido,genero,fecha_nacimiento,mail,movil,domicilio,barrio,nacionalidad)
values ('17278290', '33333', 'Florencia', 'Santos', 'Femenino', '1963-07-12', 'flor.santos@ma
1l.com', '1148434346', 'Piran 3015', 'Villa Urquiza', 'Argentina');

insert into cliente (id,dni,nombre,apellido,genero,fecha_nacimiento,mail,movil,domicilio,barrio,nacionalidad)
values('19164274', 'Carlos','Alberto','Medina','Masculino', '1966-04-26',
'medinacarlosalberto@z0h0.com', '1123423451', 'Mexico 2121', 'Balvanera', 'Argentina');

/*. Insertar una cliente llamada María Sol González, con DNI 36.427.254, nacida en
Argentina el 15 de agosto de 1992. Domiciliada en Gurruchaga 243, Villa Crespo.
Su móvil es 1136782013 y su mail es ma.gon54@gma1l.com.*/
insert into cliente (id,dni,nombre,apellido,genero,fecha_nacimiento,mail,movil,domicilio,barrio,nacionalidad)
values('123456789','36.427.254','Maria sol','Gonzales', 'Femenino', '1992-08-15',
'ma.gon54@gma1l.com','1136782013','Gurruchaga 243','Villa Crespo','Argentina');


-- Update modificacion de datos

/*.Modificar el apellido de la cliente 85 por 'Chaves'. (Se espera 1 registro
afectado).*/
update cliente set apellido = 'chaves'
where apellido = 'gonzales';

set sql_safe_updates=0;

insert into cliente (id,dni,nombre,apellido,genero,fecha_nacimiento,mail,movil,domicilio,barrio,nacionalidad)
values('123456789','36.427.254','fede','cardozo', 'masculino', '1997-12-12',
'fefe54@gma1l.com','1234567','sadcas 243','Villa centenario','Argentina');

/*Agregar un cero a la izquierda de todos los DNI con exactamente siete cifras. (Se
esperan 1173 registros afectados).*/
update cliente set movil = LPAD(movil,10,0) 
where length(movil) = 7;

update cliente set movil = 1234567
where id = 123456789;

select * from cliente;


/*Agregar una tilde a todos los clientes llamados 'Nicolas' como único nombre
para que el mismo pase a ser 'Nicolás'. (Se esperan 3 registros afectados).*/
update cliente set nombre = 'Nicolas'
where nombre = 'fede';

update cliente set nombre = 'Nicolàs'
where nombre = 'Nicolas';


/*Poner en mayúsculas los apellidos de los clientes cuya nacionalidad no sea
'Argentina'. (Se esperan 4450 registros afectados).*/
update cliente set apellido = upper(apellido)
where nacionalidad != 'Argentina'; 


-- Eliminar registrosss ***********
 
/*58.) Eliminar al cliente 9804. (Se espera 1 registro afectado). */
delete from cliente
where id = 123456789; 


/*59.) Eliminar a los clientes cuyo servidor de mail sea 'z0h0'. (Se esperan 2127
registros afectados).*/
delete from cliente 
where mail like('%z0h0%') ;


/*60.) Eliminar a todos los clientes que residan en el barrio de 'Flores'. (Se esperan
803 registros afectados).*/
delete from cliente 
where barrio = 'caballito';


