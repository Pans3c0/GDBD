-- Actividad 1
select nomcen
from oficinas;


-- Actividad 2
select nomemp
from empleados
where numdep = 121;


-- Actividad 3
select nomemp, salario
from empleados
where numhijos > 3
order by nomemp;


-- Actividad 4
select comision, numdep, nomemp
from empleados
where salario < 1900 and comision is not null
order by numdep asc, comision desc;


-- Actividad 5
select nomdep
from departamentos
where presup > 10
order by nomdep;


-- Actividad 6
select distinct numdep
from empleados
where salario < 1250;


-- Actividad 7
select distinct comision 
from empleados
where numdep = 110;


--Actividad 8
select nomemp, numemp, extension
from empleados
where numdep = 121
order by nomemp;


-- Actividad 9
select salario, nomemp
from empleados
where numhijos = 0
order by salario desc;


-- Actividad 10



-- Actividad 11
select salario, nomemp
from empleados
where comision >= (0.10*salario);


-- Actividad 12
select nomemp, salario, (100*numhijos) as "extra", (salario + (100*numhijos)) as "total"
from empleados;

--Actividad 13 
select nomemp
from empleados
where numhijos*100;


--Actividad 15
select nomemp, salario + NVL(comision,0)AS"SALARIO TOTAL"
from empleados
where salario + NVL(comision,0) > 2300
order by numemp;


-- Actividad 16
select numdep as "DEPARTAMENTO"
from empleados
where comision > (salario*0.10);


-- Actividad 17
select nomemp
from empleados
where salario between 2000 and 2500
order by nomemp;


-- Actividad 18
select nomemp
from empleados
where nomemp like 'Al%'
order by nomemp;


-- Actividad 19
select nomemp
from empleados
where nomemp like '%, L%'
order by nomemp;


-- Actividad 20
select nomemp
from empleados
where nomemp like '_______ %'
order by nomemp;


-- Actividad 21
select nomemp
from empleados
where nomemp like '_____% %,%'
or  nomemp like '% ______%,%'
order by nomemp;


-- Actividad 22
select nomemp
from empleados
where nomemp like '% ____,%'
or nomemp like '% ___,%'
or nomemp like '% __,%'
order by nomemp;


-- Actividad 23
select nomemp
from empleados
where nomemp like '%o';


-- Actividad 24
select nomemp, salario, fechaing 
from empleados
where fechaing > '01-01-88' or salario < 1500
order by fechaing, salario desc;


-- Actividad 25
select nomdep as "NOMBRE DEL DEPARTAMENTO"
from departamentos
where nomdep not like 'DIRECCION%'
and nomdep not like 'SECTOR%'
order by nomdep;
