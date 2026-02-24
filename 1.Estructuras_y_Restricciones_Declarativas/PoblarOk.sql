--PoblarOk-- 

--1: Gran Concepto Articuloncs--
INSERT INTO CATEGORIAS_TEMAS (idCatem, categoria, tema, genero) 
VALUES (1111222233, 'ficción', 'ciencia ficción', 'novela negra'); 
INSERT INTO CATEGORIAS_TEMAS (idCatem, categoria, tema, genero) 
VALUES (2222333344, 'no ficción', 'historia', 'contemporáneo'); 
INSERT INTO CATEGORIAS_TEMAS (idCatem, categoria, tema, genero) 
VALUES (3333444455, 'ciencia', 'psicoanálisis', 'autobiográfica'); 
INSERT INTO CATEGORIAS_TEMAS (idCatem, categoria, tema, genero) 
VALUES (4444555566, 'arte', 'dramaturgia', 'poesía'); 
INSERT INTO CATEGORIAS_TEMAS (idCatem, categoria, tema, genero) 
VALUES (5555666677, 'religión', 'ética y moral', 'drama histórico'); 
INSERT INTO CATEGORIAS_TEMAS (idCatem, categoria, tema, genero) 
VALUES (6666777788, 'filosofía', 'psicoanálisis', 'ensayo filosófico'); 
INSERT INTO CATEGORIAS_TEMAS (idCatem, categoria, tema, genero) 
VALUES (7777888899, 'música', 'música clásica', 'fantasía épica'); 
INSERT INTO CATEGORIAS_TEMAS (idCatem, categoria, tema, genero) 
VALUES (8888999900, 'educación', 'derechos humanos', 'autobiografía'); 
INSERT INTO CATEGORIAS_TEMAS (idCatem, categoria, tema, genero) 
VALUES (9999000011, 'medicina', 'nutrición', 'anatomía humana'); 
INSERT INTO CATEGORIAS_TEMAS (idCatem, categoria, tema, genero) 
VALUES (0000111122, 'lingüística', 'ortografía', 'periodismo');  

--2: Gran Concepto Articulos--
INSERT INTO EDITORIALES (idEdit, nombreEd, contacto, sitWeb) 
VALUES (1122334466, 'Penguin House', '+1 212 782 9000', XMLTYPE('<sitio_web>https://www.penguinrandomhouse.com</sitio_web>')); 
INSERT INTO EDITORIALES (idEdit, nombreEd, contacto, sitWeb) 
VALUES (2233445577, 'HarperCollins', '+1 212 207 7000', XMLTYPE('<sitio_web>https://www.harpercollins.com</sitio_web>')); 
INSERT INTO EDITORIALES (idEdit, nombreEd, contacto, sitWeb) 
VALUES (3344556688, 'Planeta', '+34 933 660 660', XMLTYPE('<sitio_web>https://www.planetadelibros.com</sitio_web>')); 
INSERT INTO EDITORIALES (idEdit, nombreEd, contacto, sitWeb) 
VALUES (4455667799, 'Simon', '+1 212 698 7000', XMLTYPE('<sitio_web>https://www.google.com</sitio_web>')); 
INSERT INTO EDITORIALES (idEdit, nombreEd, contacto, sitWeb) 
VALUES (5566778800, 'Scholastic', '+1 800 724 6527', XMLTYPE('<sitio_web>https://www.scholastic.com</sitio_web>')); 
INSERT INTO EDITORIALES (idEdit, nombreEd, contacto, sitWeb) 
VALUES (6677889912, 'Hachette Livre', '+90 143 92 300', NULL); 
INSERT INTO EDITORIALES (idEdit, nombreEd, contacto, sitWeb) 
VALUES (7788990023, 'Macmillan', '+1 646 307 5151', XMLTYPE('<sitio_web>https://us.macmillan.com</sitio_web>')); 
INSERT INTO EDITORIALES (idEdit, nombreEd, contacto, sitWeb) 
VALUES (8899001134, 'Oxford Press', '+44 1865 556767', NULL); 
INSERT INTO EDITORIALES (idEdit, nombreEd, contacto, sitWeb) 
VALUES (9900112245, 'Cambridge Press', '+44 1223 358331', XMLTYPE('<sitio_web>https://www.cambridge.org</sitio_web>')); 
INSERT INTO EDITORIALES (idEdit, nombreEd, contacto, sitWeb) 
VALUES (0011223355, 'Pearson', '+44 20 7010 200', XMLTYPE('<sitio_web>https://www.pearson.com</sitio_web>'));  

--3: Gran Concepto Inventarios--
INSERT INTO DISPONIBILIDADES (idDisp, estado_disp) 
VALUES (852959, 'Disponible'); 
INSERT INTO DISPONIBILIDADES (idDisp, estado_disp) 
VALUES (1290290, 'Prestado'); 
INSERT INTO DISPONIBILIDADES (idDisp, estado_disp) 
VALUES (2934132, 'Reservado'); 
INSERT INTO DISPONIBILIDADES (idDisp, estado_disp) 
VALUES (5200279, 'Retirado/daño'); 
INSERT INTO DISPONIBILIDADES (idDisp, estado_disp) 
VALUES (498056, 'Perdido'); 

