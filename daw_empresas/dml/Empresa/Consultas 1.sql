-- ejercicio 10
CREATE TABLE resumen(
año NUMBER(4),
mes NUMBER(4),
ingresos NUMBER(10,2),
gastos NUMBER (10,2),
PRIMARY KEY (año, mes)
);

--11
INSERT INTO resumen (año, mes)
VALUES( 2024, 12);

INSERT INTO resumen (año, mes)
VALUES( 2025, 1);

COMMIT;

--12
UPDATE resumen
SET ingresos =
(SELECT SUM(unidades*precio_unidad)
FROM ventas
WHERE EXTRACT (YEAR FROM fecha)=2024
and EXTRACT(month from fecha)=12)
WHERE año=2024 and mes=12;

--13 
update resumen 
set gastos =
    (select sum(unidades*precio_unidad)
    from pedidos
    where to_char(fecha,'mm/yyyy')='12/2024')
    where año = 2024 and mes=12;

--14
update ARTICULOS
set existencias_iniciales = existencias_iniciales + 
    (select nvl(sum(unidades),0)
    from pedidos 
    where extract (year from fecha)=2024
    and pedidos.articulo = articulos.id);

--15
delete from pedidos 
where to_char(fecha,'yyyy')='2024';

--16
update ARTICULOS
set existencias_iniciales = existencias_iniciales + 10
where id=4;

--17
delete from VENTAS
where EXTRACT(year from fecha)= 2024;

--18
alter table clientes
add tipodto number (4,2);

--19
update clientes
set tipodto = 15
where localidad in('Oviedo','Langreo');

update clientes
set tipodto=5
where localidad not in('Oviedo','Lanfreo');

--20
update resumen
set ingresos =
    (select sum(unidades*precio_unidad)
    from ventas 
    where extract(year from fecha)=2025
    and extract (month from fecha)=1),
    gastos = 
    (select sum(unidades*precio_unidad)
    from pedidos
    where to_char(fecha,'mm/yyyy')='10/2025')
where año=2025 and mes=1;    
