create user daw_uniovi
IDENTIFIED by uniovi 
DEFAULT TABLESPACE users
QUOTA 500M ON users;

grant create session 
to daw_uniovi
with admin option;

grant create user, 
create table, 
create view to daw_uniovi;

--2
create user daw_gerencia
create view profes_view 
as 
select nombreProfe, apellidosProfe, codCentro, salario 
from profesores;

grant select 
on profes_view 
to daw_gerencia;

grant update(departamento)
on profesores 
to daw_gerencia;

grant update(departamento)
on profesores 
to daw_gerencia;

grant select, update, 
insert on centros 
to daw_gerencia;