--4: Gran Concepto Articulos-- 
INSERT INTO ARTICULOS (idArticulo, nombreArticulo, autor, fecha_pub, estadoFis, extension, num_ISBN, idioma, sinopsis, costoAdq, idACatem, idAEdit, idADisp) 
VALUES (300001, 'El arte de programar', 'Donald Knuth', TO_DATE('1997-05-14', 'YYYY-MM-DD'), 'Desgastado', 850, 9780201896831, 'Español', 'Un clásico sobre algoritmos y estructuras de datos.', 150.000, 3333444455, 1122334466, 2934132); 
INSERT INTO ARTICULOS (idArticulo, nombreArticulo, autor, fecha_pub, estadoFis, extension, num_ISBN, idioma, sinopsis, costoAdq, idACatem, idAEdit, idADisp) 
VALUES (300002, 'Cien años de soledad', 'Gabriel G. Márquez', TO_DATE('1967-06-05', 'YYYY-MM-DD'), 'Restaurado', 417, 9780307474728, 'Español', NULL, 45.900, 1111222233, 2233445577, 852959); 
INSERT INTO ARTICULOS (idArticulo, nombreArticulo, autor, fecha_pub, estadoFis, extension, num_ISBN, idioma, sinopsis, costoAdq, idACatem, idAEdit, idADisp) 
VALUES (300003, '1984', 'George Orwell', TO_DATE('1949-06-08', 'YYYY-MM-DD'), 'Buen Estado', 328, 9780451524935, 'Inglés', 'Distopía sobre un régimen totalitario y la vigilancia extrema.', 80.000, 6666777788, 3344556688, 1290290); 
INSERT INTO ARTICULOS (idArticulo, nombreArticulo, autor, fecha_pub, estadoFis, extension, num_ISBN, idioma, sinopsis, costoAdq, idACatem, idAEdit, idADisp) 
VALUES (300004, 'Sapiens', 'Yuval Noah Harari', TO_DATE('2011-01-01', 'YYYY-MM-DD'), 'Dañado', 443, 9780062316097, 'Español', NULL, 75.000, 8888999900, 4455667799, 5200279); 
INSERT INTO ARTICULOS (idArticulo, nombreArticulo, autor, fecha_pub, estadoFis, extension, num_ISBN, idioma, sinopsis, costoAdq, idACatem, idAEdit, idADisp) 
VALUES (300005, 'La Odisea', 'Homero', TO_DATE('0800-01-01', 'YYYY-MM-DD'), 'Condicion Regular', 541, 9780140268867, 'Griego', 'Epopeya de Ulises en su regreso a Ítaca.', 60.000, 4444555566, 5566778800, 498056); 
INSERT INTO ARTICULOS (idArticulo, nombreArticulo, autor, fecha_pub, estadoFis, extension, num_ISBN, idioma, sinopsis, costoAdq, idACatem, idAEdit, idADisp) 
VALUES (300006, 'Crimen y castigo', 'Fiódor Dostoyevski', TO_DATE('1866-11-01', 'YYYY-MM-DD'), 'Restaurado', 671, 9780140449136, 'Ruso', 'Novela psicológica sobre la culpa y la redención.', 110.750, 5555666677, 6677889912, 2934132); 
INSERT INTO ARTICULOS (idArticulo, nombreArticulo, autor, fecha_pub, estadoFis, extension, num_ISBN, idioma, sinopsis, costoAdq, idACatem, idAEdit, idADisp) 
VALUES (300007, 'El código Da Vinci', 'Dan Brown', TO_DATE('2003-03-18', 'YYYY-MM-DD'), 'Buen Estado', 489, 9780307474278, 'Español', 'Thriller que mezcla historia, religión y misterio.', 90.000, 0000111122, 7788990023, 852959); 
INSERT INTO ARTICULOS (idArticulo, nombreArticulo, autor, fecha_pub, estadoFis, extension, num_ISBN, idioma, sinopsis, costoAdq, idACatem, idAEdit, idADisp) 
VALUES (300008, 'Don Quijote de la Mancha', 'Miguel de Cervantes', TO_DATE('1605-01-16', 'YYYY-MM-DD'), 'Dañado', 863, 9788424114287, 'Español', NULL, 85.250, 1111222233, 8899001134, 5200279); 
INSERT INTO ARTICULOS (idArticulo, nombreArticulo, autor, fecha_pub, estadoFis, extension, num_ISBN, idioma, sinopsis, costoAdq, idACatem, idAEdit, idADisp) 
VALUES (300009, 'respuestas a grandes preguntas', 'Stephen Hawking', TO_DATE('2018-10-16', 'YYYY-MM-DD'), 'Condicion Regular', 256, 9781984819192, 'Español', 'Respuestas científicas a cuestiones fundamentales.', 65.000, 2222333344, 9900112245, 498056); 
INSERT INTO ARTICULOS (idArticulo, nombreArticulo, autor, fecha_pub, estadoFis, extension, num_ISBN, idioma, sinopsis, costoAdq, idACatem, idAEdit, idADisp) 
VALUES (300010, 'la piedra filosofal', 'J.K. Rowling', TO_DATE('1997-06-26', 'YYYY-MM-DD'), 'Buen Estado', 309, 9780747532699, 'Español', 'Inicio de la saga del joven mago en Hogwarts.', 50.000, 1111222233, 0011223355, 2934132);  

--5: Gran Concepto Biblioteca--
INSERT INTO BIBLIOTECAS (idBiblio, nombreBiblio, ubicacion, contactoB, cantEmpleado, horaApert, horaCierre, instalacion) 
VALUES (200001, 'Biblioteca Central', 'Cra 10 #15-20, Bogotá', '+57-301-123-4567', 25, '07:00', '19:00', 'Edificio de dos pisos'); 
INSERT INTO BIBLIOTECAS (idBiblio, nombreBiblio, ubicacion, contactoB, cantEmpleado, horaApert, horaCierre, instalacion) 
VALUES (200002, 'Biblio del Saber', 'Cl 23 #12-34, Medellín', '+57-315-678-9012', 18, '08:00', '18:00', 'Anexo con tres niveles'); 
INSERT INTO BIBLIOTECAS (idBiblio, nombreBiblio, ubicacion, contactoB, cantEmpleado, horaApert, horaCierre, instalacion) 
VALUES (200003, 'Lectura y Arte', 'Av 6 #45-67, Quito', '+593-320-987-6543', 12, '09:00', '17:00', 'Pabellón de cuatro alas'); 
INSERT INTO BIBLIOTECAS (idBiblio, nombreBiblio, ubicacion, contactoB, cantEmpleado, horaApert, horaCierre, instalacion) 
VALUES (200004, 'Biblioteca Sur', 'Jr 4 #8-10, Lima', '+51-310-765-4321', 20, '08:30', '18:30', 'Dos edificios conectados'); 
INSERT INTO BIBLIOTECAS (idBiblio, nombreBiblio, ubicacion, contactoB, cantEmpleado, horaApert, horaCierre, instalacion) 
VALUES (200005, 'Libros y Más', 'Pasaje 9 #2-30, Stgo', '+56-322-345-6789', 15, '09:00', '19:00', 'Bloque con patio'); 
INSERT INTO BIBLIOTECAS (idBiblio, nombreBiblio, ubicacion, contactoB, cantEmpleado, horaApert, horaCierre, instalacion) 
VALUES (200006, 'Biblio del Río', 'Av 9 #100-50, BsAs', '+54-311-234-5678', 10, '07:30', '16:30', 'dos plantas bajas separadas'); 
INSERT INTO BIBLIOTECAS (idBiblio, nombreBiblio, ubicacion, contactoB, cantEmpleado, horaApert, horaCierre, instalacion) 
VALUES (200007, 'Centro Literario', 'Cl 14 #22-12, Ccs', '+58-312-345-6789', 22, '08:00', '20:00', 'tres alas y un auditorio'); 
INSERT INTO BIBLIOTECAS (idBiblio, nombreBiblio, ubicacion, contactoB, cantEmpleado, horaApert, horaCierre, instalacion) 
VALUES (200008, 'Biblio Montevideo', 'Plaza 5 #3-15, Mdeo', '+598-300-987-6543', 17, '09:00', '17:30', 'Edificio con sótano amplio'); 
INSERT INTO BIBLIOTECAS (idBiblio, nombreBiblio, ubicacion, contactoB, cantEmpleado, horaApert, horaCierre, instalacion) 
VALUES (200009, 'Letras y Cultura', 'Calle 8 #7-55, Asun', '+595-314-567-8901', 14, '07:00', '15:00', 'Dos pisos'); 
INSERT INTO BIBLIOTECAS (idBiblio, nombreBiblio, ubicacion, contactoB, cantEmpleado, horaApert, horaCierre, instalacion) 
VALUES (200010, 'Biblioteca Tica', 'Blvd 2 #11-23, SJ', '+506-316-789-0123', 19, '08:00', '18:00', 'Sala de tres niveles altos'); 

