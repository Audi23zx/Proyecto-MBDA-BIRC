CREATE VIEW VnoPagos AS(
    SELECT m.idMulta, m.fechaM, m.montoM, u.idUsuario, u.nombreU, u.apellidoU
    FROM MULTAS m
    JOIN HISTORIALESXSANCIONES g ON m.idMulta = g.idSancionG
    JOIN HISTORIALES_PRESTAMOS hp ON g.idHistorialG = hp.idHistorial
    JOIN USUARIOS u ON hp.idHistorial = u.idHistorialU
    WHERE m.estadoM = 'Pendiente'
);

CREATE VIEW VlibrosDevueltos AS(
    SELECT d.idDevolucion, d.fechaDev, a.nombreArticulo
    FROM DEVOLUCIONES d
    JOIN HISTORIALES_PRESTAMOS h ON d.idHistorialD = h.idHistorial
    JOIN ARTICULOS a ON h.idArticuloHP = a.idArticulo
    ORDER BY d.fechaDev DESC
    FETCH FIRST 5 ROWS ONLY
);

CREATE VIEW VinfoCategoriaA AS(
    SELECT c.categoria, a.idArticulo, a.nombreArticulo, a.autor
    FROM CATEGORIAS_TEMAS c
    JOIN ARTICULOS a ON c.idCatem = a.idACatem
    WHERE a.idArticulo = (
        SELECT MIN(a2.idArticulo)
        FROM ARTICULOS a2
        WHERE a2.idACatem = c.idCatem)
);

CREATE VIEW VturnosTrabajadores AS(
    SELECT t.idTrab, tt.horaInicio, tt.horaFin, tt.tipoTurno AS turno, t.nombreTr AS nombre_trabajador
    FROM TRABAJADORES t
    JOIN TRABAJADORESXTURNOS p ON t.idTrab = p.idTrabP
    JOIN TURNOS_TRABAJADORES tt ON p.idTurnoP = tt.idTurno
    WHERE  TO_DATE(TO_CHAR(SYSDATE, 'DD-MM-YYYY')||''||tt.horaFin, 'DD-MM-YYYY HH24:MI:SS') < SYSDATE
);

CREATE VIEW VarticulosPerdidos AS(
    SELECT i.idInv, a.nombreArticulo, i.estanteria
    FROM INVENTARIOS i
    JOIN DISPONIBILIDADES d ON i.idDispIn = d.idDisp
    JOIN ARTICULOS a ON d.idDisp = a.idADisp
    WHERE d.estado_disp = 'Perdido'
);

CREATE VIEW VbibliotecasVisitadas AS(
    SELECT b.idBiblio, b.nombreBiblio, e.fecha, SUM(e.numAsistentes) AS numero_personas
    FROM BIBLIOTECAS b
    JOIN EVENTOS e ON b.idBiblio = e.idBiblioEv
    GROUP BY b.idBiblio, b.nombreBiblio, e.fecha
);

CREATE VIEW VinventarioBiblio AS(
    SELECT eu.cantidadP, a.idArticulo, a.nombreArticulo
    FROM ESTADISTICAS_USO eu
    JOIN HISTORIALES_PRESTAMOS hp ON eu.idHistorialEU = hp.idHistorial
    JOIN ARTICULOS a ON hp.idArticuloHP = a.idArticulo
);

CREATE VIEW VasistenciaEventos AS(
    SELECT e.fecha, b.nombreBiblio AS biblioteca, e.idEvento, e.numAsistentes, e.tematica
    FROM EVENTOS e
    JOIN BIBLIOTECAS b ON e.idBiblioEv = b.idBiblio
);