-- 5
CREATE SEQUENCE seqalbaran
START WITH 11
INCREMENT BY 1
NOCACHE;

INSERT INTO ventas (albaran, fecha, cliente, articulo, unidades)
SELECT seqalbaran.NEXTVAL, SYSDATE, codigo, 11, 1
FROM clientes;