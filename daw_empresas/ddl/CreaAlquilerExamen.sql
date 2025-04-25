CREATE TABLE GARAJE (
 codigo		CHAR(2)		PRIMARY KEY,
 nombre		VARCHAR(15)	NOT NULL UNIQUE,
 direccion	VARCHAR(20) );

CREATE TABLE COCHE (
 matricula	CHAR(7)		PRIMARY KEY,
 marca		VARCHAR(15)	NOT NULL,
 modelo		VARCHAR(15)	NOT NULL,
 color		VARCHAR(10)	NOT NULL,
 garaje		CHAR(2)		NOT NULL, 
 precioAlquiler	NUMBER(4)	NOT NULL
CONSTRAINT precioalquiler_ok CHECK (precioalquiler>0),
CONSTRAINT coche_garaje FOREIGN KEY (garaje) REFERENCES GARAJE(codigo) );

CREATE TABLE CLIENTE(
 nif		CHAR(9) 	NOT NULL UNIQUE,
 codigo		NUMBER(2) 	PRIMARY KEY,
 nombre		VARCHAR(15) 	NOT NULL,
 direccion	VARCHAR(20)	NOT NULL,
 ciudad		VARCHAR(20)	NOT NULL,
 telefono	CHAR(9) 	NOT NULL );

CREATE TABLE AGENCIA (
 codigo		NUMBER(2)	PRIMARY KEY,
 nombre		VARCHAR(15)	NOT NULL UNIQUE );

CREATE TABLE RESERVA (
 numero		NUMBER(3)	PRIMARY KEY,
 fechaIni	DATE 		DEFAULT SysDate NOT NULL,
 fechaFin	DATE		NOT NULL,
 cliente	NUMBER(2)	NOT NULL,
 agencia	NUMBER(2)	NOT NULL,
 precioTotal	NUMBER(6)	NOT NULL CONSTRAINT precioTotal_ok CHECK (precioTotal>0),
 devuelta	CHAR(1) 	DEFAULT 'N' NOT NULL
CONSTRAINT devuelta_ok CHECK (devuelta IN ('S', 'N')),
CONSTRAINT periodo_ok CHECK ( fechaFin >= fechaIni ),
CONSTRAINT reserva_cliente FOREIGN KEY(cliente) REFERENCES CLIENTE(codigo),
CONSTRAINT reserva_agencia FOREIGN KEY(agencia) REFERENCES AGENCIA(codigo) );

CREATE TABLE LISTA_RESERVA (
 reserva	NUMBER(3)	NOT NULL,
 coche		CHAR(7)		NOT NULL,
 litrosInicio	NUMBER(2)	NOT NULL,
 precioFinal	NUMBER(5)	NOT NULL CONSTRAINT precioFinal_ok CHECK (precioFinal>0),
 CONSTRAINT lista_reserva_pk PRIMARY KEY (reserva, coche),
 CONSTRAINT lista_reserva_reserva FOREIGN KEY(reserva) 
REFERENCES RESERVA(numero) ON DELETE CASCADE,
 CONSTRAINT lista_reserva_coche FOREIGN KEY (coche) REFERENCES COCHE(matricula) );

-- Introducción de datos en las tablas del esquema:

INSERT INTO GARAJE(codigo, nombre, direccion) VALUES ('G2', 'Vistabella', 'Río Thader, 7' );
INSERT INTO GARAJE(codigo, nombre, direccion) VALUES ('G5', 'Vistalegre', 'Jorge Guillén, 10' );
INSERT INTO GARAJE(codigo, nombre, direccion) VALUES ('G3', 'La Flota', 'Salvador Dalí, 4' );
INSERT INTO GARAJE(codigo, nombre, direccion) VALUES ('G6', 'Ronda Sur', 'Sauce, 2' );
INSERT INTO GARAJE(codigo, nombre, direccion) VALUES ('G1', 'San Antón', 'Olma, 23' );
INSERT INTO GARAJE(codigo, nombre, direccion) VALUES ('G4', 'El Carmen', 'Princesa, 8' );

INSERT INTO COCHE(matricula, marca, modelo, color, garaje, precioAlquiler) 
  VALUES ('0765BBC', 'Seat', 'Córdoba', 'Plata', 'G1', 82);
INSERT INTO COCHE(matricula, marca, modelo, color, garaje, precioAlquiler) 
  VALUES ('1234XPQ', 'Lexus', 'RX', 'Blanco', 'G2', 63 );
