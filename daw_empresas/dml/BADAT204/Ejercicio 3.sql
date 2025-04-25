create table viajes (
    codigo varchar2(4) primary key,
    fecha_ini date,
    fecha_fin date,
    detino varchar2(20),
    precio number (6,2),
    plazas number(3)
);

create table clientes (
    codigo varchar2(5) primary key,
    nombre varchar2(25),
    direccion varchar2(30),
    saldo_deudor number(6,2) default 0
);

create table reservas (
    codigo_v varchar2(4),
    codigo_c varchar2(5),
    fecha_res date default sysdate,
    num_plazas number(2),
    codigo_v references viajes(codigo),
    codigo_c references clientes(codigo)
);