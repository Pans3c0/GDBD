-- Actividad 1
select nomemp
from empleados
where length(nomemp) = 21
order by nomemp;


-- Actividad 2
select substr(nomdep,1,9) as "NOMBRE ABREVIADO"
from departamentos
order by nomdep;


-- Actividad 3
select  numdep, substr(nomdep,13,5) as "DEPARTEMENTO"
from departamentos
order by numdep;


-- Actividad 4
select  numdep, substr(nomdep,13,5) as "DEPARTEMENTO"
from departamentos
where length(nomdep) > 12
order by numdep;


-- Actividad 5
select substr(nomdep,-3) as "DEPARTAMENTO"
from departamentos
order by nomdep;


-- Actividad 6
select nomemp, length(nomemp) as "TAMAÑO"
from empleados
where comision is null
order by tamaño;


-- Actividad 7
select nomemp, to_char(fechanac, 'yy-mm-dd') as "FECHA NACIMIENTO"
from empleados
where numdep = 100
order by fechanac;


-- Actividad 8
select nomemp, to_date('1/1/1989', 'dd-mm-yyyy') - fechaing as "Total dias"
from empleados
where extract(year from fechaing) = 1988
and extract(month from fechaing) > 5
order by nomemp;

select nomemp, to_date('1/1/1989', 'dd-mm-yyyy') - fechaing as "Total dias"
from empleados
where to_char(fechaing, 'yyyy') = 1988
and to_char(fechaing,'mm') > 5
order by nomemp;


-- Actividad 9
select nomemp, fechaing
from empleados
where to_char(fechaing, 'yyyy') = 1988
and to_char(fechaing,'ddd') < 91
order by nomemp;


-- Actividad 10
select nomemp
from empleados
where to_char(fechanac,'mm')=11
order by nomemp;


-- Actividad 11
select nomemp
from empleados
where to_char(sysdate,'yyyy')- extract(year from fechaing) = 36
order by nomemp;


-- Actividad 12
select nomemp
from empleados
where trunc(months_between(sysdate,fechanac)/12) > 54;


-- Actividad 13 
select nomemp
from empleados
where extract(year from fechaing) = 2000
order by nomemp; 


-- Actividad 14
select 
    nomemp, +
    fechanac, 
    trunc(months_between(sysdate,fechanac)/12) as "EDAD", 
    trunc(months_between(sysdate,fechanac)/12) - trunc(months_between(sysdate,fechaing)/12) as "EDAD CUANDO INGRESO"
from empleados
where numdep = 111
or numdep = 112
order by nomemp;


-- Actividad 15
select
    substr(nomemp, instr(nomemp,',')+1) as NOMBRE,
    substr(nomemp, 1, instr(nomemp,' ')-1) as APELLIDO1,
    substr(nomemp, instr(nomemp,' ')+1, instr(nomemp,',')-instr(nomemp,' ')-1 ) as APELLIDO2
from empleados;