INSERT INTO COCHE(matricula, marca, modelo, color, garaje, precioAlquiler) 
  VALUES ('2426CBM', 'Audi', 'A3', 'Azul', 'G4', 71);
INSERT INTO COCHE(matricula, marca, modelo, color, garaje, precioAlquiler) 
  VALUES ('4636XPQ', 'Seat', 'Toledo', 'Verde', 'G1', 70 );
INSERT INTO COCHE(matricula, marca, modelo, color, garaje, precioAlquiler) 
  VALUES ('2832BDD', 'Seat', 'Toledo', 'Plata', 'G3', 70);
INSERT INTO COCHE(matricula, marca, modelo, color, garaje, precioAlquiler) 
  VALUES ('2132FPJ', 'Volkswagen', 'Passat', 'Azul', 'G5', 83 );
INSERT INTO COCHE(matricula, marca, modelo, color, garaje, precioAlquiler) 
  VALUES ('1523BBD', 'Volkswagen', 'Polo', 'Verde', 'G2', 60);
INSERT INTO COCHE(matricula, marca, modelo, color, garaje, precioAlquiler) 
  VALUES ('8867GBC', 'Audi', 'A3', 'Rojo', 'G1', 75);
INSERT INTO COCHE(matricula, marca, modelo, color, garaje, precioAlquiler) 
  VALUES ('9495HBC', 'Kia', 'Optima', 'Azul', 'G3', 35 );
INSERT INTO COCHE(matricula, marca, modelo, color, garaje, precioAlquiler) 
  VALUES ('2003CBS', 'Ford', 'Focus', 'Plata', 'G5', 70);
INSERT INTO COCHE(matricula, marca, modelo, color, garaje, precioAlquiler) 
  VALUES ('4152CBM', 'Opel', 'Corsa', 'Verde', 'G4', 50);
INSERT INTO COCHE(matricula, marca, modelo, color, garaje, precioAlquiler) 
  VALUES ('7425CNT', 'Seat', 'Panda', 'Negro', 'G4', 30);
INSERT INTO COCHE(matricula, marca, modelo, color, garaje, precioAlquiler) 
  VALUES ('3030TNT', 'Opel', 'Corsa', 'Blanco', 'G1', 55);
INSERT INTO COCHE(matricula, marca, modelo, color, garaje, precioAlquiler) 
  VALUES ('1520CBM', 'Audi', 'A3', 'Negro', 'G3', 75);
INSERT INTO COCHE(matricula, marca, modelo, color, garaje, precioAlquiler) 
  VALUES ('2494TNT', 'Ford', 'Focus', 'Plata', 'G5', 73);
INSERT INTO COCHE(matricula, marca, modelo, color, garaje, precioAlquiler) 
  VALUES ('1010BBC', 'Audi', 'A4', 'Negro', 'G2', 90);
INSERT INTO COCHE(matricula, marca, modelo, color, garaje, precioAlquiler) 
  VALUES ('2495TNT', 'Lexus', 'IS', 'Rojo', 'G5', 73);


INSERT INTO CLIENTE(nif, codigo, nombre, direccion, ciudad, telefono) 
  VALUES ( '11223344A', 1, 'Antonio Gil', 'Paz, 161', 'Santomera', '512345678');
INSERT INTO CLIENTE(nif, codigo, nombre, direccion, ciudad, telefono) 
  VALUES ( '54321234P', 4, 'Cristina Mota', 'Jardín, 31', 'Beniel', '587654321');
INSERT INTO CLIENTE(nif, codigo, nombre, direccion, ciudad, telefono) 
  VALUES ( '14421875D', 16, 'Ana Romero', 'Aires, 17', 'Ceutí', '516516516');
INSERT INTO CLIENTE(nif, codigo, nombre, direccion, ciudad, telefono) 
  VALUES ( '99001122E', 9, 'Julia Ibáñez', 'Pájaros, 54', 'La Alberca', '511122212');
INSERT INTO CLIENTE(nif, codigo, nombre, direccion, ciudad, telefono) 
  VALUES ( '12345678Z', 2, 'Isabel Aliaga', 'Tejera, 11', 'Ceutí', '522334455');
INSERT INTO CLIENTE(nif, codigo, nombre, direccion, ciudad, telefono) 
  VALUES ( '14253647F', 7, 'Ginés Soriano', 'Libertad, 36', 'Murcia', '555667788');
INSERT INTO CLIENTE(nif, codigo, nombre, direccion, ciudad, telefono) 
  VALUES ( '11122233C', 10, 'Marisa Ripoll', 'Paseo Rosales, 3', 'Molina de Segura', '522233323');
