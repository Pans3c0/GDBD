declare
    numemp empleados.numemp%type;
    salario empleados.salario%type;
    comision empleados.comision%type;
    total number(6);
begin
    numemp := &numero_empleado;
    select salario, comision into salario, comision
    from empleados where numemp = numemp;
    total := nvl(salario,0)*14 + nvl(comsion, 0)*12;
    DBMS_OUTPUT.PUT_LINE('Salario Total:' || total || ' total');
exception 
    when no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('no Existe el empleado' || numemp);
    when others then 
        DBMS_OUTPUT.PUT_LINE('Error...' || sqlerrm);
end;

-- 2
declare 
    vnumemp empleados.numemp%type;
    vsalario empleados.salario%type;
BEGIN
    vnumemp := &numero_empleado;
    select salario into vsalario from empleados where numemp = vnumemp;
    update empleados set salario=vsalario*1.1 where numemp=vnumemp;
    DBMS_OUTPUT.PUT_LINE('El salario es:' || vsalario);
exception 
    when no_data_found then 
        DBMS_OUTPUT.PUT_LINE('No existe el empleado' || vnumemp);
    when others then 
        DBMS_OUTPUT.PUT_LINE('Error...' || sqlerrm);
end;            

--3
create table errores(msg varchar2(100));


declare
    codigo departamentos.numdep%type;
    nombre departamentos.nomemp%type;
    presupuesto departamentos.presupueto&type;
    mensaje varchar2(100);
BEGIN
    codigo := &codigodep;
    nombre := &nomdep;
    presupuesto := &presupuesto;
    insert into departamentos(numdep, nomdep, presup, nomofic, director, tipodir)
    values (codigo, nombre, presupuesto, 10, 120, 'T');
exception
    when dup_val_on_index then
        insert into errores values ("Error, el departamento ya existe.");
    when value_error then 
        insert into errores values ("Demasiado largo");
    when other then
        mensaje := 'Error' || sqlerrm;
        insert into errores values (mensaje);
end;

