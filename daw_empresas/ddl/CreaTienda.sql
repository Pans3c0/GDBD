-- crear tablas

CREATE TABLE clientes(
    codigo NUMBER(4) PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    localidad VARCHAR2(30));

CREATE TABLE proveedores(
    codigo NUMBER(4) PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    localidad VARCHAR2(30));

CREATE TABLE articulos(
    id NUMBER(4) PRIMARY KEY,
    descripcion VARCHAR2(100),
    precio NUMBER(5,2),
    existencias_iniciales NUMBER(4) CHECK (existencias_iniciales >=0) );


CREATE TABLE ventas(
    albaran NUMBER(4) PRIMARY KEY,
    fecha DATE DEFAULT SYSDATE,
    cliente NUMBER(4),
    articulo NUMBER(4),
    unidades NUMBER(3) CHECK (unidades >=1),
    FOREIGN KEY(cliente)
     REFERENCES clientes(codigo),
     FOREIGN KEY(articulo)
     REFERENCES articulos(id));


CREATE TABLE pedidos(
    num_pedido NUMBER(4) PRIMARY KEY,
    proveedor NUMBER(4),
    articulo NUMBER(4),
    precio_unidad NUMBER(5,2),
    fecha DATE,
    unidades NUMBER(3) CHECK (unidades >=1),
    FOREIGN KEY(proveedor)
 REFERENCES proveedores(codigo),
FOREIGN KEY(articulo)
    REFERENCES articulos(id));



-- A adir clientes:
INSERT INTO clientes(codigo,nombre,localidad) VALUES (2,'Inform tica Norte','Oviedo');
INSERT INTO clientes(codigo,nombre,localidad) VALUES (3,'Luis Garc a','Avil s');
INSERT INTO clientes(codigo,nombre,localidad) VALUES (4,'IES Monte Naranco','Oviedo');
INSERT INTO clientes(codigo,nombre,localidad) VALUES (5,'Super Chip','Langreo');
INSERT INTO clientes(codigo,nombre,localidad) VALUES (6,'Inform tica Gonz lez','Gij n');
INSERT INTO clientes(codigo,nombre,localidad) VALUES (7,'AsturComputer','Oviedo');

-- A adir proveedores:
INSERT INTO proveedores(codigo,nombre,localidad) VALUES (1,'Servicios Inform ticos','Madrid');
INSERT INTO proveedores(codigo,nombre,localidad) VALUES (2,'Abaco S.A.','Barcelona');
INSERT INTO proveedores(codigo,nombre,localidad) VALUES (3,'PC-Espa a','Madrid');

-- A adir art culos:
INSERT INTO articulos(id,descripcion,precio,existencias_iniciales) VALUES (1,'RAM-DDR-2 2GB',35,20);
INSERT INTO articulos(id,descripcion,precio,existencias_iniciales) VALUES (2,'RAM-DDR-2 1GB',20,45);
INSERT INTO articulos(id,descripcion,precio,existencias_iniciales) VALUES (3,'RAM-DDR-3 2GB',45,15);
INSERT INTO articulos(id,descripcion,precio,existencias_iniciales) VALUES (4,'PLACA BASE XT-100',56,5);
INSERT INTO articulos(id,descripcion,precio,existencias_iniciales) VALUES (5,'PLACA BASE DL-45',67,20);
INSERT INTO articulos(id,descripcion,precio,existencias_iniciales) VALUES (6,'RAT N B4',12,30);
INSERT INTO articulos(id,descripcion,precio,existencias_iniciales) VALUES (7,'RAT N G2',15,20);
INSERT INTO articulos(id,descripcion,precio,existencias_iniciales) VALUES (8,'MONITOR TFT 19',89,6);
INSERT INTO articulos(id,descripcion,precio,existencias_iniciales) VALUES (9,'MONITOR TFT 21',101,5);
INSERT INTO articulos(id,descripcion,precio,existencias_iniciales) VALUES (10,'DISCO DURO SATA 1TB',95,14);

-- A adir pedidos:
INSERT INTO pedidos(num_pedido,proveedor,articulo,precio_unidad,fecha,unidades) VALUES (1,1,1,15,'1/12/2024',20);
INSERT INTO pedidos(num_pedido,proveedor,articulo,precio_unidad,fecha,unidades) VALUES (2,2,1,14,'21/12/2024',100);
INSERT INTO pedidos(num_pedido,proveedor,articulo,precio_unidad,fecha,unidades) VALUES (3,1,2,16,'3/1/2025',40);
INSERT INTO pedidos(num_pedido,proveedor,articulo,precio_unidad,fecha,unidades) VALUES (4,3,4,31,'6/1/2025',25);
INSERT INTO pedidos(num_pedido,proveedor,articulo,precio_unidad,fecha,unidades) VALUES (5,2,6,7,'8/1/2025',10);

-- A adir ventas:
INSERT INTO ventas(albaran,fecha,cliente,articulo,unidades) VALUES (1,'10/12/2024',2,4,10);
INSERT INTO ventas(albaran,fecha,cliente,articulo,unidades) VALUES (2,'11/12/2024',3,5,5);
INSERT INTO ventas(albaran,fecha,cliente,articulo,unidades) VALUES (3,'12/12/2024',6,1,10);
INSERT INTO ventas(albaran,fecha,cliente,articulo,unidades) VALUES (4,'2/1/2025',4,2,2);
INSERT INTO ventas(albaran,fecha,cliente,articulo,unidades) VALUES (5,'2/1/2025',2,3,5);
INSERT INTO ventas(albaran,fecha,cliente,articulo,unidades) VALUES (6,'3/1/2025',3,1,4);
INSERT INTO ventas(albaran,fecha,cliente,articulo,unidades) VALUES (7,'4/1/2025',3,6,2);
INSERT INTO ventas(albaran,fecha,cliente,articulo,unidades) VALUES (8,'5/1/2025',2,4,3);
INSERT INTO ventas(albaran,fecha,cliente,articulo,unidades) VALUES (9,'5/1/2025',4,5,1);
INSERT INTO ventas(albaran,fecha,cliente,articulo,unidades) VALUES (10,'5/1/2025',6,1,5);

commit;

