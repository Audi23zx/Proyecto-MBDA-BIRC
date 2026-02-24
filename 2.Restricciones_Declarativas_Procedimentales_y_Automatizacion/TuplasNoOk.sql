--Tuplas NO OK--
INSERT INTO BIBLIOTECAS (idBiblio, nombreBiblio, ubicacion, contactoB, cantEmpleado, horaApert, horaCierre, instalacion) 
VALUES (200065, 'Biblioteca Tintal', 'Cra 89 #8-18, Bogotá', '+57-301-163-4597', 26, '21:00', '19:00', 'Edificio de dos pisos'); 

INSERT INTO TURNOS_TRABAJADORES (idTurno, horaInicio, horaFin, cantHoras, tipoTurno, tarea) 
VALUES (50033, '12:00', '04:00', '7 horas', 'Diurno', 'Atención al público y organización de estanterías.');

INSERT INTO SANCIONES (idSancion, tiempoS, tipoS, fechaInS, fechaFinS)
VALUES ('M0046', 7, 'Retraso', TO_DATE('2025-06-03', 'YYYY-MM-DD'), TO_DATE('2025-03-22', 'YYYY-MM-DD'));

INSERT INTO MULTAS (idMulta, montoM, fechaM, fechaPM, estadoM)
VALUES ('M0041', 50000, TO_DATE('2025-03-11', 'YYYY-MM-DD'), TO_DATE('2025-01-30', 'YYYY-MM-DD'), 'Pendiente');