--=========================== HISTORIA 1 ===========================--
--Lucía es una joven estudiante que frecuenta la biblioteca. Un día, decide suscribirse y pedir prestado un libro.--
--Sin embargo, extravía el ejemplar, lo que genera una sanción por “Libro Perdido” y una multa que luego debe pagar.--
 
--1. Se actualiza el identificador de la disponibilidad del libro.--
UPDATE DISPONIBILIDADES
SET idDisp = 910000
WHERE estado_disp = 'Disponible';
 
--2. Se registra la categoría, editorial y el artículo.--
INSERT INTO CATEGORIAS_TEMAS VALUES (600001, 'Ficción', 'Novela', 'Drama');
INSERT INTO EDITORIALES (idEdit, nombreEd, contacto) VALUES (700001, 'Hercules', '3100000000');
INSERT INTO ARTICULOS (idArticulo, nombreArticulo, autor, fecha_pub, estadoFis, extension, num_ISBN, idioma, sinopsis, costoAdq, idACatem, idAEdit, idADisp) 
VALUES (300011, 'El Mar Perdido', 'Carlos Ruiz', TO_DATE('2015-05-10', 'YYYY-MM-DD'),'Buen Estado', 300, 9788499988776, 'Español', 'Una novela atrapante',15000, 600001, 700001, 910000);
 
--3. Se registra una biblioteca que almacenará el artículo.--
INSERT INTO BIBLIOTECAS VALUES (200011, 'BiblioticCentral', 'Centro', '3200000000', 10, '08:00', '18:00', 'Edificio Principal');
 
--4. Se agrega el artículo al inventario de la biblioteca.--
INSERT INTO INVENTARIOS VALUES (15421, TO_DATE('2024-01-01', 'YYYY-MM-DD'), 'El Libro Olvidado', 5, 'publico', 'A01','Acceso total', 200011, 910000);
 
--5. Se registra el préstamo del artículo.--
INSERT INTO HISTORIALES_PRESTAMOS (idHistorial, idArticuloHP)
VALUES (500001, 300011);
 
--6. Lucía se suscribe a la biblioteca.--
INSERT INTO SUSCRIPCIONES (idSus, contactoSus, residenciaSus, costoSus)
VALUES (45875, '3150000000', 'Calle 123', 20000);
 
--7. Se crea el usuario Lucía.--
INSERT INTO USUARIOS VALUES (100001, 'Lucía', 'Gómez', 'Cedula Ciudadanía', 1000000010, 25, 500001, 600001);
 
--8. Lucía realiza una reserva del artículo.--
INSERT INTO RESERVAS VALUES (800001, 7, 1, 'Entrega en mostrador', 910000);
INSERT INTO USUARIOSXRESERVAS VALUES (100001, 800001);
 
--9. Lucía no devuelve el libro y se reporta como perdido.--
INSERT INTO DEVOLUCIONES VALUES (601, TO_DATE('2024-01-10', 'YYYY-MM-DD'), 'Libro perdido en transporte', 500001);
 
--10. El sistema genera una sanción de tipo “Libro Perdido”.--
INSERT INTO SANCIONES (idSancion, tiempoS, tipoS, fechaInS, fechaFinS)
VALUES ('M0010', 30, 'Libro Perdido', TO_DATE('2024-01-12', 'YYYY-MM-DD'), TO_DATE('2024-02-11', 'YYYY-MM-DD'));
 
--11. Se asocia la sanción con el préstamo de Lucía.--
INSERT INTO HISTORIALESXSANCIONES VALUES ('M0010', 500001);
 
--12. El sistema emite una multa por la sanción.--
INSERT INTO MULTAS (idMulta, montoM, fechaM, fechaPM, estadoM)
VALUES ('M0010', 50000, TO_DATE('2024-01-12', 'YYYY-MM-DD'), TO_DATE('2024-02-01', 'YYYY-MM-DD'), 'Pendiente');
 
--13. Lucía consulta la multa generada.--
DECLARE
  c SYS_REFCURSOR;
BEGIN
  c := PC_SANCIONES.CON_multa('M0010');
  DBMS_SQL.RETURN_RESULT(c);
END;
 
--14. Posteriormente, Lucía realiza el pago.--
BEGIN
  PC_SANCIONES.MOD_multa(idMultax => 'M0010', estadoMx => 'Pagado');
END;
 
--15. El administrador valida que no queden multas pendientes.--
DECLARE
  c SYS_REFCURSOR;
BEGIN
  c := PC_SANCIONES.CON_NO_PAG;
  DBMS_SQL.RETURN_RESULT(c);
END;


--=========================== HISTORIA 2 ===========================--
--Daniel Ríos es un escritor local que publica su nuevo libro en la Biblioteca Ares.--
--Para promocionarlo, organiza un taller de escritura y colabora en actividades culturales.--
--Una asistente, Mariana, se suscribe, asiste al evento y reserva el libro.--
--1. Se registra una nueva categoría y editorial
INSERT INTO CATEGORIAS_TEMAS VALUES (600003, 'Literatura', 'Ensayo', 'Creación Literaria');
INSERT INTO EDITORIALES (idEdit, nombreEd, contacto) VALUES (700003, 'Pluma Viva', '3112223333');