--6: Gran Concepto Inventarios--
INSERT INTO INVENTARIOS (idInv, fechAg, nombreA, cantidad_inv, condicion_inv, estanteria, acceso, idBiblioIn,idDispIn) 
VALUES (4000000001, TO_DATE('2023-06-10', 'YYYY-MM-DD'), 'El arte de la guerra', 5, 'retirado', 'A-101', 'Acceso restringido', 200001, 852959); 
INSERT INTO INVENTARIOS (idInv, fechAg, nombreA, cantidad_inv, condicion_inv, estanteria, acceso, idBiblioIn,idDispIn) 
VALUES (4000000002, TO_DATE('2022-11-22', 'YYYY-MM-DD'), 'Cien años de soledad', 3, 'en restauracion', 'B-205', 'Acceso total', 200001, 852959); 
INSERT INTO INVENTARIOS (idInv, fechAg, nombreA, cantidad_inv, condicion_inv, estanteria, acceso, idBiblioIn,idDispIn) 
VALUES (4000000003, TO_DATE('2021-07-15', 'YYYY-MM-DD'), '1984 de George Orwell', 7, 'publico', 'C-310', 'Acceso total', 200002, 1290290); 
INSERT INTO INVENTARIOS (idInv, fechAg, nombreA, cantidad_inv, condicion_inv, estanteria, acceso, idBiblioIn,idDispIn) 
VALUES (4000000004, TO_DATE('2023-01-30', 'YYYY-MM-DD'), 'Sapiens: De animales a dioses', 4, 'retirado', 'D-420', 'Acceso restringido', 200003, 1290290); 
INSERT INTO INVENTARIOS (idInv, fechAg, nombreA, cantidad_inv, condicion_inv, estanteria, acceso, idBiblioIn,idDispIn) 
VALUES (4000000005, TO_DATE('2020-12-05', 'YYYY-MM-DD'), 'La Odisea de Homero', 6, 'retirado', 'E-512', 'Acceso restringido', 200004, 2934132); 
INSERT INTO INVENTARIOS (idInv, fechAg, nombreA, cantidad_inv, condicion_inv, estanteria, acceso, idBiblioIn,idDispIn) 
VALUES (4000000006, TO_DATE('2021-09-18', 'YYYY-MM-DD'), 'Don Quijote de la Mancha', 2, 'retirado', 'F-230', 'Acceso restringido', 200006, 2934132); 
INSERT INTO INVENTARIOS (idInv, fechAg, nombreA, cantidad_inv, condicion_inv, estanteria, acceso, idBiblioIn,idDispIn) 
VALUES (4000000007, TO_DATE('2022-03-14', 'YYYY-MM-DD'), 'Crónica de una muerte', 5, 'publico', 'G-101', 'Acceso total', 200007, 5200279); 
INSERT INTO INVENTARIOS (idInv, fechAg, nombreA, cantidad_inv, condicion_inv, estanteria, acceso, idBiblioIn,idDispIn) 
VALUES (4000000008, TO_DATE('2020-07-29', 'YYYY-MM-DD'), 'El principito', 8, 'publico', 'H-311', 'Acceso restringido', 200008, 5200279); 
INSERT INTO INVENTARIOS (idInv, fechAg, nombreA, cantidad_inv, condicion_inv, estanteria, acceso, idBiblioIn,idDispIn) 
VALUES (4000000009, TO_DATE('2023-04-21', 'YYYY-MM-DD'), 'Rayuela', 3, 'publico', 'I-221', 'Acceso total', 200009, 498056); 
INSERT INTO INVENTARIOS (idInv, fechAg, nombreA, cantidad_inv, condicion_inv, estanteria, acceso, idBiblioIn,idDispIn) 
VALUES (4000000010, TO_DATE('2019-12-31', 'YYYY-MM-DD'), 'Los miserables', 4, 'en restauracion', 'J-432', 'Acceso total', 200010, 498056); 

--7: Gran Concepto Biblioteca--
INSERT INTO EVENTOS (idEvento, nombreE, fecha, numAsistentes, tematica, objetivo, idBiblioEv) 
VALUES (11998885, 'Feria del libro', TO_DATE('2021-02-16', 'YYYY-MM-DD'), 574, 'Festividad', 'Promover el interés por la lectura y la venta de libros', 200001); 
INSERT INTO EVENTOS (idEvento, nombreE, fecha, numAsistentes, tematica, objetivo, idBiblioEv) 
VALUES (33656439, 'Circulo de Lectura', TO_DATE('2017-08-13', 'YYYY-MM-DD'), 137, 'Celebración', 'Analizar, debatir e integrar ideas de libros en grupo', 200002); 
INSERT INTO EVENTOS (idEvento, nombreE, fecha, numAsistentes, tematica, objetivo, idBiblioEv) 
VALUES (15949447, 'Hora de cuento', TO_DATE('2010-02-01', 'YYYY-MM-DD'), 362, 'Celebración', NULL, 200003); 
INSERT INTO EVENTOS (idEvento, nombreE, fecha, numAsistentes, tematica, objetivo, idBiblioEv) 
VALUES (64413650, 'Maratón lector', TO_DATE('2024-09-14', 'YYYY-MM-DD'), 748, 'Aniversario', 'Momento de lectura continua, divertida y sanamente competitiva', 200004); 
INSERT INTO EVENTOS (idEvento, nombreE, fecha, numAsistentes, tematica, objetivo, idBiblioEv) 
VALUES (79021318, 'Taller literario', TO_DATE('2013-12-25', 'YYYY-MM-DD'), 155, 'Conmemoración', 'Mejora la escritura creativa', 200005); 
INSERT INTO EVENTOS (idEvento, nombreE, fecha, numAsistentes, tematica, objetivo, idBiblioEv) 
VALUES (16942100, 'Club de poesía', TO_DATE('2019-05-14', 'YYYY-MM-DD'), 415, 'Tributo', NULL, 200006); 
INSERT INTO EVENTOS (idEvento, nombreE, fecha, numAsistentes, tematica, objetivo, idBiblioEv) 
VALUES (23549194, 'Lectura en vivo', TO_DATE('2022-04-30', 'YYYY-MM-DD'), 333, 'Festividad', NULL, 200007); 
INSERT INTO EVENTOS (idEvento, nombreE, fecha, numAsistentes, tematica, objetivo, idBiblioEv) 
VALUES (67660314, 'Foro de escritos', TO_DATE('2006-03-20', 'YYYY-MM-DD'), 298, 'Tributo', 'Conectar a los lectores con sus talentos ocultos', 200008); 
INSERT INTO EVENTOS (idEvento, nombreE, fecha, numAsistentes, tematica, objetivo, idBiblioEv) 
VALUES (73999010, 'Historia en libros', TO_DATE('2005-04-26', 'YYYY-MM-DD'), 495, 'Conmemoración', 'Conmemoración a la historia del mundo', 200009); 
INSERT INTO EVENTOS (idEvento, nombreE, fecha, numAsistentes, tematica, objetivo, idBiblioEv) 
VALUES (95671716, 'Torsión plural', TO_DATE('2023-01-27', 'YYYY-MM-DD'), 784, 'Tributo', 'Interprete único y encantador de las historias', 200010);

