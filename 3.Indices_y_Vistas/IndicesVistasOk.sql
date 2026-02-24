--IndicesOk--
INSERT INTO ARTICULOS (idArticulo, nombreArticulo, autor, fecha_pub, estadoFis, extension, num_ISBN, idioma, sinopsis, costoAdq, idACatem, idAEdit, idADisp) 
VALUES (900001, 'El arte de reir', 'Donald Knuth', TO_DATE('1997-05-14', 'YYYY-MM-DD'), 'Desgastado', 850, 1111111111111, 'Español', 'Un clásico sobre algoritmos y estructuras de datos.', 150000, 3333444455, 1122334466, 2934132); 
------------------
SELECT * FROM ARTICULOS;

INSERT INTO INVENTARIOS (idInv, fechAg, nombreA, cantidad_inv, condicion_inv, estanteria, acceso, idBiblioIn,idDispIn) 
VALUES (902, TO_DATE('2023-06-10', 'YYYY-MM-DD'), 'El arte de llegar', 5, 'retirado', 'A-101', 'Acceso restringido', 200001, 852959); 
------------------
SELECT * FROM INVENTARIOS;

INSERT INTO EVENTOS (idEvento, nombreE, fecha, numAsistentes, tematica, objetivo, idBiblioEv) 
VALUES (504, 'Feria del magia', TO_DATE('2021-08-16', 'YYYY-MM-DD'), 574, 'Festividad', NULL, 200001); 
------------------
SELECT * FROM EVENTOS;

INSERT INTO RESERVAS (idReserva, tiempoR, cantLibros, caractEntrega, idDispR)
VALUES (909, 48, 2, 'Recoger en mostrador con comprobante', 1290290);
------------------
SELECT * FROM RESERVAS;

INSERT INTO DEVOLUCIONES (idDevolucion, fechaDev, observaciones, idHistorialD)
VALUES (907, TO_DATE('2024-03-17', 'YYYY-MM-DD'), 'Libro cambiado por otro antes de devolver.', 107);
------------------
SELECT * FROM DEVOLUCIONES;

INSERT INTO ESTADISTICAS_USO (idEU, cantidadP, eRetrasadas, eTiempo, dPendientes, idHistorialEU, idBiblioEU)
VALUES (9003, 12, 1, 4, 0, 103, 200003);
------------------
SELECT * FROM ESTADISTICAS_USO;

INSERT INTO BLOQUEOS (idBloqueo, razonB, duracionB, fechB)
VALUES ('B0026', 'Pérdida de un libro sin reposición', '45 días', TO_DATE('2025-03-10', 'YYYY-MM-DD'));
------------------
SELECT * FROM BLOQUEOS;

--VistasOk--
--multas no pagadas--
SELECT * FROM VnoPagos;
--ultimos libros devueltos--
SELECT * FROM VlibrosDevueltos;
--informacion de las diferentes categorias--
SELECT * FROM VinfoCategoriaA;
--turnos de los trabajadores anteriores--
SELECT * FROM VturnosTrabajadores;
--articulos perdidos--
SELECT * FROM VarticulosPerdidos;
--bibliotecas mas visitadas--
SELECT * FROM VbibliotecasVisitadas;
--inventarios de una biblioteca--
SELECT * FROM VinventarioBiblio;
--eventos con mas asistencia--
SELECT * FROM VasistenciaEventos;