--2. Daniel registra su nuevo libro
INSERT INTO ARTICULOS (idArticulo, nombreArticulo, autor, fecha_pub, estadoFis, extension, num_ISBN, idioma, sinopsis, costoAdq, idACatem, idAEdit, idADisp)
VALUES (300013, 'Lenguas que Arden', 'Daniel Ríos', TO_DATE('2024-04-20', 'YYYY-MM-DD'), 'Nuevo', 220, 9789876543210, 'Español', 'Taller y guía de escritura creativa', 10000, 600003, 700003, 910002);

--3. Se crea una biblioteca
INSERT INTO BIBLIOTECAS VALUES (200013, 'Biblioteca Ares', 'Centro Histórico', '3219998888', 20, '08:00', '19:00', 'Edificio Histórico');

--4. El artículo se incorpora al inventario
INSERT INTO INVENTARIOS VALUES (15423, TO_DATE('2024-04-21', 'YYYY-MM-DD'), 'Lenguas que Arden', 5, 'publico', 'Sala Creativa', 'Acceso total', 200013, 910002);

--5. Se registra un historial de préstamo
INSERT INTO HISTORIALES_PRESTAMOS (idHistorial, idArticuloHP)
VALUES (500003, 300013);

--6. Mariana se suscribe a la biblioteca
INSERT INTO SUSCRIPCIONES (idSus, contactoSus, residenciaSus, costoSus)
VALUES (45877, '3143334444', 'Calle 8 #20-10', 10000);

--7. Se registra a Mariana como usuaria
INSERT INTO USUARIOS VALUES (100003, 'Mariana', 'López', 'Cédula Ciudadanía', 1000000030, 28, 500003, 600003);

--8. Se registra a Daniel como trabajador cultural
INSERT INTO TRABAJADORES VALUES (40002, 'Daniel', 'Ríos', 'Organizador Cultural', 'daniel@plumaviva.com', 200013);

--9. Daniel organiza un evento literario
INSERT INTO EVENTOS_ACTIVIDADES (idEvento, nombreEv, tipoEv, descripcionEv, fechaEv, cupo, idEBiblio)
VALUES (11002, 'Taller de Escritura Creativa', 'Taller', 'Ejercicios prácticos con escritores', TO_DATE('2024-05-05', 'YYYY-MM-DD'), 25, 200013);

--10. Daniel toma el turno para ese evento
INSERT INTO TURNOS_TRABAJADORES VALUES (40002, TO_DATE('2024-05-05 08:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-05-05 14:00', 'YYYY-MM-DD HH24:MI'));

--11. Mariana asiste al evento
INSERT INTO USUARIOSXEVENTOS VALUES (100003, 11002);

--12. Luego realiza una reserva del libro de Daniel
INSERT INTO RESERVAS VALUES (800003, 5, 1, 'Lectura en sala', 910002);
INSERT INTO USUARIOSXRESERVAS VALUES (100003, 800003);

--13. Mariana devuelve el libro con retraso
INSERT INTO DEVOLUCIONES VALUES (900003, TO_DATE('2024-05-12', 'YYYY-MM-DD'), 'Retraso de entrega por 3 días', 500003);

--14. El sistema genera una sanción por retraso
INSERT INTO SANCIONES (idSancion, tiempoS, tipoS, fechaInS, fechaFinS)
VALUES ('R0030', 3, 'Retraso en entrega', TO_DATE('2024-05-10', 'YYYY-MM-DD'), TO_DATE('2024-05-13', 'YYYY-MM-DD'));

--15. La sanción se asocia al historial de Mariana
INSERT INTO HISTORIALESXSANCIONES VALUES ('R0030', 500003);

--16. Se genera una multa por la sanción
INSERT INTO MULTAS (idMulta, montoM, fechaM, fechaPM, estadoM)
VALUES ('R0030', 12000, TO_DATE('2024-05-10', 'YYYY-MM-DD'), TO_DATE('2024-05-20', 'YYYY-MM-DD'), 'Pendiente');

--17. Consultar la multa de Mariana
DECLARE
  c SYS_REFCURSOR;
BEGIN
  c := PC_SANCIONES.CON_multa('R0030');
  DBMS_SQL.RETURN_RESULT(c);
END;

--18. Mariana paga la multa
BEGIN
  PC_SANCIONES.MOD_multa(idMultax => 'R0030', estadoMx => 'Pagado');
END;

--19. Validar que ya no hay multas pendientes
DECLARE
  c SYS_REFCURSOR;
BEGIN
  c := PC_SANCIONES.CON_NO_PAG;
  DBMS_SQL.RETURN_RESULT(c);
END;

--20. Consultar estadísticas de uso
DECLARE
  c SYS_REFCURSOR;
BEGIN
  c := PC_ESTADISTICAS.CONSULTAR_ARTICULOS_FRECUENTES;
  DBMS_SQL.RETURN_RESULT(c);
END;