--8: Gran Concepto Biblioteca--
INSERT INTO TRABAJADORES (idTrab, nombreTr, apellidoTr, edad, contactoTrab, residencia, tipoDoc, numDoc, cargo, estadoCivil, idBiblioT) 
VALUES (10000001, 'Luis', 'Gómez', 35, '+57-300-123-4567', 'Cra 10 #15-20, Bogotá', 'Cedula Ciudadanía', 1023456789, 'Bibliotecario', 'Soltero', 200001); 
INSERT INTO TRABAJADORES (idTrab, nombreTr, apellidoTr, edad, contactoTrab, residencia, tipoDoc, numDoc, cargo, estadoCivil, idBiblioT) 
VALUES (10000002, 'María', 'Pérez', 42, '+57-315-678-9012', 'Cl 23 #12-34, Medellín', 'Cedula Ciudadanía', 1123456789, 'Archivista', 'Casada', 200002); 
INSERT INTO TRABAJADORES (idTrab, nombreTr, apellidoTr, edad, contactoTrab, residencia, tipoDoc, numDoc, cargo, estadoCivil, idBiblioT) 
VALUES (10000003, 'Carlos', 'Rodríguez', 29, '+593-320-987-6543', 'Av 6 #45-67, Quito', 'Cedula Extranjería', 1223456789, 'Auxiliar', 'Soltero', 200003); 
INSERT INTO TRABAJADORES (idTrab, nombreTr, apellidoTr, edad, contactoTrab, residencia, tipoDoc, numDoc, cargo, estadoCivil, idBiblioT) 
VALUES (10000004, 'Ana', 'Martínez', 38, '+51-310-765-4321', 'Jr 4 #8-10, Lima', 'Registro Civil', 1323456789, 'Recepcionista', 'Casada', 200004); 
INSERT INTO TRABAJADORES (idTrab, nombreTr, apellidoTr, edad, contactoTrab, residencia, tipoDoc, numDoc, cargo, estadoCivil, idBiblioT) 
VALUES (10000005, 'Jorge', 'Fernández', 50, '+56-322-345-6789', 'Pasaje 9 #2-30, Stgo', 'Cedula Extranjería', 1423456789, 'Director', 'Divorciado', 200005); 
INSERT INTO TRABAJADORES (idTrab, nombreTr, apellidoTr, edad, contactoTrab, residencia, tipoDoc, numDoc, cargo, estadoCivil, idBiblioT) 
VALUES (10000006, 'Elena', 'Ramírez', 27, '+54-311-234-5678', 'Av 9 #100-50, BsAs', 'Registro Civil', 1523456789, 'Digitador', 'Soltera', 200006); 
INSERT INTO TRABAJADORES (idTrab, nombreTr, apellidoTr, edad, contactoTrab, residencia, tipoDoc, numDoc, cargo, estadoCivil, idBiblioT) 
VALUES (10000007, 'Ricardo', 'Torres', 33, '+58-312-345-6789', 'Cl 14 #22-12, Ccs', 'Cedula Ciudadanía', 1623456789, 'Restaurador', 'Casado', 200007); 
INSERT INTO TRABAJADORES (idTrab, nombreTr, apellidoTr, edad, contactoTrab, residencia, tipoDoc, numDoc, cargo, estadoCivil, idBiblioT) 
VALUES (10000008, 'Paola', 'López', 45, '+598-300-987-6543', 'Plaza 5 #3-15, Mdeo', 'Cedula Extranjería', 1723456789, 'Coordinador', 'Casada', 200008); 
INSERT INTO TRABAJADORES (idTrab, nombreTr, apellidoTr, edad, contactoTrab, residencia, tipoDoc, numDoc, cargo, estadoCivil, idBiblioT) 
VALUES (10000009, 'Fernando', 'Mendoza', 31, '+595-314-567-8901', 'Calle 8 #7-55, Asun', 'Tarjeta Identidad', 1823456789, 'Investigador', 'Soltero', 200009); 
INSERT INTO TRABAJADORES (idTrab, nombreTr, apellidoTr, edad, contactoTrab, residencia, tipoDoc, numDoc, cargo, estadoCivil, idBiblioT) 
VALUES (10000010, 'Sofía', 'Herrera', 40, '+506-316-789-0123', 'Blvd 2 #11-23, SJ', 'Acta Nacimiento', 1923456789, 'Referencista', 'Casada', 200010);

--9: Gran Concepto Biblioteca--
INSERT INTO TURNOS_TRABAJADORES (idTurno, horaInicio, horaFin, cantHoras, tipoTurno, tarea) 
VALUES (50001, '08:00', '12:00', '4 horas', 'Diurno', 'Atención al público y organización de estanterías.'); 
INSERT INTO TURNOS_TRABAJADORES (idTurno, horaInicio, horaFin, cantHoras, tipoTurno, tarea) 
VALUES (50002, '12:00', '16:00', '4 horas', 'Diurno', 'Supervisión de préstamo y devolución de libros.'); 
INSERT INTO TURNOS_TRABAJADORES (idTurno, horaInicio, horaFin, cantHoras, tipoTurno, tarea) 
VALUES (50003, '16:00', '20:00', '4 horas', 'Diurno', 'Catalogación y registro de nuevos libros.'); 
INSERT INTO TURNOS_TRABAJADORES (idTurno, horaInicio, horaFin, cantHoras, tipoTurno, tarea) 
VALUES (50004, '20:00', '23:00', '4 horas', 'Nocturno', 'Resguardo de la biblioteca y control de acceso.'); 
INSERT INTO TURNOS_TRABAJADORES (idTurno, horaInicio, horaFin, cantHoras, tipoTurno, tarea) 
VALUES (50005, '00:00', '04:00', '4 horas', 'Nocturno', 'Mantenimiento y limpieza de instalaciones.'); 
INSERT INTO TURNOS_TRABAJADORES (idTurno, horaInicio, horaFin, cantHoras, tipoTurno, tarea) 
VALUES (50006, '04:00', '08:00', '4 horas', 'Rotativo', 'Revisión de sistema y reporte de incidencias.'); 
INSERT INTO TURNOS_TRABAJADORES (idTurno, horaInicio, horaFin, cantHoras, tipoTurno, tarea) 
VALUES (50007, '09:00', '13:00', '4 horas', 'Fijo', 'Asesoría a investigadores y estudiantes.'); 
INSERT INTO TURNOS_TRABAJADORES (idTurno, horaInicio, horaFin, cantHoras, tipoTurno, tarea) 
VALUES (50008, '13:00', '17:00', '4 horas', 'Fijo', 'Restauración y conservación de documentos.'); 
INSERT INTO TURNOS_TRABAJADORES (idTurno, horaInicio, horaFin, cantHoras, tipoTurno, tarea) 
VALUES (50009, '17:00', '21:00', '4 horas', 'Rotativo', 'Control de inventario y actualización de información.'); 
INSERT INTO TURNOS_TRABAJADORES (idTurno, horaInicio, horaFin, cantHoras, tipoTurno, tarea) 
VALUES (50010, '19:00', '23:00', '4 horas', 'Nocturno', 'Supervisión de seguridad y actividades nocturnas.'); 

