
-- Actividad 10
select numdep, numhijos, count(numemp) as "NUM_EMPLEADO"
from EMPLEADOS
group by numdep, numhijos
order by numdep, numhijos;


-- Actividad 11
select numhijos, max(salario), min(salario), count(numemp)
from empleados
where numhijos > 0
group by numhijos
having count(numemp) > 2
order by numhijos;


-- Actividad 12
select numdep, avg(salario)
from empleados 
group by numdep 
having max (salario) < (
    select avg(salario)
    from empleados
)
order by numdep;

-- Actividad 13
select 
    NUMDEP, 
    min(salario) as "Salario Minimo",
    max(salario) as "Salario Maximo",
    round(avg(salario)) as "Salario Medio"
from empleados
group by numdep
having avg(months_between(sysdate, fechaing)/12)>
    (Select avg(months_between(sysdate, fechaing)/12)
    from empleados)
order by numdep;

-- Actividad 14
select numdep, sum (salario) as "Suma de salarios"
from EMPLEADOS
group by numdep
having sum (salario) =
    (select max(sum(salario))
    from empleados
    group by numdep);


-- Actividad 15
select 
    NUMDEP,
    count(numemp) as "Nº Empleados", 
    sum(salario) as "Suma Salarios",
    sum(comision) as "Suma Comisiones",
    sum(numhijos) as "Suma De Hijos"
from EMPLEADOS
where numdep in
    (select numdep
    from departamentos
    where tipodir = 'T')
group by numdep
order by numdep;

-- Actividad 16
select d.nomdep, round(avg(e.salario)) as salario_media
from EMPLEADOS e, DEPARTAMENTOS d
where e.numdep = d.numdep
group by d.NOMDEP
where e.salario_media > 
    (select avg(salario) as salario_medio
    from empleados)
order by d.nomdep;
