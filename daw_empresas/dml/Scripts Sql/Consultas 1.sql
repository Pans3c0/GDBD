declare
    num1 number(2);
    num2 number(2);
    suma number(3);
BEGIN
    num1 := &numero1;
    num2 := &numero2;
    suma := num1 + num2;
    DBMS_OUTPUT.PUT_LINE('El resultado es:'|| suma);

end;
/

DECLARE
    v_fecha DATE;
    v_mes   VARCHAR2(20);
BEGIN
    -- Leer la fecha como entrada del usuario
    v_fecha := TO_DATE('&fecha', 'dd/mm/yy');
    
    -- Extraer el nombre del mes en letras en español
    v_mes := TO_CHAR(v_fecha, 'Month', 'NLS_DATE_LANGUAGE=SPANISH');
    
    -- Eliminar espacios adicionales que TO_CHAR puede dejar
    v_mes := RTRIM(v_mes);

    -- Mostrar el mes
    DBMS_OUTPUT.PUT_LINE('El mes es: ' || INITCAP(v_mes));
END;
/

DECLARE 
    v_fechaInicio DATE;
    v_fechaFin date;
    trienio number(1) DEFAULT 3;
    anoInicial number(4);
    anoFinal number(4);
    v_resultado number(1);

BEGIN
    v_fechaInicio := to_date('&v_fechaInicio', 'dd/mm/yyyy');
    v_fechaFin := to_date('&v_fechaFin', 'dd/mm/yyyy');
    anoInicial := TO_NUMBER(to_char(v_fechaInicio, 'yyyy'));
    anoFinal := to_number(to_char(v_fechaFin, 'yyyy'));
    v_resultado := trunc((anoFinal - anoInicial)/trienio);
    DBMS_OUTPUT.PUT_LINE('La cantidad de trienios es de:' || v_resultado);
end;
/

declare
    cadena varchar2(100);
    cadenaInvertida VARCHAR2(100) DEFAULT null;
    i number(2);
begin 
    cadena := '&cadena';
    i := length(cadena);
    -- for i in reverse 1..length(caedna) loop // Esta es otra manera de inicializarlo sin tener que poner las condiciones dentro y solo tendriamos que ejecutar el proceso.
    loop 
        
        cadenaInvertida := cadenaInvertida || substr(cadena, i, 1);
        -- Prepara la variable para inciar el bucle, por lo que si no nos interesa el siguiente bucle lo paramos aqui.
        i := i - 1;
        exit when i < 1; 
    end loop;
    DBMS_OUTPUT.PUT_LINE('La cadena invertida es: '|| cadenaInvertida);
end;
/