--10: Gran Concepto Biblioteca--
INSERT INTO TRABAJADORESXTURNOS (idTrabP, idTurnoP) 
VALUES (10000001, 50001); 
INSERT INTO TRABAJADORESXTURNOS (idTrabP, idTurnoP) 
VALUES (10000002, 50002); 
INSERT INTO TRABAJADORESXTURNOS (idTrabP, idTurnoP) 
VALUES (10000003, 50003); 
INSERT INTO TRABAJADORESXTURNOS (idTrabP, idTurnoP) 
VALUES (10000004, 50004); 
INSERT INTO TRABAJADORESXTURNOS (idTrabP, idTurnoP) 
VALUES (10000005, 50005); 
INSERT INTO TRABAJADORESXTURNOS (idTrabP, idTurnoP) 
VALUES (10000006, 50006); 
INSERT INTO TRABAJADORESXTURNOS (idTrabP, idTurnoP) 
VALUES (10000007, 50007); 
INSERT INTO TRABAJADORESXTURNOS (idTrabP, idTurnoP) 
VALUES (10000008, 50008); 
INSERT INTO TRABAJADORESXTURNOS (idTrabP, idTurnoP) 
VALUES (10000009, 50009); 
INSERT INTO TRABAJADORESXTURNOS (idTrabP, idTurnoP) 
VALUES (10000010, 50010);  

--11: Gran Concepto Usuario--
INSERT INTO SUSCRIPCIONES (idSus, contactoSus, residenciaSus, codMembre, costoSus)
VALUES (201, '3001234567', 'Bogotá', 5001, 15000);
INSERT INTO SUSCRIPCIONES (idSus, contactoSus, residenciaSus, codMembre, costoSus)
VALUES (202, '3112345678', 'Medellín', 5002, 18000);
INSERT INTO SUSCRIPCIONES (idSus, contactoSus, residenciaSus, codMembre, costoSus)
VALUES (203, '3223456789', 'Cali', 5003, 20000);
INSERT INTO SUSCRIPCIONES (idSus, contactoSus, residenciaSus, codMembre, costoSus)
VALUES (204, '3334567890', 'Barranquilla', 5004, 12000);
INSERT INTO SUSCRIPCIONES (idSus, contactoSus, residenciaSus, codMembre, costoSus)
VALUES (205, '3445678901', 'Cartagena', 5005, 25000);
INSERT INTO SUSCRIPCIONES (idSus, contactoSus, residenciaSus, codMembre, costoSus)
VALUES (206, '3556789012', 'Bucaramanga', 5006, 17000);
INSERT INTO SUSCRIPCIONES (idSus, contactoSus, residenciaSus, codMembre, costoSus)
VALUES (207, '3667890123', 'Pereira', 5007, 13000);
INSERT INTO SUSCRIPCIONES (idSus, contactoSus, residenciaSus, codMembre, costoSus)
VALUES (208, '3778901234', 'Manizales', 5008, 14000);
INSERT INTO SUSCRIPCIONES (idSus, contactoSus, residenciaSus, codMembre, costoSus)
VALUES (209, '3889012345', 'Cúcuta', 5009, 19000);
INSERT INTO SUSCRIPCIONES (idSus, contactoSus, residenciaSus, codMembre, costoSus)
VALUES (210, '3990123456', 'Santa Marta', 5010, 16000);

--12: Gran Concepto Usuario--
INSERT INTO RESERVAS (idReserva, tiempoR, cantLibros, caractEntrega, idDispR)
VALUES (301, 72, 3, 'Entrega a domicilio en caja sellada', 852959);
INSERT INTO RESERVAS (idReserva, tiempoR, cantLibros, caractEntrega, idDispR)
VALUES (302, 48, 2, 'Recoger en mostrador con comprobante', 1290290);
INSERT INTO RESERVAS (idReserva, tiempoR, cantLibros, caractEntrega, idDispR)
VALUES (303, 24, 1, 'Entrega a domicilio en bolsa ecológica', 2934132);
INSERT INTO RESERVAS (idReserva, tiempoR, cantLibros, caractEntrega, idDispR)
VALUES (304, 96, 5, 'Recoger en área de préstamos con ID', 5200279);
INSERT INTO RESERVAS (idReserva, tiempoR, cantLibros, caractEntrega, idDispR)
VALUES (305, 120, 4, 'Entrega programada con cita previa', 498056);
INSERT INTO RESERVAS (idReserva, tiempoR, cantLibros, caractEntrega, idDispR)
VALUES (306, 36, 2, 'Recoger en casillero con código QR', 852959);
INSERT INTO RESERVAS (idReserva, tiempoR, cantLibros, caractEntrega, idDispR)
VALUES (307, 48, 3, 'Entrega a domicilio con firma de recepción', 1290290);
INSERT INTO RESERVAS (idReserva, tiempoR, cantLibros, caractEntrega, idDispR)
VALUES (308, 72, 1, 'Recoger en sucursal con verificación biométrica', 2934132);
INSERT INTO RESERVAS (idReserva, tiempoR, cantLibros, caractEntrega, idDispR)
VALUES (309, 60, 2, 'Entrega exprés en 24 horas', 5200279);
INSERT INTO RESERVAS (idReserva, tiempoR, cantLibros, caractEntrega, idDispR)
VALUES (310, 84, 4, 'Recoger en área especial con reserva previa', 498056);

