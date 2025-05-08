--1
declare 
    numero number(7);
    function factorial(n number) return number is 
    resultado number(4) := 1;
begin 
    for i in 1..n loop 
    resultado := resultado * i;
    end loop;
    return resultado; 
    end factorial;

    begin numero:= &introdu_cenumero;
    DBMS_OUTPUT.PUT_LINE('Su factorial es; '|| factorial(numero));
end;