--1--
INSERT INTO SUSCRIPCIONES (idSus, contactoSus, residenciaSus, codMembre, costoSus)
VALUES (4, '5553334444', 'Zona Norte',1457, 9000);
--2--
INSERT INTO DEVOLUCIONES (idDevolucion, fechaDev, observaciones, idHistorialD)
VALUES (12, TO_DATE('2024-04-03', 'YYYY-MM-DD'), '', 104);
--3--
INSERT INTO HISTORIALES_PRESTAMOS (idHistorial, fechaP, idArticuloHP)
VALUES (NULL, TO_DATE('2024-04-01', 'YYYY-MM-DD'), 300004);
--4--
INSERT INTO SANCIONES (idSancion, tiempoS, tipoS, fechaInS, fechaFinS)
VALUES ('M0045', 9, 'otro', TO_DATE('2025-03-05', 'YYYY-MM-DD'), TO_DATE('2025-03-10', 'YYYY-MM-DD'));
--5--
INSERT INTO MULTAS (idMulta, montoM, fechaM, fechaPM, estadoM)
VALUES ('M0012', 30000, TO_DATE('2025-03-28', 'YYYY-MM-DD'), TO_DATE('2025-04-08', 'YYYY-MM-DD'), 'Unico');
--6--
INSERT INTO ARTICULOS (idArticulo, nombreArticulo, autor, fecha_pub, estadoFis, extension, num_ISBN, idioma, sinopsis, costoAdq, idACatem, idAEdit, idADisp) 
VALUES (101, 'Mini Guía', 'Laura Gómez', TO_DATE('2022-03-15', 'YYYY-MM-DD'), 'Desgastado', 850, 9781234567891, 'Español', 'Guía corta sobre temas generales.', 813, 3333444455, 1122334466, 2934132); 
--7--
UPDATE EDITORIALES
SET nombreEd = 'Nueva Editorial'
WHERE idEdit = 6677889912;
--8--
DELETE FROM DISPONIBILIDADES
WHERE idDisp = 123;
--9--
UPDATE INVENTARIOS
SET nombreA = 'Nuevo Título'
WHERE idInv = 4000000010;
--10--
INSERT INTO TRABAJADORES (idTrab, nombreTr, apellidoTr, edad, contactoTrab, residencia,tipoDoc, numDoc, cargo, estadoCivil, idBiblioT)
VALUES (3002, 'Pedro', 'López', 16, 'pedro@gmail.com', 'Cra 45 #10-20', 'Tarjeta de identidad', 9988776655, 'Auxiliar', 'Soltero', 200001);
--11--
INSERT INTO EVENTOS (idEvento, nombreE, fecha, numAsistentes, tematica, objetivo, idBiblioEv)
VALUES (5002, 'Taller de poesía', TO_DATE('2025-06-15', 'YYYY-MM-DD'), 15, 'Escritura', 'Desarrollar habilidades creativas', 200005);