--13: Gran Concepto Casos de Uso--
INSERT INTO HISTORIALES_PRESTAMOS (idHistorial, fechaP, idArticuloHP)
VALUES (101, TO_DATE('2024-03-01', 'YYYY-MM-DD'), 300001);
INSERT INTO HISTORIALES_PRESTAMOS (idHistorial, fechaP, idArticuloHP)
VALUES (102, TO_DATE('2024-03-02', 'YYYY-MM-DD'), 300002);
INSERT INTO HISTORIALES_PRESTAMOS (idHistorial, fechaP, idArticuloHP)
VALUES (103, TO_DATE('2024-03-03', 'YYYY-MM-DD'), 300003);
INSERT INTO HISTORIALES_PRESTAMOS (idHistorial, fechaP, idArticuloHP)
VALUES (104, TO_DATE('2024-03-04', 'YYYY-MM-DD'), 300004);
INSERT INTO HISTORIALES_PRESTAMOS (idHistorial, fechaP, idArticuloHP)
VALUES (105, TO_DATE('2024-03-05', 'YYYY-MM-DD'), 300005);
INSERT INTO HISTORIALES_PRESTAMOS (idHistorial, fechaP, idArticuloHP)
VALUES (106, TO_DATE('2024-03-06', 'YYYY-MM-DD'), 300006);
INSERT INTO HISTORIALES_PRESTAMOS (idHistorial, fechaP, idArticuloHP)
VALUES (107, TO_DATE('2024-03-07', 'YYYY-MM-DD'), 300007);
INSERT INTO HISTORIALES_PRESTAMOS (idHistorial, fechaP, idArticuloHP)
VALUES (108, TO_DATE('2024-03-08', 'YYYY-MM-DD'), 300008);
INSERT INTO HISTORIALES_PRESTAMOS (idHistorial, fechaP, idArticuloHP)
VALUES (109, TO_DATE('2024-03-09', 'YYYY-MM-DD'), 300009);
INSERT INTO HISTORIALES_PRESTAMOS (idHistorial, fechaP, idArticuloHP)
VALUES (110, TO_DATE('2024-03-10', 'YYYY-MM-DD'), 300010);

--14: Gran Concepto Usuario--
INSERT INTO USUARIOS (idUsuario, nombreU, apellidoU, tipoDocU, numDocU, edadU, idHistorialU, idSusUss)
VALUES (1, 'Juan', 'Pérez', 'Cedula Ciudadanía', 1234567890, 30, 101, 201);
INSERT INTO USUARIOS (idUsuario, nombreU, apellidoU, tipoDocU, numDocU, edadU, idHistorialU, idSusUss)
VALUES (2, 'María', 'Gómez', 'Cedula Ciudadanía', 2345678901, 25, 102, 202);
INSERT INTO USUARIOS (idUsuario, nombreU, apellidoU, tipoDocU, numDocU, edadU, idHistorialU, idSusUss)
VALUES (3, 'Carlos', 'López', 'Cedula Extranjería', 3456789012, 40, 103, 203);
INSERT INTO USUARIOS (idUsuario, nombreU, apellidoU, tipoDocU, numDocU, edadU, idHistorialU, idSusUss)
VALUES (4, 'Ana', 'Martínez', 'Tarjeta Identidad', 4567890123, 17, 104, 204);
INSERT INTO USUARIOS (idUsuario, nombreU, apellidoU, tipoDocU, numDocU, edadU, idHistorialU, idSusUss)
VALUES (5, 'Luis', 'Fernández', 'Cedula Ciudadanía', 5678901234, 35, 105, 205);
INSERT INTO USUARIOS (idUsuario, nombreU, apellidoU, tipoDocU, numDocU, edadU, idHistorialU, idSusUss)
VALUES (6, 'Sofía', 'Ramírez', 'Registro Civil', 6789012345, 10, 106, 206);
INSERT INTO USUARIOS (idUsuario, nombreU, apellidoU, tipoDocU, numDocU, edadU, idHistorialU, idSusUss)
VALUES (7, 'Andrés', 'Torres', 'Acta Nacimiento', 7890123456, 5, 107, 207);
INSERT INTO USUARIOS (idUsuario, nombreU, apellidoU, tipoDocU, numDocU, edadU, idHistorialU, idSusUss)
VALUES (8, 'Paula', 'Ríos', 'Tarjeta Identidad', 8901234567, 16, 108, 208);
INSERT INTO USUARIOS (idUsuario, nombreU, apellidoU, tipoDocU, numDocU, edadU, idHistorialU, idSusUss)
VALUES (9, 'Javier', 'Mendoza', 'Cedula Ciudadanía', 9012345678, 28, 109, 209);
INSERT INTO USUARIOS (idUsuario, nombreU, apellidoU, tipoDocU, numDocU, edadU, idHistorialU, idSusUss)
VALUES (10, 'Elena', 'Castro', 'Cedula Extranjería', 9876543210, 33, 110, 210);

--15: Gran Concepto Usuario--
INSERT INTO USUARIOSXRESERVAS (idUsuarioS, idReservaS)
VALUES (1, 301);
INSERT INTO USUARIOSXRESERVAS (idUsuarioS, idReservaS)
VALUES (2, 302);
INSERT INTO USUARIOSXRESERVAS (idUsuarioS, idReservaS)
VALUES (3, 303);
INSERT INTO USUARIOSXRESERVAS (idUsuarioS, idReservaS)
VALUES (4, 304);
INSERT INTO USUARIOSXRESERVAS (idUsuarioS, idReservaS)
VALUES (5, 305);
INSERT INTO USUARIOSXRESERVAS (idUsuarioS, idReservaS)
VALUES (6, 306);
INSERT INTO USUARIOSXRESERVAS (idUsuarioS, idReservaS)
VALUES (7, 307);
INSERT INTO USUARIOSXRESERVAS (idUsuarioS, idReservaS)
VALUES (8, 308);
INSERT INTO USUARIOSXRESERVAS (idUsuarioS, idReservaS)
VALUES (9, 309);
INSERT INTO USUARIOSXRESERVAS (idUsuarioS, idReservaS)
VALUES (10, 310);

