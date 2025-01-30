-- Actividades 1
select nombre from nuevos
UNION
select nombre from antiguos 
intersect 
select nombre from alum;


-- Actividades 2

select nombre from antiguos 
intersect 
select nombre from nuevos 
intersect 
select nombre from alum 
order by nombre;


-- Actividades 3

select nombre from alum 
MINUS
    (select nombre 
    from ANTIGUOS
        union 
    select nombre 
    from nuevos)
order by nombre;

-- Actividades 4

select NOMBRE_LIBRO, fecha, cod_libro
from leido l 
join PARALEER p
on p.cod_libro = l.cod_libro;

select nombre_libro, fecha from leidos l, paraleer p where l.cod_libro = p.cod_libro;


-- Actividadse 5
select cod_libro
from leidos 
where cod_libro not in 
    (select cod_libro 
    from leidos);

-- Actividades 6
select l.nombre_libro
from leidos l, paraleer p 
where l.cod_libro(+) = p.cod_libro;

select p.nombre_libro, l.fecha
from paraleer p 
left join leidos l 
on p.cod_libro = l.cod_libro;

-- Actividades 7
select c.nombre, p.especialidad, count(p.dni)
from centros c 
left join profesores p 
on c.cod_centro = p.cod_centro
group by c.nombre, p.ESPECIALIDAD
order by c.nombre
;

-- Actividades 8
