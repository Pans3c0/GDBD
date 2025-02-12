
-- Actividad 8
select nomemp
from empleados
where numemp in (
    select director
    from departamentos
    where tipodir='T')
order by 1;


-- Actividad 9
select nomemp, to_char(salario*0.05,'999L') as "GRATIFICACION"
from empleados
where numemp in(
    select director
    from departamentos
    where tipodir='T')
order by 1;

-- Actividad 10
select numemp, nomemp, salario, comision
from empleados
where numemp not in(
    select distinct director
    from departamentos)
order by nomemp;


-- Actividad 11 REVISAR
select e.nomemp, d.tipodir
from empleados e
inner join departamentos d
on e.numdep = d.numdep
where d.director = (
    select e2.numemp
    from empleados e2
    where e2.nomemp = 'Alonso P�rez, Marcos')
order by nomemp;


-- Actividad 12
select e.nomemp, e.numemp, d.numdep, o.direcen
from empleados e
inner join departamentos d on e.numdep = d.numdep
inner join oficinas o on o.numofic = d.numofic
where o.numofic = (
    select o2.numofic
    from oficinas o2
    where o2.direcen like '%, GIJ�N'
)
order by e.nomemp;

-- ACTIVIDAD 13
select e.*
from empleados e
inner join departamentos d on e.numdep = d.numdep
where d.nomdep = 'SECTOR SERVICIOS'
order by fechaing;

-- Actividad 14
SELECT *
from empleados;