--16: Gran Concepto Caso de Uso--
INSERT INTO DEVOLUCIONES (idDevolucion, fechaDev, observaciones, idHistorialD)
VALUES (1, TO_DATE('2024-03-11', 'YYYY-MM-DD'), 'Libro devuelto en buen estado.', 101);
INSERT INTO DEVOLUCIONES (idDevolucion, fechaDev, observaciones, idHistorialD)
VALUES (2, TO_DATE('2024-03-12', 'YYYY-MM-DD'), 'Páginas dobladas en algunas secciones.', 102);
INSERT INTO DEVOLUCIONES (idDevolucion, fechaDev, observaciones, idHistorialD)
VALUES (3, TO_DATE('2024-03-13', 'YYYY-MM-DD'), 'Retraso de 2 días en la devolución.', 103);
INSERT INTO DEVOLUCIONES (idDevolucion, fechaDev, observaciones, idHistorialD)
VALUES (4, TO_DATE('2024-03-14', 'YYYY-MM-DD'), 'Cubierta con leves daños.', 104);
INSERT INTO DEVOLUCIONES (idDevolucion, fechaDev, observaciones, idHistorialD)
VALUES (5, TO_DATE('2024-03-15', 'YYYY-MM-DD'), 'Devolución a tiempo, sin observaciones.', 105);
INSERT INTO DEVOLUCIONES (idDevolucion, fechaDev, observaciones, idHistorialD)
VALUES (6, TO_DATE('2024-03-16', 'YYYY-MM-DD'), 'Manchas en algunas páginas.', 106);
INSERT INTO DEVOLUCIONES (idDevolucion, fechaDev, observaciones, idHistorialD)
VALUES (7, TO_DATE('2024-03-17', 'YYYY-MM-DD'), 'Libro cambiado por otro antes de devolver.', 107);
INSERT INTO DEVOLUCIONES (idDevolucion, fechaDev, observaciones, idHistorialD)
VALUES (8, TO_DATE('2024-03-18', 'YYYY-MM-DD'), 'Pequeño rasguño en la portada.', 108);
INSERT INTO DEVOLUCIONES (idDevolucion, fechaDev, observaciones, idHistorialD)
VALUES (9, TO_DATE('2024-03-19', 'YYYY-MM-DD'), 'Entrega con retraso, usuario avisado.', 109);
INSERT INTO DEVOLUCIONES (idDevolucion, fechaDev, observaciones, idHistorialD)
VALUES (10, TO_DATE('2024-03-20', 'YYYY-MM-DD'), 'Libro en excelente estado.', 110);

--17: Gran Concepto Caso de Uso--
INSERT INTO ESTADISTICAS_USO (idEU, cantidadP, eRetrasadas, eTiempo, dPendientes, idHistorialEU, idBiblioEU)
VALUES (1, 15, 2, 5, 1, 101, 200001);
INSERT INTO ESTADISTICAS_USO (idEU, cantidadP, eRetrasadas, eTiempo, dPendientes, idHistorialEU, idBiblioEU)
VALUES (2, 20, 3, 6, 2, 102, 200002);
INSERT INTO ESTADISTICAS_USO (idEU, cantidadP, eRetrasadas, eTiempo, dPendientes, idHistorialEU, idBiblioEU)
VALUES (3, 12, 1, 4, 0, 103, 200003);
INSERT INTO ESTADISTICAS_USO (idEU, cantidadP, eRetrasadas, eTiempo, dPendientes, idHistorialEU, idBiblioEU)
VALUES (4, 18, 4, 7, 3, 104, 200004);
INSERT INTO ESTADISTICAS_USO (idEU, cantidadP, eRetrasadas, eTiempo, dPendientes, idHistorialEU, idBiblioEU)
VALUES (5, 10, 0, 3, 1, 105, 200005);
INSERT INTO ESTADISTICAS_USO (idEU, cantidadP, eRetrasadas, eTiempo, dPendientes, idHistorialEU, idBiblioEU)
VALUES (6, 25, 5, 8, 4, 106, 200006);
INSERT INTO ESTADISTICAS_USO (idEU, cantidadP, eRetrasadas, eTiempo, dPendientes, idHistorialEU, idBiblioEU)
VALUES (7, 30, 6, 10, 5, 107, 200007);
INSERT INTO ESTADISTICAS_USO (idEU, cantidadP, eRetrasadas, eTiempo, dPendientes, idHistorialEU, idBiblioEU)
VALUES (8, 22, 2, 6, 2, 108, 200008);
INSERT INTO ESTADISTICAS_USO (idEU, cantidadP, eRetrasadas, eTiempo, dPendientes, idHistorialEU, idBiblioEU)
VALUES (9, 14, 1, 5, 1, 109, 200009);
INSERT INTO ESTADISTICAS_USO (idEU, cantidadP, eRetrasadas, eTiempo, dPendientes, idHistorialEU, idBiblioEU)
VALUES (10, 19, 3, 7, 2, 110, 200010);

--18: Gran Concepto Sancion--
INSERT INTO SANCIONES (idSancion, tiempoS, tipoS, fechaInS, fechaFinS)
VALUES ('M0001', 7, 'Retraso', TO_DATE('2025-03-01', 'YYYY-MM-DD'), TO_DATE('2025-03-08', 'YYYY-MM-DD'));
INSERT INTO SANCIONES (idSancion, tiempoS, tipoS, fechaInS, fechaFinS)
VALUES ('B0002', 14, 'Libro Perdido', TO_DATE('2025-02-15', 'YYYY-MM-DD'), TO_DATE('2025-03-01', 'YYYY-MM-DD'));
INSERT INTO SANCIONES (idSancion, tiempoS, tipoS, fechaInS, fechaFinS)
VALUES ('M0003', 10, 'Libro Dañado', TO_DATE('2025-02-20', 'YYYY-MM-DD'), TO_DATE('2025-03-02', 'YYYY-MM-DD'));
INSERT INTO SANCIONES (idSancion, tiempoS, tipoS, fechaInS, fechaFinS)
VALUES ('B0004', 5, 'Retraso', TO_DATE('2025-03-05', 'YYYY-MM-DD'), TO_DATE('2025-03-10', 'YYYY-MM-DD'));
INSERT INTO SANCIONES (idSancion, tiempoS, tipoS, fechaInS, fechaFinS)
VALUES ('M0005', 30, 'LPPNS', TO_DATE('2025-01-10', 'YYYY-MM-DD'), TO_DATE('2025-02-09', 'YYYY-MM-DD'));
INSERT INTO SANCIONES (idSancion, tiempoS, tipoS, fechaInS, fechaFinS)
VALUES ('B0006', 20, 'Libro Perdido', TO_DATE('2025-02-01', 'YYYY-MM-DD'), TO_DATE('2025-02-21', 'YYYY-MM-DD'));
INSERT INTO SANCIONES (idSancion, tiempoS, tipoS, fechaInS, fechaFinS)
VALUES ('M0007', 12, 'Libro Dañado', TO_DATE('2025-02-25', 'YYYY-MM-DD'), TO_DATE('2025-03-08', 'YYYY-MM-DD'));
INSERT INTO SANCIONES (idSancion, tiempoS, tipoS, fechaInS, fechaFinS)
VALUES ('B0008', 8, 'Retraso', TO_DATE('2025-03-10', 'YYYY-MM-DD'), TO_DATE('2025-03-18', 'YYYY-MM-DD'));
INSERT INTO SANCIONES (idSancion, tiempoS, tipoS, fechaInS, fechaFinS)
VALUES ('M0009', 15, 'LPPNS', TO_DATE('2025-02-05', 'YYYY-MM-DD'), TO_DATE('2025-02-20', 'YYYY-MM-DD'));
INSERT INTO SANCIONES (idSancion, tiempoS, tipoS, fechaInS, fechaFinS)
VALUES ('B0010', 25, 'Libro Perdido', TO_DATE('2025-01-15', 'YYYY-MM-DD'), TO_DATE('2025-02-09', 'YYYY-MM-DD'));

