SELECT * FROM ARTICULOS;

DELETE FROM CATEGORIAS_TEMAS WHERE idCatem = 1111222233;
DELETE FROM EDITORIALES WHERE sitWeb IS NULL;
DELETE FROM DISPONIBILIDADES WHERE estado_disp = 'Perdido'; --No debe funcionar, es ON DELETE RESTRICT--

SELECT * FROM ARTICULOS;

------------------------------------------------------------
SELECT * FROM INVENTARIOS;

DELETE FROM BIBLIOTECAS WHERE idBiblio = 200007;
DELETE FROM DISPONIBILIDADES WHERE estado_disp = 'Disponible'; --No debe funcionar; es ON DELETE RESTRICT--

SELECT * FROM INVENTARIOS;

------------------------------------------------------------
SELECT * FROM EVENTOS;

DELETE FROM BIBLIOTECAS WHERE idBiblio < 200003;

SELECT * FROM EVENTOS;

-------------------------------------------------------------
SELECT * FROM TRABAJADORES;

DELETE FROM BIBLIOTECAS WHERE idBiblio = 200003;

SELECT * FROM TRABAJADORES;
-------------------------------------------------------------
SELECT * FROM TRABAJADORESXTURNOS;

DELETE FROM TRABAJADORES WHERE idTrab = 10000006;
DELETE FROM TURNOS_TRABAJADORES WHERE idTurno < 50006;

SELECT * FROM  TRABAJADORESXTURNOS;
-------------------------------------------------------------
SELECT * FROM USUARIOS;

DELETE FROM SUSCRIPCIONES WHERE idSus <= 203;
DELETE FROM HISTORIALES_PRESTAMOS WHERE idHistorial = 104;

SELECT * FROM USUARIOS;
-------------------------------------------------------------
SELECT * FROM RESERVAS;

DELETE FROM DISPONIBILIDADES WHERE estado_disp = 'Perdido'; --No debe funcionar, es ON DELETE RESTRICT--

SELECT * FROM RESERVAS;
-------------------------------------------------------------
SELECT * FROM USUARIOSXRESERVAS;

DELETE FROM USUARIOS WHERE idUsuario = 5;
DELETE FROM RESERVAS WHERE tiempoR = 72;

SELECT * FROM USUARIOSXRESERVAS;
-------------------------------------------------------------
SELECT * FROM HISTORIALES_PRESTAMOS;

DELETE FROM ARTICULOS WHERE idioma = 'Inglés';

SELECT * FROM HISTORIALES_PRESTAMOS;
-------------------------------------------------------------
SELECT * FROM HISTORIALESXSANCIONES;

DELETE FROM HISTORIALES_PRESTAMOS WHERE idArticuloHP = 300001;
DELETE FROM SANCIONES WHERE tipoS = 'LPPNS';

SELECT * FROM HISTORIALESXSANCIONES;
-------------------------------------------------------------
SELECT * FROM DEVOLUCIONES;

DELETE FROM HISTORIALES_PRESTAMOS WHERE idHistorial = 105;

SELECT * FROM DEVOLUCIONES;
-------------------------------------------------------------
SELECT * FROM ESTADISTICAS_USO;

DELETE FROM HISTORIALES_PRESTAMOS WHERE fechaP = '07/03/24';
DELETE FROM BIBLIOTECAS WHERE cantEmpleado = 20;

SELECT * FROM ESTADISTICAS_USO;
-------------------------------------------------------------
SELECT * FROM MULTAS;

DELETE FROM SANCIONES WHERE idSancion LIKE 'B%';

SELECT * FROM MULTAS;
-------------------------------------------------------------
SELECT * FROM BLOQUEOS;

DELETE FROM SANCIONES WHERE tiempoS < 10;

SELECT * FROM BLOQUEOS;
-------------------------------------------------------------
--Después de las pruebas, ejecutar Xpoblar y realizar nuevamente el PoblarOk--