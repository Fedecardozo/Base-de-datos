use curso1;

set sql_safe_updates=0;

select * from clientes;

insert into clientes(id_cliente,id_localidad,nombre,apellido,telefono,mail,fechaNac) 
values(7,2,'Federico','Cardozo',6451-4855, 'Parrilla Los amigos de Luis', 19971207);

insert into clientes(id_cliente,id_localidad,nombre,apellido,telefono,mail,fechaNac) 
values(8,2,'Leandro','Cardozo','4242-7303', 'Parrilla La Herencia de Juan', 19971207);

insert into clientes 
values(10,2,'puto','Cardozo','4242-7303', 'Parrilla Los Amigos', 19971207);


/* %[aeiou]_[aeiou]% [A-J]% */
select mail from clientes
WHERE mail LIKE 'p%{ae}%';

update clientes set fede WHERE id_cliente = 11;