INSERT INTO CLIENTE(nif, codigo, nombre, direccion, ciudad, telefono) 
  VALUES ( '26073442E', 14, 'Eva Andrés', 'Gaudí, 14', 'Santomera', '533221100');
INSERT INTO CLIENTE(nif, codigo, nombre, direccion, ciudad, telefono) 
  VALUES ( '15103048M', 3, 'Rubén Montes', 'Rocasa, 2', 'Beniel', '588990099');
INSERT INTO CLIENTE(nif, codigo, nombre, direccion, ciudad, telefono) 
  VALUES ( '55667788B', 6, 'Gema Mora', 'Huertos, 28', 'Ceutí', '511223344');
INSERT INTO CLIENTE(nif, codigo, nombre, direccion, ciudad, telefono) 
  VALUES ( '18171615L', 15, 'Sergio Saura', 'Rocío, 43', 'Santomera', '599887766');
INSERT INTO CLIENTE(nif, codigo, nombre, direccion, ciudad, telefono) 
  VALUES ( '87654321D', 8, 'Violeta Romero', 'Caminante, 46', 'Molina de Segura', '555566656');
INSERT INTO CLIENTE(nif, codigo, nombre, direccion, ciudad, telefono) 
  VALUES ( '28123112F', 12, 'Pedro Ponte', 'Toboso, 5', 'Murcia', '543210987');
INSERT INTO CLIENTE(nif, codigo, nombre, direccion, ciudad, telefono) 
  VALUES ( '44261472G', 5, 'María Prats', 'Pinos, 27', 'La Alberca', '566677767');
INSERT INTO CLIENTE(nif, codigo, nombre, direccion, ciudad, telefono) 
  VALUES ('52741624C', 13, 'Ernesto Blanes', 'Azucenas, 28', 'Santomera', '544455545');
INSERT INTO CLIENTE(nif, codigo, nombre, direccion, ciudad, telefono) 
  VALUES ( '23200231G', 11, 'Fermín Gómez', 'Aire, 33', 'Molina de Segura', '567890123');

INSERT INTO AGENCIA(codigo, nombre) VALUES ( 3, 'San Andrés');
INSERT INTO AGENCIA(codigo, nombre) VALUES ( 1, 'La Flota');
INSERT INTO AGENCIA(codigo, nombre) VALUES ( 4, 'Gran Vía');
INSERT INTO AGENCIA(codigo, nombre) VALUES ( 2, 'Infante');

