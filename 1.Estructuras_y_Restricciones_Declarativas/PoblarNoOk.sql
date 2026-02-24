--PoblarNoOk--  
--No deben y no pueden--  
INSERT INTO CATEGORIAS_TEMAS (idCatem, categoria, tema, genero)
VALUES (00000, 'ficción', NULL, 'fantastico');

INSERT INTO EDITORIALES (idEdit, nombreEd, contacto, sitWeb)
VALUES (NULL, 'Harshell', '+2 423 453 3267', NULL);

INSERT INTO DISPONIBILIDADES (idDisp, estado_disp) 
VALUES (NULL, 'Disponible'); 

INSERT INTO ARTICULOS (idArticulo, nombreArticulo, autor, fecha_pub, estadoFis, extension, num_ISBN, idioma, sinopsis, costoAdq, idACatem, idAEdit, idADisp) 
VALUES (300001, 'El arte de programar', 'Donald Knuth', TO_DATE('1997-05-14', 'YYYY-MM-DD'), 'Desgastado', 850, NULL, 'Español', 'Un clásico sobre algoritmos y estructuras de datos.', 150.000, 3333444455, 1122334466, 2934132); 

INSERT INTO BIBLIOTECAS (idBiblio, nombreBiblio, ubicacion, contactoB, cantEmpleado, horaApert, horaCierre, instalacion)
VALUES ('wazita', 3143257689, 'Cra 7 #25-34 bog', '+57 312 354 4676', 13, '7:00', '20:00', 'Edificio de dos pisos');

INSERT INTO INVENTARIOS (idInv, fechAg, nombreA, cantidad_inv, condicion_inv, estanteria, acceso, idBiblioIn,idDispIn) 
VALUES (4000000001, TO_DATE('2023-06-10', 'YYYY-MM-DD'), 'El arte de la guerra', 5, NULL, 'A-101', 'Acceso restringido', 'Biblioteca Carmen', 852959); 

INSERT INTO EVENTOS (idEvento, nombreE, fecha, numAsistentes, tematica, objetivo, idBiblioEv) 
VALUES (33656439, 'Circulo de Lectura', TO_DATE('2017-08-13', 'YYYY-MM-DD'), 'Nunguno', 'Celebración', NULL, 200002); 

INSERT INTO TRABAJADORES (idTrab, nombreTr, apellidoTr, edad, contactoTrab, residencia, tipoDoc, numDoc, cargo, estadoCivil, idBiblioT) 
VALUES (10000001, 'Luis', 'Gómez', 105, '+57-300-123-4567', 'Cra 10 #15-20, Bogotá', 'Cedula Ciudadanía', 1023456789, 'Bibliotecario', 'Soltero', 200001); 

INSERT INTO TURNOS_TRABAJADORES (idTurno, horaInicio, horaFin, cantHoras, tipoTurno, tarea) 
VALUES (50001, '08:00', '12:00', 4, 'Diurno', NULL);

INSERT INTO TRABAJADORESXTURNOS (idTrabP, idTurnoP) 
VALUES ('M2145', 50001); 

INSERT INTO SUSCRIPCIONES (idSus, contactoSus, residenciaSus, codMembre, costoSus)
VALUES (201, '3001234567', 'Bogotá', NULL, 15000);

INSERT INTO RESERVAS (idReserva, tiempoR, cantLibros, caractEntrega, idDispR)
VALUES (305, '120', 4, 'Entrega programada con cita previa', NULL);

INSERT INTO HISTORIALES_PRESTAMOS (idHistorial, fechaP, idArticuloHP)
VALUES ('2024-01-04', TO_DATE('2024-03-05', 'YYYY-MM-DD'), 300005);

INSERT INTO USUARIOS (idUsuario, nombreU, apellidoU, tipoDocU, numDocU, edadU, idHistorialU, idSusUss)
VALUES (7, 1234, 'Torres', 'Acta Nacimiento', NULL, 5, 107, 207);

INSERT INTO USUARIOSXRESERVAS (idUsuarioS, idReservaS)
VALUES ('Nada', 303);

INSERT INTO DEVOLUCIONES (idDevolucion, fechaDev, observaciones, idHistorialD)
VALUES (3, TO_DATE(NULL, 'YYYY-MM-DD'), 'Retraso de 2 días en la devolución.', 0);

INSERT INTO ESTADISTICAS_USO (idEU, cantidadP, eRetrasadas, eTiempo, dPendientes, idHistorialEU, idBiblioEU)
VALUES (6, 'uno', 5, 8, 4, 106, NULL);

INSERT INTO SANCIONES (idSancion, tiempoS, tipoS, fechaInS, fechaFinS)
VALUES (005, 30, NULL, TO_DATE('2025-01-10', 'YYYY-MM-DD'), TO_DATE('2025-02-09', 'YYYY-MM-DD'));

INSERT INTO HISTORIALESXSANCIONES (idSancionG, idHistorialG)
VALUES ('B0004', NULL);

INSERT INTO BLOQUEOS (idBloqueo, razonB, duracionB, fechB)
VALUES (10003, NULL, '14 días', TO_DATE('2025-03-28', 'YYYY-MM-DD'));

INSERT INTO MULTAS (idMulta, montoM, fechaM, fechaPM, estadoM)
VALUES ('M0007', NULL, TO_DATE('2025-03-30', 'YYYY-MM-DD'), TO_DATE('2025-04-09', 'YYYY-MM-DD'), 112);