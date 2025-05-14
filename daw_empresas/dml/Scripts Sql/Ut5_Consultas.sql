create or replace trigger ejercicio1
after insert or delete or update
on empleados
DECLARE
    operacion varchar2(20);
begin
    if inserting THEN
        operacion := "INSERCION";
    else if deleting THEN
        operacion := "BORRADO";
    else
        operacion := "ACTUALIZACION";
    end if;
    insert into control_usu(usuario,operacion,fecha) 
        values (USER, operacion, sysdate);
END;

---

create table aditaremple 

create trigger ejercicio2
after insert or delete
on empleados
for each row    
declare 
    columna auditaremple.col1%type
begin 
    if inserting then 
        columna:= to_char(sysdate, 'dd/mm/yy') || '*' || to_char(sysdate,'hh24:mi:ss') || '*' || :new.numemp || '*' || :new.nomemp || '* INSERCCION';
    else
        columna:= to_char(sysdate, 'dd/mm/yy') || '*' || to_char(sysdate,'hh24:mi:ss') || '*' || :old.numemp || '*' || :old.nomemp || '* BORRADO';
    end if;
    insert into auditaremple values (columna);


end;