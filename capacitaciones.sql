/*Leandro Villalba*/
/*____________________Ejercicio Individual 1____________________*/
/*Creandro base de datos*/ 
create database modulo3_db;
use modulo3_db;

/*Creando tablas*/
create table operadores(
run varchar(12) not null,
nombre varchar(80) not null,
apellido varchar(100) not null,
direccion varchar(100) not null,
email varchar(255) not null,
fecha_de_cuenta date not null,
primary key(run)
);

create table usuarios(
usuario_id int not null,
nombre varchar(80) not null,
apellido varchar(100) not null,
email varchar(255) not null,
fecha_creacion date not null,
primary key (usuario_id)
);

create table capacitacion(
codigo_curso int not null,
nombre varchar(80) not null,
horario time not null,
costo_realizacion float not null,
fecha_creacion date not null,
primary key (codigo_curso)
);

/*Creando 10 operadores*/
insert into operadores values('7.343.444-4', 'Pedro', 'González', 'Av Chacabuco 980', 'pedrog@gmail.com', '2020-05-23');
insert into operadores values('17.243.435-K', 'Juan', 'Pérez', 'San Martin 2350', 'jperex@gmail.com', '2021-11-15');
insert into operadores values('16.333.547-2', 'Romina', 'Pereyra', 'OHihggins 23', 'ropey_23@gmail.com', '2019-09-02');
insert into operadores values('11.938.125-3', 'Julia', 'Hernández', 'Prietto 1353', 'jujureira@gmail.com', '2022-07-13');
insert into operadores values('18.123.249-7', 'Roberto', 'Giordanox', 'Manuel Rodriguez 889', 'rober_enrigo@gmail.com', '2021-12-09');
insert into operadores values('11.326.029-K', 'Luis', 'Zambranux', 'Av Los Carrera 1223', 'lz_9292@gmail.com', '2021-10-08');
insert into operadores values('14.848.332-2', 'Cristian', 'Trurerux', 'Av Brasil 1980', 'ct_9393@gmail.com', '2020-08-10');
insert into operadores values('26.342.927-9', 'Osvaldo', 'Ruggeri', 'Angol 235', 'rugggg_3@gmail.com', '2019-07-03');
insert into operadores values('15.976.129-4', 'Pedro', 'Rodriguez', 'Freire 2380', 'pr_pr@gmail.com', '2021-11-11');
insert into operadores values('17.002.849-2', 'Leandro', 'Villlal', 'Av Paicaví 22', 'lea_v@gmail.com', '2020-08-03');

select * from operadores;

/*Creando 10 usuarios*/
insert into usuarios values(92833, 'Juan', 'Flores', 'juancito_f@gmail.com', '2022-04-11');
insert into usuarios values(83782, 'Braian', 'García', 'brbr_g@gmail.com', '2020-12-15');
insert into usuarios values(01929, 'Anibal' ,'Fernandez', 'anibal_f@gmail.com', '2019-06-12');
insert into usuarios values(29384, 'Cristina', 'Perez', 'cristi_perez@gmail.com', '2021-07-03');
insert into usuarios values(29482, 'Franco', 'Pedrero', 'fran_ped@gmail.com', '2022-08-19');
insert into usuarios values(92849, 'Camila', 'Villa',  'cami_vvv@gmail.com', '2022-10-28');
insert into usuarios values(11234, 'Paulina', 'Silvax', 'paupau_33@gmail.com', '2019-08-11');
insert into usuarios values(39291, 'Osvaldo', 'Pederin', 'osvaldo_3421@gmail.com', '2019-05-23');
insert into usuarios values(12309, 'Jacqueline', 'Silva', 'jjj_silva@gmail.com', '2022-02-01');
insert into usuarios values(92830, 'Alan', 'Sosa', 'alan_m888@gmail.com', '2022-09-03');

select * from usuarios;

/*Creando 10 capacitaciones*/
insert into capacitacion values (18383,'Introducción a la programación Matutino', '08:00:00',150430.00, '2019-01-09');
insert into capacitacion values (28393,'Introducción a la programación Vespertino', '18:00:00', 160334.00, '2019-01-20');
insert into capacitacion values (38282,'Introducción al Desarrollo Web Matutino', '08:00:00', 180998.00, '2019-03-22');
insert into capacitacion values (49254,'Introducción al Desarrollo Web Vespertino', '18:00:00', 190983.00, '2019-03-30');
insert into capacitacion values (55263,'Base de datos Matutino', '09:00:00', 195992.00, '2020-01-13');
insert into capacitacion values (67637,'Base de datos Vespertino', '19:00:00',199838.00, '2020-01-30');
insert into capacitacion values (70190,'POO Matutino', '10:00:00', 200399.00, '2020-06-12');
insert into capacitacion values (80253,'POO Vespertino', '17:00:00', 210222.00, '2020-06-21');
insert into capacitacion values (92838,'Comunicación I Matutino', '08:00:00', 180333.00, '2021-03-13');
insert into capacitacion values (10119,'Comunicación I Vespertino', '18:00:00',185235.00, '2021-03-30');

select * from capacitacion;

/*Debe indicar cuánto fue el costo de realización de todos los cursos de capacitación registrados.*/
select sum(costo_realizacion) as costo_total_capacitaciones from capacitacion; 

/*- Muestre los 5 operadores más recientemente registrados.*/
select * from operadores order by fecha_de_cuenta desc limit 5;

/*- Muestre los 5 usuarios más recientemente registrados.*/
select * from usuarios order by fecha_creacion desc limit 5;

/* Calcule cuántos días han transcurrido desde que se registró a operadores y clientes.
Indague en la función DATEDIFF() de MySQL.*/
select datediff(now(), min(fecha_de_cuenta)) as dias_transcurridos_operadores from operadores;
select datediff(now(), min(fecha_creacion)) as dias_transcurridos_clientes from usuarios;

/*- Calcule cuántos días transcurrieron desde que se realizó el último curso de capacitación.*/
select datediff(now(), max(fecha_creacion)) as dias_rasncurridos_ultimo_curso from capacitacion;
select * from capacitacion order by fecha_creacion desc;

/*- Por último, indique cuál fue el curso de capacitación más costoso y el menos costoso.*/
select max(costo_realizacion) as capacitacion_mas_costosa from capacitacion;
select nombre, costo_realizacion from capacitacion order by costo_realizacion desc;

