--Tuplas OK--
INSERT INTO BIBLIOTECAS (idBiblio, nombreBiblio, ubicacion, contactoB, cantEmpleado, horaApert, horaCierre, instalacion) 
VALUES (200018, 'Biblioteca jorgito', 'Cra 67 #43-20, Bogotá', '+57-301-163-4567', 25, '19:00', '21:00', 'Edificio de dos pisos'); 

INSERT INTO TURNOS_TRABAJADORES (idTurno, horaInicio, horaFin, cantHoras, tipoTurno, tarea) 
VALUES (50043, '10:00', '17:00', '7 horas', 'Diurno', 'Atención al público y organización de estanterías.');

INSERT INTO SANCIONES (idSancion, tiempoS, tipoS, fechaInS, fechaFinS)
VALUES ('M0041', 7, 'Retraso', TO_DATE('2025-03-03', 'YYYY-MM-DD'), TO_DATE('2025-03-22', 'YYYY-MM-DD'));

INSERT INTO SANCIONES (idSancion, tiempoS, tipoS, fechaInS, fechaFinS)
VALUES ('nada', 8, 'Libro Perdido', TO_DATE('2025-05-05', 'YYYY-MM-DD'), TO_DATE('2025-05-10', 'YYYY-MM-DD'));

INSERT INTO SANCIONES (idSancion, tiempoS, tipoS, fechaInS, fechaFinS)
VALUES ('nada', 2, 'Libro Perdido', TO_DATE('2025-03-05', 'YYYY-MM-DD'), TO_DATE('2025-03-10', 'YYYY-MM-DD'));

INSERT INTO MULTAS (idMulta, montoM, fechaM, fechaPM, estadoM)
VALUES ('M9999', 50000, DATE '2025-04-11', DATE '2025-04-30', 'Pendiente');
