--1--
INSERT INTO SUSCRIPCIONES (idSus, contactoSus, residenciaSus, codMembre, costoSus)
VALUES (145, '3001234567', 'Bogotá', 000, 15000);
--2--
INSERT INTO SUSCRIPCIONES (idSus, contactoSus, residenciaSus, codMembre, costoSus)
VALUES (148, '3001234567', 'Bogotá', 5001, 15000);
--3--
INSERT INTO DEVOLUCIONES (idDevolucion, fechaDev, observaciones, idHistorialD)
VALUES (11, TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'Daño en la esquina superior', 103);
--4--
INSERT INTO HISTORIALES_PRESTAMOS (idHistorial, fechaP, idArticuloHP)
VALUES (111, TO_DATE('1999-01-01', 'YYYY-MM-DD'), 300004);
--5--
INSERT INTO SANCIONES (idSancion, tiempoS, tipoS, fechaInS, fechaFinS)
VALUES ('nada', 1, 'Libro Perdido', TO_DATE('2025-03-05', 'YYYY-MM-DD'), TO_DATE('2025-03-10', 'YYYY-MM-DD'));

INSERT INTO SANCIONES (idSancion, tiempoS, tipoS, fechaInS, fechaFinS)
VALUES ('nada', 2, 'LPPNS', TO_DATE('2025-03-05', 'YYYY-MM-DD'), TO_DATE('2025-03-10', 'YYYY-MM-DD'));
--6--
INSERT INTO MULTAS (idMulta, montoM, fechaM, fechaPM, estadoM)
VALUES ('M0010', 15000, TO_DATE('2025-03-28', 'YYYY-MM-DD'), TO_DATE('2025-04-08', 'YYYY-MM-DD'), 'Pendiente');
--7--
INSERT INTO ARTICULOS (idArticulo, nombreArticulo, autor, fecha_pub, estadoFis, extension, num_ISBN, idioma, sinopsis, costoAdq, idACatem, idAEdit, idADisp) 
VALUES (100, 'Introducción a SQL', 'Carlos Pérez', TO_DATE('2023-05-10', 'YYYY-MM-DD'), 'Desgastado', 850, 9781234567890, 'Español', 'Libro sobre bases de datos.', 150000, 3333444455, 1122334466, 2934132); 
--8--
UPDATE EDITORIALES
SET sitWeb = XMLTYPE('<web>https://www.editorialactualizada.com</web>')
WHERE idEdit = 6677889912;
--9--
INSERT INTO DISPONIBILIDADES (idDisp, estado_disp) 
VALUES (123, 'Prestado'); 
--10--
UPDATE INVENTARIOS
SET cantidad_inv = 7,
    condicion_inv = 'publico',
    estanteria = 'B-02',
    acceso = 'Acceso restringido'
WHERE idInv = 4000000010;
--11--
INSERT INTO TRABAJADORES (idTrab, nombreTr, apellidoTr, edad, contactoTrab, residencia, tipoDoc, numDoc, cargo, estadoCivil, idBiblioT)
VALUES (3001, 'Anya', 'Gómez', 25, 'anya@gmail.com', 'Calle 123, Bogotá', 'Cedula Ciudadanía', 1000099245, 'Bibliotecaria', 'Casada', NULL);
--12--
INSERT INTO EVENTOS (idEvento, nombreE, fecha, numAsistentes, tematica, objetivo, idBiblioEv)
VALUES (5001, 'Club de lectura', TO_DATE('2025-06-15', 'YYYY-MM-DD'), 25, 'Festividad', 'Fomentar el hábito lector', 200005);