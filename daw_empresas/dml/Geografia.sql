select p.nombre as provincia, l.nombre as capital 
from provincias p
join localidades l 
on p.id_capital = l.id_localidad
order by p.nombre;

select l.nombre as "Localidad", p.nombre as "Provincia"
from localidades l, provincias p, comunidades c
where l.n_provincia = p.n_provincia
and c.id_comunidad = p.id_comunidad
and c.nombre = 'Cataluña'
order by l.nombre;


select lc.nombre as "Capital", l.nombre as "Localidad", p.nombre as "Provincia"
from localidades l, provincias p, comunidades c, localidades lc
where l.n_provincia = p.n_provincia
where lc.id_localidad = p.id_capital
and c.id_comunidad = p.id_comunidad
and c.nombre = 'Galicia'
order by l.nombre;


select lc.nombre as "Capital", l.nombre as "Localidad", p.nombre as "Provincia"
from localidades l, provincias p, comunidades c, localidades lc, provincias pc
where l.n_provincia = p.n_provincia
where lc.id_localidad = p.id_capital
and pc.
and c.id_comunidad = p.id_comunidad
and c.nombre = 'Galicia'
order by l.nombre;

select *
from provincias p, comunidades c, localidades l, localidades lc
where p.id_comunidad = c.id_comunidad
where p.n_provincias=l.n_provincias
and c.nombre = 'Galicia'
and p.id_capital = lc.id_localidad;

select l.nombre 
from provincias p, comunidades c, localidades l, localidades lc, localidades lcc
where p.n_pronvincias=l.n_provincias
and p.p.ID_COMUNIDAD = c.ID_COMUNIDAD
and c.nombre = 'Galicia'
and p.p.ID_CAPITAL = lc.ID_LOCALIDAD
and c.ID_CAPITAL = lcc.ID_LOCALIDAD
order by 1;