-- Reservas de coches realizadas por los clientes (precioTotal = suma(precioFinal))
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (16, TO_DATE('02/11/2024','dd/mm/yyyy'), TO_DATE('04/11/2024','dd/mm/yyyy'), 7, 1, 246, 'S');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (23, TO_DATE('10/02/2024','dd/mm/yyyy'), TO_DATE('15/02/2024','dd/mm/yyyy'), 7, 2, 780, 'S');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (3, TO_DATE('08/02/2024','dd/mm/yyyy'), TO_DATE('11/02/2024','dd/mm/yyyy'), 7, 3, 252, 'S');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (30, TO_DATE('18/03/2025','dd/mm/yyyy'), TO_DATE('24/03/2025','dd/mm/yyyy'), 7, 4, 490, 'N');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (5, TO_DATE('07/03/2024','dd/mm/yyyy'), TO_DATE('09/03/2024','dd/mm/yyyy'), 14, 1, 681, 'S');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (11, TO_DATE('20/06/2024','dd/mm/yyyy'), TO_DATE('21/06/2024','dd/mm/yyyy'), 14, 2, 140, 'S');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (17, TO_DATE('28/11/2024','dd/mm/yyyy'), TO_DATE('30/11/2024','dd/mm/yyyy'), 14, 3, 332, 'S');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (22, TO_DATE('14/01/2025','dd/mm/yyyy'), TO_DATE('19/01/2025','dd/mm/yyyy'), 14, 4, 726, 'S');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (9, TO_DATE('18/05/2024','dd/mm/yyyy'), TO_DATE('20/05/2024','dd/mm/yyyy'), 7, 2, 270, 'S');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (20, TO_DATE('03/01/2025','dd/mm/yyyy'), TO_DATE('07/01/2025','dd/mm/yyyy'), 7, 2, 300, 'S');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (6, TO_DATE('10/03/2024','dd/mm/yyyy'), TO_DATE('15/03/2024','dd/mm/yyyy'), 2, 4, 492, 'S');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (12, TO_DATE('04/07/2024','dd/mm/yyyy'), TO_DATE('20/07/2024','dd/mm/yyyy'), 8, 1, 3536, 'S');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (13, TO_DATE('02/08/2024','dd/mm/yyyy'), TO_DATE('22/09/2024','dd/mm/yyyy'), 6, 4, 1150, 'S');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (14, TO_DATE('05/09/2024','dd/mm/yyyy'), TO_DATE('15/09/2024','dd/mm/yyyy'), 8, 2, 770, 'S');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (15, TO_DATE('03/10/2024','dd/mm/yyyy'), TO_DATE('07/10/2024','dd/mm/yyyy'), 5, 1, 355, 'S');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (1, TO_DATE('26/01/2024','dd/mm/yyyy'), TO_DATE('31/01/2024','dd/mm/yyyy'), 6, 3, 438, 'S');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (7, TO_DATE('03/04/2024','dd/mm/yyyy'), TO_DATE('07/04/2024','dd/mm/yyyy'), 5, 3, 860, 'S');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (18, TO_DATE('11/12/2024','dd/mm/yyyy'), TO_DATE('13/12/2024','dd/mm/yyyy'), 11, 4, 189, 'S');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (19, TO_DATE('12/12/2024','dd/mm/yyyy'), TO_DATE('16/12/2024','dd/mm/yyyy'), 3, 3, 1220, 'S');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (10, TO_DATE('29/05/2024','dd/mm/yyyy'), TO_DATE('04/06/2024','dd/mm/yyyy'), 8, 2, 490, 'S');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (21, TO_DATE('14/01/2025','dd/mm/yyyy'), TO_DATE('15/01/2025','dd/mm/yyyy'), 1, 1, 126, 'S');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (8, TO_DATE('19/04/2024','dd/mm/yyyy'), TO_DATE('28/04/2024','dd/mm/yyyy'), 2, 3, 630, 'S');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (2, TO_DATE('04/02/2024','dd/mm/yyyy'), TO_DATE('10/02/2024','dd/mm/yyyy'), 4, 2, 490, 'S');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (24, TO_DATE('20/02/2025','dd/mm/yyyy'), TO_DATE('23/02/2025','dd/mm/yyyy'), 9, 3, 492, 'N');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (25, TO_DATE('21/02/2025','dd/mm/yyyy'), TO_DATE('24/02/2025','dd/mm/yyyy'), 5, 3, 292, 'N');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (26, TO_DATE('23/02/2025','dd/mm/yyyy'), TO_DATE('28/02/2025','dd/mm/yyyy'), 10, 1, 426, 'N');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (27, TO_DATE('04/03/2025','dd/mm/yyyy'), TO_DATE('10/03/2025','dd/mm/yyyy'), 4, 2, 581, 'N');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (28, TO_DATE('04/03/2025','dd/mm/yyyy'), TO_DATE('10/03/2025','dd/mm/yyyy'), 12, 4, 525, 'N');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (29, TO_DATE('13/03/2025','dd/mm/yyyy'), TO_DATE('14/03/2025','dd/mm/yyyy'), 13, 2, 164, 'N');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (4, TO_DATE('19/02/2024','dd/mm/yyyy'), TO_DATE('23/02/2024','dd/mm/yyyy'), 9, 3, 852, 'S');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (31, TO_DATE('19/03/2025','dd/mm/yyyy'), TO_DATE('25/03/2025','dd/mm/yyyy'), 15, 4, 490, 'N');
INSERT INTO RESERVA(numero, fechaIni, fechaFin, cliente, agencia, precioTotal, devuelta) 
  VALUES (32, TO_DATE('20/03/2025','dd/mm/yyyy'), TO_DATE('24/03/2025','dd/mm/yyyy'), 8, 2, 365, 'N');


