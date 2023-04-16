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

/*____________________Ejercicio Individual 2____________________*/
/*- Agregue el campo salario al Operador y registre salarios a los operadores ya registrados*/
alter table operadores add column salario float;
update operadores set salario = 690344.00 where run = '11.326.029-K';
update operadores set salario = 495204.00 where run = '11.938.125-3';
update operadores set salario = 790002.00 where run = '14.848.332-2';
update operadores set salario = 573102.00 where run = '15.976.129-4';
update operadores set salario = 480234.00 where run = '16.333.547-2';
update operadores set salario = 644982.00 where run = '17.002.849-2';
update operadores set salario = 433000.00 where run = '17.243.435-K';
update operadores set salario = 550889.00 where run = '18.123.249-7';
update operadores set salario = 890123.00 where run = '26.342.927-9';
update operadores set salario = 992000.00 where run = '7.343.444-4';
select * from operadores;

/* Inserte 3 capacitaciones nuevas. */
insert into capacitacion values (77833,'Sringboot', '17:00:00', 200980.00, '2022-12-21');
insert into capacitacion values (77894,'Seguridad', '08:00:00', 210333.00, '2022-11-30');
insert into capacitacion values (789878,'Liderazgo', '18:00:00',212235.00, '2021-10-02');

/* Inserte 3 operadores nuevos. */
insert into operadores values('17.324.928-4', 'Gustavo', 'Riquelme', 'Av Pedri 980', 'gus_rqu@gmail.com', '2022-11-03', 650000.00);
insert into operadores values('20.243.989-K', 'Noemi', 'Diaz', 'Calle 205', 'noex@gmail.com', '2022-10-15', 560900.00);
insert into operadores values('13.083.983-2', 'Antonella', 'Villa', 'Chile 2523', 'antoanto_@gmail.com', '2012-09-23', 750566.00);

select * from operadores;

/* ¿Cuál es la capacitación más costosa? Selecciónelo. */
select max(costo_realizacion) from capacitacion;
select * from capacitacion order by costo_realizacion desc;

/* ¿Cuál es el operador con menor salario? Selecciónelo. */
select min(salario) from operadores;
select salario from operadores order by salario;

/* Seleccione las capacitaciones más costosas que el promedio. */
select nombre, costo_realizacion from capacitacion where costo_realizacion > (select avg(costo_realizacion) from capacitacion);
select avg(costo_realizacion) from capacitacion;
select costo_realizacion from capacitacion order by costo_realizacion desc;

/*Cree una tabla con las capacitaciones menos costosas que el promedio. La tabla debe tener por 
nombre Capacitaciones Económicos. */
create table capacitaciones_economicas as select nombre, costo_realizacion from capacitacion where costo_realizacion < (select avg(costo_realizacion) from capacitacion);
select * from capacitaciones_economicas;

/*A la tabla Capacitaciones Económicos, agrégale dos campos. ‘Cantidad mínima estudiantes’ y 
‘Aportes públicos’. La cantidad mínima de estudiantes se refiere al número mínimo de estudiantes 
necesarios para su realización. Los aportes públicos refieren a los aportes entregados por 
instituciones públicas para la realización del curso (tiene que ser un valor menor al costo total del 
curso). */

alter table capacitaciones_economicas add column cantidad_minima_estudiantes int;
update capacitaciones_economicas set cantidad_minima_estudiantes = 10 where nombre = 'Comunicación I Vespertino';
update capacitaciones_economicas set cantidad_minima_estudiantes = 20 where nombre = 'Introducción a la programación Matutino';
update capacitaciones_economicas set cantidad_minima_estudiantes = 20 where nombre = 'Introducción a la programación Vespertino';
update capacitaciones_economicas set cantidad_minima_estudiantes = 15 where nombre = 'Introducción al Desarrollo Web Matutino';
update capacitaciones_economicas set cantidad_minima_estudiantes = 10 where nombre = 'Comunicación I Matutino';

alter table capacitaciones_economicas add column aportes_publicos float;
update capacitaciones_economicas set aportes_publicos = 50540.22 where nombre = 'Comunicación I Vespertino';
update capacitaciones_economicas set aportes_publicos = 45340.77 where nombre = 'Introducción a la programación Matutino';
update capacitaciones_economicas set aportes_publicos = 60540.89 where nombre = 'Introducción a la programación Vespertino';
update capacitaciones_economicas set aportes_publicos = 34540.14 where nombre = 'Introducción al Desarrollo Web Matutino';
update capacitaciones_economicas set aportes_publicos = 20540.72 where nombre = 'Comunicación I Matutino';

select * from capacitaciones_economicas;

/*Renombre la columna “Costo realización” en la tabla Capacitaciones económicas. El nombre 
nuevo debe ser: Costo efectivo. En dicha columna, a cada valor se le debe restar el valor de 
‘Aportes públicos’. */

alter table capacitaciones_economicas change costo_realizacion costo_efectivo float;

update capacitaciones_economicas set costo_efectivo = costo_efectivo - 50540.22 where nombre = 'Comunicación I Vespertino';
update capacitaciones_economicas set costo_efectivo = costo_efectivo - 45340.77 where nombre = 'Introducción a la programación Matutino';
update capacitaciones_economicas set costo_efectivo = costo_efectivo - 60540.89 where nombre = 'Introducción a la programación Vespertino';
update capacitaciones_economicas set costo_efectivo = costo_efectivo - 34540.14 where nombre = 'Introducción al Desarrollo Web Matutino';
update capacitaciones_economicas set costo_efectivo = costo_efectivo - 20540.72 where nombre = 'Comunicación I Matutino';

select * from capacitaciones_economicas;

/* Por último, actualice 5 cursos y 3 operadores. */

select * from capacitacion;
update capacitacion set horario = '19:15:00' where codigo_curso = 10119;
update capacitacion set costo_realizacion = 160520 where codigo_curso = 18383;
update capacitacion set horario = '17:15:00' where codigo_curso = 28393;
update capacitacion set costo_realizacion = 175689 where codigo_curso = 38282;
update capacitacion set fecha_creacion = '2020-01-19' where codigo_curso = 49254;

select * from operadores;
update operadores set direccion = 'Lincoyán 90' where run = '11.326.029-K';
update operadores set nombre = 'Julieta' where run = '11.938.125-3';
update operadores set email = 'Pedrito_3232@gmail.com' where run = '15.976.129-4';

/*___Leandro Villalba___*/