--19: Gran Concepto Caso de Uso--
INSERT INTO HISTORIALESXSANCIONES (idSancionG, idHistorialG)
VALUES ('M0001', 101);
INSERT INTO HISTORIALESXSANCIONES (idSancionG, idHistorialG)
VALUES ('B0002', 102);
INSERT INTO HISTORIALESXSANCIONES (idSancionG, idHistorialG)
VALUES ('M0003', 103);
INSERT INTO HISTORIALESXSANCIONES (idSancionG, idHistorialG)
VALUES ('B0004', 104);
INSERT INTO HISTORIALESXSANCIONES (idSancionG, idHistorialG)
VALUES ('M0005', 105);
INSERT INTO HISTORIALESXSANCIONES (idSancionG, idHistorialG)
VALUES ('B0006', 106);
INSERT INTO HISTORIALESXSANCIONES (idSancionG, idHistorialG)
VALUES ('M0007', 107);
INSERT INTO HISTORIALESXSANCIONES (idSancionG, idHistorialG)
VALUES ('B0008', 108);
INSERT INTO HISTORIALESXSANCIONES (idSancionG, idHistorialG)
VALUES ('M0009', 109);
INSERT INTO HISTORIALESXSANCIONES (idSancionG, idHistorialG)
VALUES ('B0010', 110);

--20: Gran Concepto Sancion--
INSERT INTO BLOQUEOS (idBloqueo, razonB, duracionB, fechB)
VALUES ('M0001', 'Retraso en la devolución de libros', '7 días', TO_DATE('2025-04-01', 'YYYY-MM-DD'));
INSERT INTO BLOQUEOS (idBloqueo, razonB, duracionB, fechB)
VALUES ('B0002', 'Libro perdido', '30 días', TO_DATE('2025-03-20', 'YYYY-MM-DD'));
INSERT INTO BLOQUEOS (idBloqueo, razonB, duracionB, fechB)
VALUES ('M0003', 'Retraso recurrente en entregas', '14 días', TO_DATE('2025-03-28', 'YYYY-MM-DD'));
INSERT INTO BLOQUEOS (idBloqueo, razonB, duracionB, fechB)
VALUES ('B0004', 'Deterioro grave de un libro', '21 días', TO_DATE('2025-03-15', 'YYYY-MM-DD'));
INSERT INTO BLOQUEOS (idBloqueo, razonB, duracionB, fechB)
VALUES ('M0005', 'Devolución tardía de múltiples libros', '10 días', TO_DATE('2025-04-02', 'YYYY-MM-DD'));
INSERT INTO BLOQUEOS (idBloqueo, razonB, duracionB, fechB)
VALUES ('B0006', 'Pérdida de un libro sin reposición', '45 días', TO_DATE('2025-03-10', 'YYYY-MM-DD'));
INSERT INTO BLOQUEOS (idBloqueo, razonB, duracionB, fechB)
VALUES ('M0007', 'Incumplimiento en reservas', '5 días', TO_DATE('2025-03-30', 'YYYY-MM-DD'));
INSERT INTO BLOQUEOS (idBloqueo, razonB, duracionB, fechB)
VALUES ('B0008', 'Libro dañado por humedad', '20 días', TO_DATE('2025-03-25', 'YYYY-MM-DD'));
INSERT INTO BLOQUEOS (idBloqueo, razonB, duracionB, fechB)
VALUES ('M0009', 'Retraso en la renovación de préstamo', '8 días', TO_DATE('2025-04-05', 'YYYY-MM-DD'));
INSERT INTO BLOQUEOS (idBloqueo, razonB, duracionB, fechB)
VALUES ('B0010', 'Intento de retirar material sin registro', '60 días', TO_DATE('2025-03-05', 'YYYY-MM-DD'));

--21: Gran Concepto Sancion--
INSERT INTO MULTAS (idMulta, montoM, fechaM, fechaPM, estadoM)
VALUES ('M0001', 50000, TO_DATE('2025-04-01', 'YYYY-MM-DD'), TO_DATE('2025-04-10', 'YYYY-MM-DD'), 'Pendiente');
INSERT INTO MULTAS (idMulta, montoM, fechaM, fechaPM, estadoM)
VALUES ('B0002', 75000, TO_DATE('2025-03-20', 'YYYY-MM-DD'), TO_DATE('2025-04-05', 'YYYY-MM-DD'), 'Pagado');
INSERT INTO MULTAS (idMulta, montoM, fechaM, fechaPM, estadoM)
VALUES ('M0003', 30000, TO_DATE('2025-03-28', 'YYYY-MM-DD'), TO_DATE('2025-04-08', 'YYYY-MM-DD'), 'Pendiente');
INSERT INTO MULTAS (idMulta, montoM, fechaM, fechaPM, estadoM)
VALUES ('B0004', 90000, TO_DATE('2025-03-15', 'YYYY-MM-DD'), TO_DATE('2025-03-30', 'YYYY-MM-DD'), 'Pagado');
INSERT INTO MULTAS (idMulta, montoM, fechaM, fechaPM, estadoM)
VALUES ('M0005', 45000, TO_DATE('2025-04-02', 'YYYY-MM-DD'), TO_DATE('2025-04-12', 'YYYY-MM-DD'), 'Pendiente');
INSERT INTO MULTAS (idMulta, montoM, fechaM, fechaPM, estadoM)
VALUES ('B0006', 120000, TO_DATE('2025-03-10', 'YYYY-MM-DD'), TO_DATE('2025-04-01', 'YYYY-MM-DD'), 'Pagado');
INSERT INTO MULTAS (idMulta, montoM, fechaM, fechaPM, estadoM)
VALUES ('M0007', 20000, TO_DATE('2025-03-30', 'YYYY-MM-DD'), TO_DATE('2025-04-09', 'YYYY-MM-DD'), 'Pendiente');
INSERT INTO MULTAS (idMulta, montoM, fechaM, fechaPM, estadoM)
VALUES ('B0008', 95000, TO_DATE('2025-03-25', 'YYYY-MM-DD'), TO_DATE('2025-04-06', 'YYYY-MM-DD'), 'Pagado');
INSERT INTO MULTAS (idMulta, montoM, fechaM, fechaPM, estadoM)
VALUES ('M0009', 60000, TO_DATE('2025-04-05', 'YYYY-MM-DD'), TO_DATE('2025-04-15', 'YYYY-MM-DD'), 'Pendiente');
INSERT INTO MULTAS (idMulta, montoM, fechaM, fechaPM, estadoM)
VALUES ('B0010', 150000, TO_DATE('2025-03-05', 'YYYY-MM-DD'), TO_DATE('2025-03-25', 'YYYY-MM-DD'), 'Pagado');