-- Detalle de cada reserva (precioFinal = diasreserva * precioalquiler)
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 16, '0765BBC', 40, 246);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 23, '2832BDD', 35, 420);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 23, '1523BBD', 25, 360);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 3 , '1234XPQ', 20, 252);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 30, '4636XPQ', 35, 490);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 5, '2832BDD', 40, 210);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 5, '8867GBC', 40, 225);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 5, '0765BBC', 45, 246);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 11, '2003CBS', 30, 140);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 17, '2132FPJ', 45, 332);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 22, '4152CBM', 15, 300);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 22, '2426CBM', 40, 426);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 9, '1010BBC', 30, 270);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 20, '1523BBD', 20, 300);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 6, '0765BBC', 35, 492);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 12, '4636XPQ', 40, 1190);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 12, '2132FPJ', 45, 1411);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 12, '3030TNT', 15, 935);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 13, '3030TNT', 15, 1155);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 14, '2832BDD', 40, 770);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 15, '2426CBM', 30, 355);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 1, '2495TNT', 25, 438);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 7, '1010BBC', 40, 450);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 7, '0765BBC', 30, 410);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 18, '1234XPQ', 25, 189);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 19, '2132FPJ', 30, 415);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 19, '2426CBM', 35, 355);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 19, '1010BBC', 30, 450);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 10, '2832BDD', 40, 490);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 21, '1234XPQ', 25, 126);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 8, '1234XPQ', 25, 630);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 2, '4636XPQ', 40, 490);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 24, '1234XPQ', 20, 252);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 24, '1523BBD', 25, 240);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 25, '2494TNT', 45, 292);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 26, '2426CBM', 40, 426);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 27, '2132FPJ', 45, 581);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 28, '8867GBC', 40, 525);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 29, '0765BBC', 40, 164);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 4, '8867GBC', 45, 300);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 4, '1234XPQ', 20, 252);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 4, '1520CBM', 40, 300);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 31, '4636XPQ', 35, 490);
INSERT INTO LISTA_RESERVA(reserva, coche, litrosInicio, precioFinal)
  VALUES ( 32, '2495TNT', 20, 365);

-- confirmacion de las operaciones realizadas
COMMIT;


--1(desde SYSTEM)
CREATE USER alquileres IDENTIFIED BY alquileres
DEFAULT TABLESPACE USERS
QUOTA UNLIMITED ON USERS;

GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW, CREATE SEQUENCE TO alquileres.


--2 (desde ALQUILERES)
INSERT INTO cliente(nif,codigo,nombre,direccion,ciudad,telefono)
values('10898989',(SELECT MAX(codigo)+1 FROM cliente),'Luis Vaamonde', 'c/dolores 23','Gij?n','98989889');

CREATE SEQUENCE  SEQ_RESERVA
START WITH 40
INCREMENT BY 1
NOCACHE;

INSERT INTO reserva(numero,fechaini,fechafin,cliente,agencia,preciototal,devuelta)
VALUES(SEQ_RESERVA.NEXTVAL,SYSDATE,SYSDATE+4,(SELECT MAX(codigo) FROM cliente),2,350,'n');


--3
SELECT * FROM reserva 
WHERE cliente IN
(SELECT codigo FROM cliente WHERE ciudad='Murcia')
ORDER BY fechaini;

--4
SELECT coche, COUNT(reserva)  cuantas_reservas 
 FROM lista_reserva, reserva
 WHERE reserva=numero AND TO_CHAR(fechaini,'yyyy')=2021
 GROUP BY coche;
 
 --5
 SELECT matricula, marca, modelo
 FROM coche
 WHERE matricula IN 
 (SELECT coche FROM lista_reserva 
 GROUP BY coche  HAVING COUNT(*)>3)
 ORDER BY marca, modelo;
 
 --6
 SELECT numero, fechaini, fechafin,coche, marca, modelo
 FROM reserva, lista_reserva, coche
 WHERE numero=reserva AND coche=matricula
 AND agencia=4 AND garaje=(SELECT codigo FROM garaje WHERE nombre='San Ant?n')
 ORDER BY fechaini DESC;
 
 --7
 SELECT nif, nombre
 FROM cliente WHERE codigo IN
 (SELECT cliente FROM reserva WHERE numero IN
 (SELECT reserva FROM lista_reserva
 WHERE coche IN
 (SELECT matricula FROM coche WHERE marca='Volkswagen')));
 
SELECT distinct NIF,NOMBRE 
 FROM CLIENTE,RESERVA,COCHE,LISTA_RESERVA
WHERE CODIGO=CLIENTE AND MATRICULA=COCHE AND RESERVA=NUMERO
AND MARCA='Volkswagen';

--8
SELECT SUBSTR(nombre, INSTR(nombre,' ')+1) APELLIDO,
 SUBSTR(nombre, 1, INSTR(nombre, ' ')-1) NOMBRE
FROM cliente
ORDER BY 1,2;

--9
SELECT nombre, COUNT(matricula) "N?COCHES"
FROM coche, garaje
WHERE garaje(+)=codigo
GROUP BY nombre;

--10
SELECT litrosinicio,fechaini, preciototal, fechafin-fechaini DIAS
FROM reserva, lista_reserva
WHERE numero=reserva AND coche='0765BBC'
ORDER BY preciototal DESC;



