--/Consultas Operativas\--

--Consultar las multas que aun no han sido pagadas--
SELECT m.idMulta, m.fechaM, m.montoM, u.idUsuario, u.nombreU, u.apellidoU
FROM MULTAS m
JOIN HISTORIALESXSANCIONES g ON m.idMulta = g.idSancionG
JOIN HISTORIALES_PRESTAMOS hp ON g.idHistorialG = hp.idHistorial
JOIN USUARIOS u ON hp.idHistorial = u.idHistorialU
WHERE m.estadoM = 'Pendiente';

--Consultar los ultimos 5 libros que fueron devueltos de forma general (no importa la biblioteca)--
SELECT d.idDevolucion, d.fechaDev, a.nombreArticulo
FROM DEVOLUCIONES d
JOIN HISTORIALES_PRESTAMOS h ON d.idHistorialD = h.idHistorial
JOIN ARTICULOS a ON h.idArticuloHP = a.idArticulo
ORDER BY d.fechaDev DESC
FETCH FIRST 5 ROWS ONLY; --Investigado--

--Obtener informacion de las diferentes categorias de articulos que hay en la biblioteca--
SELECT c.categoria, a.idArticulo, a.nombreArticulo, a.autor
FROM CATEGORIAS_TEMAS c
JOIN ARTICULOS a ON c.idCatem = a.idACatem
WHERE a.idArticulo = (
    SELECT MIN(a2.idArticulo)
    FROM ARTICULOS a2
    WHERE a2.idACatem = c.idCatem)
ORDER BY c.categoria;

--Consultar turnos de trabajadores que lo antecedieron--
SELECT t.idTrab, tt.horaInicio, tt.horaFin, tt.tipoTurno AS turno, t.nombreTr AS nombre_trabajador
FROM TRABAJADORES t
JOIN TRABAJADORESXTURNOS p ON t.idTrab = p.idTrabP
JOIN TURNOS_TRABAJADORES tt ON p.idTurnoP = tt.idTurno
WHERE  TO_DATE(TO_CHAR(SYSDATE, 'DD-MM-YYYY')||''||tt.horaFin, 'DD-MM-YYYY HH24:MI:SS') < SYSDATE
ORDER BY tt.horaFin DESC;

--Consultar aquellos articulos del inventario los cuales se encuentren Perdidos--
SELECT i.idInv, a.nombreArticulo, i.estanteria
FROM INVENTARIOS i
JOIN DISPONIBILIDADES d ON i.idDispIn = d.idDisp
JOIN ARTICULOS a ON d.idDisp = a.idADisp
WHERE d.estado_disp = 'Perdido';

--Consultar el estado de los articulos--
SELECT a.idArticulo, d.estado_disp, a.nombreArticulo AS titulo, a.autor, MAX(dev.fechaDev) AS ultima_devolucion
FROM ARTICULOS a
JOIN DISPONIBILIDADES d ON a.idADisp = d.idDisp
LEFT JOIN HISTORIALES_PRESTAMOS hp ON a.idArticulo = hp.idArticuloHP
LEFT JOIN DEVOLUCIONES dev ON hp.idHistorial = dev.idHistorialD
GROUP BY a.idArticulo, d.estado_disp, a.nombreArticulo, a.autor;

--Consultar las bibliotecas con mayor flujo de usuarios--
SELECT b.idBiblio, b.nombreBiblio, e.fecha, SUM(e.numAsistentes) AS numero_personas
FROM BIBLIOTECAS b
JOIN EVENTOS e ON b.idBiblio = e.idBiblioEv
GROUP BY b.idBiblio, b.nombreBiblio, e.fecha
ORDER BY numero_personas DESC;

--Consultar las categorias que generan mas preferencias entre los usuarios--
SELECT c.idCatem, c.categoria, COUNT(r.idReserva) AS num_reservas
FROM CATEGORIAS_TEMAS c
JOIN ARTICULOS a ON c.idCatem = a.idACatem
JOIN HISTORIALES_PRESTAMOS hp ON a.idArticulo = hp.idArticuloHP
JOIN DISPONIBILIDADES d ON d.idDisp = a.idADisp
JOIN RESERVAS r ON d.idDisp = r.idDispR
GROUP BY c.idCatem, c.categoria
ORDER BY num_reservas DESC;

--/Consultas Gerenciales\--

--Consultar inventario de la biblioteca--
SELECT eu.cantidadP, a.idArticulo, a.nombreArticulo
FROM ESTADISTICAS_USO eu
JOIN HISTORIALES_PRESTAMOS hp ON eu.idHistorialEU = hp.idHistorial
JOIN ARTICULOS a ON hp.idArticuloHP = a.idArticulo
ORDER BY eu.cantidadP DESC;

--Consultar los eventos con mas asistencias en una biblioteca--
SELECT e.fecha, b.nombreBiblio AS biblioteca, e.idEvento, e.numAsistentes, e.tematica
FROM EVENTOS e
JOIN BIBLIOTECAS b ON e.idBiblioEv = b.idBiblio
ORDER BY e.numAsistentes DESC;