--SANCIONES--
CREATE OR REPLACE PACKAGE BODY PC_SANCIONES AS
---------------
    PROCEDURE ADD_sanc(tiempoSx NUMBER, tipoSx VARCHAR, fechaInSx DATE, fechaFinSx DATE) IS
    BEGIN
        INSERT INTO SANCIONES(idSancion, tiempoS, tipoS, fechaInS, fechaFinS)
        VALUES ('nada', tiempoSx, tipoSx, fechaInSx, fechaFinSx);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001, 'Error en ADD_sancion: ' || SQLERRM);
    END;
--------------
    PROCEDURE MOD_sanc(idSancionx VARCHAR, tiempoSx NUMBER) IS
    BEGIN
        UPDATE SANCIONES
        SET tiempoS = tiempoSx
        WHERE idSancion = idSancionx;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20002, 'Error en MOD_sancion: ' || SQLERRM);
    END;
--------------
    FUNCTION CON_sanc(idSancionx VARCHAR) RETURN SYS_REFCURSOR IS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR SELECT * FROM SANCIONES WHERE idSancion = idSancionx;
        RETURN cur;
    END;
---------------
    PROCEDURE DEL_sanc(idSancionx VARCHAR) IS
    BEGIN
        DELETE FROM SANCIONES WHERE idSancion = idSancionx;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20003, 'Error en DEL_sancion: ' || SQLERRM);
    END;
---------------
    PROCEDURE ADD_bloq(razonBx VARCHAR, duracionBx VARCHAR, fechaBx DATE) IS
    BEGIN
        INSERT INTO BLOQUEOS(idBloqueo, razonB, duracionB, fechB)
        VALUES ('id', razonBx, duracionBx, fechaBx);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20004, 'Error en ADD_bloqueo: ' || SQLERRM);
    END;
--------------
    PROCEDURE MOD_bloq(idBloqueox VARCHAR, razonBx VARCHAR, duracionBx VARCHAR) IS
    BEGIN
        UPDATE BLOQUEOS
        SET razonB = razonBx, duracionB = duracionBx
        WHERE idBloqueo = idBloqueox;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20005, 'Error en MOD_bloqueo: ' || SQLERRM);
    END;
--------------
    FUNCTION CON_bloq(idBloqueox VARCHAR) RETURN SYS_REFCURSOR IS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR SELECT * FROM BLOQUEOS WHERE idBloqueo = idBloqueox;
        RETURN cur;
    END;
--------------
    PROCEDURE ADD_multa(montoMx NUMBER, fechaMx DATE, fechaPMx DATE, estadoMx VARCHAR) IS
    BEGIN
        INSERT INTO MULTAS(idMulta, montoM, fechaM, fechaPM, estadoM)
        VALUES ('id', montoMx, fechaMx, fechaPMx, estadoMx);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20006, 'Error en ADD_multa: ' || SQLERRM);
    END;
--------------
    PROCEDURE MOD_multa(idMultax VARCHAR, estadoMx VARCHAR) IS
    BEGIN
        UPDATE MULTAS
        SET estadoM = estadoMx
        WHERE idMulta = idMultax;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20007, 'Error en MOD_multa: ' || SQLERRM);
    END;
--------------
    FUNCTION CON_multa(idMultax VARCHAR) RETURN SYS_REFCURSOR IS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR SELECT * FROM MULTAS WHERE idMulta = idMultax;
        RETURN cur;
    END;
-- CONSULTA DE MULTAS NO PAGADAS
    FUNCTION CON_NO_PAG RETURN SYS_REFCURSOR IS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR 
            SELECT m.idMulta, m.fechaM, m.montoM, u.idUsuario, u.nombreU, u.apellidoU
            FROM MULTAS m
            JOIN HISTORIALESXSANCIONES g ON m.idMulta = g.idSancionG
            JOIN HISTORIALES_PRESTAMOS hp ON g.idHistorialG = hp.idHistorial
            JOIN USUARIOS u ON hp.idHistorial = u.idHistorialU
            WHERE m.estadoM = 'Pendiente';
        RETURN cur;
    END;
END PC_SANCIONES;

--=============================================================================================--

--ARTICULOS--
CREATE OR REPLACE PACKAGE BODY PC_ARTICULOS AS
-------------
  PROCEDURE ADD_catem(idCatemx NUMBER, categoriax VARCHAR, temax VARCHAR, generox VARCHAR) IS
  BEGIN
    INSERT INTO CATEGORIAS_TEMAS VALUES (idCatemx, categoriax, temax, generox);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20008, 'Error al ADD_categoría/tema: ' || SQLERRM);
  END;
-------------
  PROCEDURE MOD_catem(idCatemx NUMBER, categoriax VARCHAR) IS
  BEGIN
    UPDATE CATEGORIAS_TEMAS SET categoria = categoriax WHERE idCatem = idCatemx;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20009, 'Error al MOD_categoría: ' || SQLERRM);
  END;
------------
  FUNCTION CON_catem(idCatemx NUMBER) RETURN SYS_REFCURSOR IS
    c SYS_REFCURSOR;
  BEGIN
    OPEN c FOR SELECT * FROM CATEGORIAS_TEMAS WHERE idCatem = idCatemx;
    RETURN c;
  END;
-------------
  PROCEDURE ADD_editor(idEditx NUMBER, nombreEdx VARCHAR, contactox VARCHAR) IS
  BEGIN
    INSERT INTO EDITORIALES(idEdit, nombreEd, contacto) VALUES (idEditx, nombreEdx, contactox);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20010, 'Error al ADD_editorial: ' || SQLERRM);
  END;
-------------
  PROCEDURE MOD_editor(idEditx NUMBER, sitWebx XMLTYPE) IS
  BEGIN
    UPDATE EDITORIALES SET sitWeb = sitWebx WHERE idEdit = idEditx;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20011, 'Error al MOD_editorial: ' || SQLERRM);
  END;
------------
  FUNCTION CON_editor(idEditx NUMBER) RETURN SYS_REFCURSOR IS
    c SYS_REFCURSOR;
  BEGIN
    OPEN c FOR SELECT idEdit,nombreEd,contacto FROM EDITORIALES WHERE idEdit = idEditx;
    RETURN c;
  END;
-------------
  PROCEDURE ADD_artic(
    idArticulox     NUMBER,
    nombreArticulox VARCHAR,
    autorx          VARCHAR,
    fecha_pubx      DATE,
    estadoFisx      VARCHAR,
    num_ISBNx       NUMBER,
    idiomax         VARCHAR,
    idACatemx       NUMBER,
    idAEditx        NUMBER,
    idADispx        NUMBER) IS
  BEGIN
    INSERT INTO ARTICULOS (
      idArticulo, nombreArticulo, autor, fecha_pub, estadoFis, extension,
      num_ISBN, idioma, sinopsis, costoAdq, idACatem, idAEdit, idADisp
    )
    VALUES (
      idArticulox, nombreArticulox, autorx, fecha_pubx, estadoFisx, 100,
      num_ISBNx, idiomax, NULL, 10000, idACatemx, idAEditx, idADispx
    );
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20012, 'Error al ADD_artículo: ' || SQLERRM);
  END;
-------------
  PROCEDURE MOD_artic(
    idArticulox NUMBER,
    estadoFisx  VARCHAR,
    costoAdqx   NUMBER,
    sinopsisx VARCHAR
  ) IS
  BEGIN
    UPDATE ARTICULOS
    SET estadoFis = estadoFisx,
        costoAdq  = costoAdqx,
        sinopsis = sinopsisx
    WHERE idArticulo = idArticulox;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20013, 'Error al MOD_artículo: ' || SQLERRM);
  END;
------------
  FUNCTION CON_artic(idArticulox NUMBER) RETURN SYS_REFCURSOR IS
    c SYS_REFCURSOR;
  BEGIN
    OPEN c FOR SELECT * FROM ARTICULOS WHERE idArticulo = idArticulox;
    RETURN c;
  END;
-------------
  PROCEDURE DEL_artic(idArticulox NUMBER) IS
  BEGIN
    DELETE FROM ARTICULOS WHERE idArticulo = idArticulox;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20013, 'Error al DEL_artículo: ' || SQLERRM);
  END;
-- CONSULTAR INFO CATEGORIAS
  FUNCTION CON_INFO_CATEG RETURN SYS_REFCURSOR IS
    c SYS_REFCURSOR;
  BEGIN
    OPEN c FOR
        SELECT c.categoria, a.idArticulo, a.nombreArticulo, a.autor
        FROM CATEGORIAS_TEMAS c
        JOIN ARTICULOS a ON c.idCatem = a.idACatem
        WHERE a.idArticulo = (
            SELECT MIN(a2.idArticulo)
            FROM ARTICULOS a2
            WHERE a2.idACatem = c.idCatem)
        ORDER BY c.categoria;
    RETURN c;
  END;
-- CONSULTAR ESTADO ARTICULO
  FUNCTION CON_ART_EST RETURN SYS_REFCURSOR IS
    c SYS_REFCURSOR;
  BEGIN
    OPEN c FOR 
        SELECT a.idArticulo, d.estado_disp, a.nombreArticulo AS titulo, a.autor, MAX(dev.fechaDev) AS ultima_devolucion
        FROM ARTICULOS a
        JOIN DISPONIBILIDADES d ON a.idADisp = d.idDisp
        LEFT JOIN HISTORIALES_PRESTAMOS hp ON a.idArticulo = hp.idArticuloHP
        LEFT JOIN DEVOLUCIONES dev ON hp.idHistorial = dev.idHistorialD
        GROUP BY a.idArticulo, d.estado_disp, a.nombreArticulo, a.autor;
    RETURN c;
  END;
-- CONSULTAR CATEGORIA PREFERIDA
  FUNCTION CON_CAT_PREF RETURN SYS_REFCURSOR IS
    c SYS_REFCURSOR;
  BEGIN
    OPEN c FOR
        SELECT c.idCatem, c.categoria, COUNT(r.idReserva) AS num_reservas
        FROM CATEGORIAS_TEMAS c
        JOIN ARTICULOS a ON c.idCatem = a.idACatem
        JOIN HISTORIALES_PRESTAMOS hp ON a.idArticulo = hp.idArticuloHP
        JOIN DISPONIBILIDADES d ON d.idDisp = a.idADisp
        JOIN RESERVAS r ON d.idDisp = r.idDispR
        GROUP BY c.idCatem, c.categoria
        ORDER BY num_reservas DESC;
    RETURN c;
  END;
END PC_ARTICULOS;

--=============================================================================================--

--USUARIOS--
CREATE OR REPLACE PACKAGE BODY PC_USUARIOS IS
-------------
  PROCEDURE ADD_reserva(idReservax NUMBER, tiempoRx NUMBER, canLibrosx NUMBER, caractEntregax VARCHAR, idDispRx NUMBER) IS
  BEGIN
    INSERT INTO RESERVAS (idReserva, tiempoR, cantLibros, caractEntrega, idDispR)
    VALUES (idReservax, tiempoRx, canLibrosx, caractEntregax, idDispRx);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20014, 'Error al ADD_reserva: ' || SQLERRM);
  END;
-------------
  PROCEDURE MOD_reserva(idReservax NUMBER, tiempoRx NUMBER, canLibrosx NUMBER) IS
  BEGIN
    UPDATE RESERVAS
    SET tiempoR = tiempoRx,
        cantLibros = canLibrosx
    WHERE idReserva = idReservax;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20015, 'Error al MOD_reserva: ' || SQLERRM);
  END;
------------
  FUNCTION CON_reserva(idReservax NUMBER) RETURN SYS_REFCURSOR IS
    c SYS_REFCURSOR;
  BEGIN
    OPEN c FOR SELECT * FROM RESERVAS WHERE idReserva = idReservax;
    RETURN c;
  END;
------------
  PROCEDURE ADD_suscrip(idSusx NUMBER, contactoSusx VARCHAR, residenciaSusx VARCHAR, costoSusx NUMBER) IS
  BEGIN
    INSERT INTO SUSCRIPCIONES (idSus, contactoSus, residenciaSus, costoSus)
    VALUES (idSusx, contactoSusx, residenciaSusx, costoSusx);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20016, 'Error al ADD_suscripción: ' || SQLERRM);
  END;
-------------
  PROCEDURE MOD_suscrip(idSusx NUMBER, contactoSusx VARCHAR, residenciaSusx VARCHAR, costoSusx NUMBER) IS
  BEGIN
    UPDATE SUSCRIPCIONES
    SET contactoSus = contactoSusx,
        residenciaSus = residenciaSusx,
        costoSus = costoSusx
    WHERE idSus = idSusx;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20017, 'Error al MOD_suscripción: ' || SQLERRM);
  END;
------------
  FUNCTION CON_suscrip(idSusx NUMBER) RETURN SYS_REFCURSOR IS
    c SYS_REFCURSOR;
  BEGIN
    OPEN c FOR SELECT * FROM SUSCRIPCIONES WHERE idSus = idSusx;
    RETURN c;
  END;
-------------
  PROCEDURE DEL_suscrip(idSusx NUMBER) IS
  BEGIN
    DELETE FROM SUSCRIPCIONES WHERE idSus = idSusx;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20018, 'Error al DEL_suscripción: ' || SQLERRM);
  END;
-------------
  PROCEDURE ADD_usser(idUsuariox NUMBER, nombreUx VARCHAR, apellidoUx VARCHAR, tipoDocUx VARCHAR, numDocUx NUMBER, edadUx NUMBER,
    idHistUx NUMBER, idSusUsx NUMBER) IS
  BEGIN
    INSERT INTO USUARIOS (idUsuario, nombreU, apellidoU, tipoDocU, numDocU, edadU, idHistorialU, idSusUss)
    VALUES (idUsuariox, nombreUx, apellidoUx, tipoDocUx, numDocUx, edadUx, idHistUx, idSusUsx);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20019, 'Error al ADD_usuario: ' || SQLERRM);
  END;
-------------
  PROCEDURE MOD_usser(idUsuariox NUMBER, edadx NUMBER, idSusUsx NUMBER) IS
  BEGIN
    UPDATE USUARIOS
    SET edadU = edadx,
        idSusUss = idSusUsx
    WHERE idUsuario = idUsuariox;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20020, 'Error al MOD_usuario: ' || SQLERRM);
  END;
------------
  FUNCTION CON_usser(idUsuariox NUMBER) RETURN SYS_REFCURSOR IS
    c SYS_REFCURSOR;
  BEGIN
    OPEN c FOR SELECT * FROM USUARIOS WHERE idUsuario = idUsuariox;
    RETURN c;
  END;
-------------
  PROCEDURE DEL_usser(idUsuariox NUMBER) IS
  BEGIN
    DELETE FROM USUARIOS WHERE idUsuario = idUsuariox;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20021, 'Error al DEL_usuario: ' || SQLERRM);
  END;
-- CONSULTA USUARIOS EN LA PLATAFORMA
  FUNCTION CON_USUARIOS RETURN SYS_REFCURSOR IS
    c SYS_REFCURSOR;
  BEGIN
    OPEN c FOR 
        SELECT * FROM USUARIOS;
    RETURN c;
  END;
END PC_USUARIOS;

--=================================================================================--

--BIBLIOTECAS--
CREATE OR REPLACE PACKAGE BODY PC_BIBLIOTECAS IS
-------------
  PROCEDURE ADD_evento(idEventox NUMBER, nombreEx VARCHAR, fechax DATE, tematicax VARCHAR, numAsistentesx NUMBER, idBiblioEvx NUMBER) IS
  BEGIN
    INSERT INTO EVENTOS (idEvento, nombreE, fecha, tematica, numAsistentes, objetivo, idBiblioEv)
    VALUES (idEventox, nombreEx, fechax, tematicax, numAsistentesx, NULL, idBiblioEvx);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20022, 'Error al ADD_evento: ' || SQLERRM);
  END;
-------------
  PROCEDURE MOD_evento(idEventox NUMBER, nombreEx VARCHAR, tematicax VARCHAR, numAsistentesx NUMBER, objetivox VARCHAR) IS
  BEGIN
    UPDATE EVENTOS
    SET nombreE = nombreEx,
        tematica = tematicax,
        numAsistentes = numAsistentesx,
        objetivo = objetivox
    WHERE idEvento = idEventox;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20023, 'Error al MOD_evento: ' || SQLERRM);
  END;
-------------
  FUNCTION CON_evento(idEventox NUMBER) RETURN SYS_REFCURSOR IS
    cur_evento SYS_REFCURSOR;
  BEGIN
    OPEN cur_evento FOR
      SELECT * FROM EVENTOS WHERE idEvento = idEventox;
    RETURN cur_evento;
  END;
-------------
  PROCEDURE ADD_biblio(idBibliox NUMBER, nombreBibliox VARCHAR, ubicacionx VARCHAR, contactox VARCHAR, cantEmpleadosx NUMBER, instalacionx VARCHAR) IS
  BEGIN
    INSERT INTO BIBLIOTECAS (idBiblio, nombreBiblio, ubicacion, contactoB, cantEmpleado, horaApert, horaCierre, instalacion)
    VALUES (idBibliox, nombreBibliox, ubicacionx, contactox, cantEmpleadosx, '08:00', '18:00', instalacionx);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20024, 'Error al ADD_biblioteca: ' || SQLERRM);
  END;
-------------
  PROCEDURE MOD_biblio(idBibliox NUMBER, nombreBibliox VARCHAR, ubicacionx VARCHAR, cantEmpleadosx NUMBER) IS
  BEGIN
    UPDATE BIBLIOTECAS
    SET nombreBiblio = nombreBibliox,
        ubicacion = ubicacionx,
        cantEmpleado = cantEmpleadosx
    WHERE idBiblio = idBibliox;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20025, 'Error al MOD_biblioteca: ' || SQLERRM);
  END;
-------------
  FUNCTION CON_biblio(idBibliox NUMBER) RETURN SYS_REFCURSOR IS
    cur_bib SYS_REFCURSOR;
  BEGIN
    OPEN cur_bib FOR
      SELECT * FROM BIBLIOTECAS WHERE idBiblio = idBibliox;
    RETURN cur_bib;
  END;
-------------
  PROCEDURE ADD_trabaj(idTrabx NUMBER, nombreTrx VARCHAR, apellidoTrx VARCHAR, edadx NUMBER, contactoTrx VARCHAR,
            tipoDocx VARCHAR, numDocx NUMBER, estadoCivilx VARCHAR, idBiblioTx NUMBER) IS
  BEGIN
    INSERT INTO TRABAJADORES (idTrab, nombreTr, apellidoTr, edad, contactoTrab, residencia,
      tipoDoc, numDoc, cargo, estadoCivil, idBiblioT)
    VALUES (idTrabx, nombreTrx, apellidoTrx, edadx, contactoTrx, 'Desconocido',
      tipoDocx, numDocx, 'Asistente', estadoCivilx, idBiblioTx);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20026, 'Error al ADD_trabajador: ' || SQLERRM);
  END;
-------------
  PROCEDURE MOD_trabaj(idTrabx NUMBER, edadx NUMBER, contactoTrx VARCHAR, cargoX VARCHAR) IS
  BEGIN
    UPDATE TRABAJADORES
    SET edad = edadx,
        contactoTrab = contactoTrx,
        cargo = cargoX
    WHERE idTrab = idTrabx;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20027, 'Error al MOD_trabajador: ' || SQLERRM);
  END;
-------------
  FUNCTION CON_trabaj(idTrabx NUMBER) RETURN SYS_REFCURSOR IS
    cur_trab SYS_REFCURSOR;
  BEGIN
    OPEN cur_trab FOR
      SELECT * FROM TRABAJADORES WHERE idTrab = idTrabx;
    RETURN cur_trab;
  END;
-------------
  PROCEDURE DEL_trabaj(idTrabx NUMBER) IS
  BEGIN
    DELETE FROM TRABAJADORES WHERE idTrab = idTrabx;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20028, 'Error al DEL_trabajador: ' || SQLERRM);
  END;
-------------
  PROCEDURE ADD_turno(idTurnox NUMBER, tipoTurnox VARCHAR, tareax VARCHAR, horainiciox VARCHAR, horaFinx VARCHAR) IS
    v_cantHoras VARCHAR(10);
  BEGIN
    v_cantHoras := 
                (TO_DATE(TO_CHAR(SYSDATE, 'DD-MM-YYYY')||''||horaFinx, 'DD-MM-YYYY HH24:MI:SS')-
                TO_DATE(TO_CHAR(SYSDATE, 'DD-MM-YYYY')||''||horaIniciox, 'DD-MM-YYYY HH24:MI:SS'))*24;
    INSERT INTO TURNOS_TRABAJADORES (idTurno, tipoTurno, tarea, horaInicio, horaFin, cantHoras)
    VALUES (idTurnox, tipoTurnox, tareax, horainiciox, horaFinx, v_cantHoras);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20029, 'Error al ADD_turno: ' || SQLERRM);
  END;
-------------
  PROCEDURE MOD_turno(idTurnox NUMBER, tipoTurnox VARCHAR, tareax VARCHAR, horainiciox VARCHAR, horaFinx VARCHAR) IS
    v_cantHoras VARCHAR(10);
  BEGIN
    v_cantHoras := 
                (TO_DATE(TO_CHAR(SYSDATE, 'DD-MM-YYYY')||''||horaFinx, 'DD-MM-YYYY HH24:MI:SS')- 
                TO_DATE(TO_CHAR(SYSDATE, 'DD-MM-YYYY')||''||horaIniciox, 'DD-MM-YYYY HH24:MI:SS'))*24;
    UPDATE TURNOS_TRABAJADORES
    SET tipoTurno = tipoTurnox,
        tarea = tareax,
        horaInicio = horainiciox,
        horaFin = horaFinx,
        cantHoras = v_cantHoras
    WHERE idTurno = idTurnox;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20030, 'Error al MOD_turno: ' || SQLERRM);
  END;
-------------
  FUNCTION CON_turno(idTurnox NUMBER) RETURN SYS_REFCURSOR IS
    cur_turno SYS_REFCURSOR;
  BEGIN
    OPEN cur_turno FOR
      SELECT * FROM TURNOS_TRABAJADORES WHERE idTurno = idTurnox;
    RETURN cur_turno;
  END;
-------------
  PROCEDURE DEL_turno(idTurnox NUMBER) IS
  BEGIN
    DELETE FROM TURNOS_TRABAJADORES WHERE idTurno = idTurnox;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20031, 'Error al DEL_turno: ' || SQLERRM);
  END;
-- CONSULTA TURNO TRAB
  FUNCTION CON_TURNOS RETURN SYS_REFCURSOR IS
    cur_tur SYS_REFCURSOR;
  BEGIN
    OPEN cur_tur FOR
      SELECT t.idTrab, tt.horaInicio, tt.horaFin, tt.tipoTurno AS turno, t.nombreTr AS nombre_trabajador
      FROM TRABAJADORES t
      JOIN TRABAJADORESXTURNOS p ON t.idTrab = p.idTrabP
      JOIN TURNOS_TRABAJADORES tt ON p.idTurnoP = tt.idTurno
      WHERE  TO_DATE(TO_CHAR(SYSDATE, 'DD-MM-YYYY')||''||tt.horaFin, 'DD-MM-YYYY HH24:MI:SS') < SYSDATE
      ORDER BY tt.horaFin DESC;
    RETURN cur_tur;
  END;
--CONSULTAR BIBLIOTECA CON MAS USUARIOS
  FUNCTION CON_BIBLIO RETURN SYS_REFCURSOR IS
    cur_bib SYS_REFCURSOR;
  BEGIN
    OPEN cur_bib FOR
        SELECT b.idBiblio, b.nombreBiblio, e.fecha, SUM(e.numAsistentes) AS numero_personas
        FROM BIBLIOTECAS b
        JOIN EVENTOS e ON b.idBiblio = e.idBiblioEv
        GROUP BY b.idBiblio, b.nombreBiblio, e.fecha
        ORDER BY numero_personas DESC;
    RETURN cur_bib;
  END;
END PC_BIBLIOTECAS;

--===============================================================================--

--INVENTARIOS--
CREATE OR REPLACE PACKAGE BODY PC_INVENTARIOS IS
-------------
  PROCEDURE ADD_disp(idDispx NUMBER, estado_dispx VARCHAR) IS
  BEGIN
    INSERT INTO DISPONIBILIDADES (idDisp, estado_disp)
    VALUES (idDispx, estado_dispx);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20032, 'Error al ADD_disponibilidad: ' || SQLERRM);
  END;
-------------
  PROCEDURE MOD_disp(idDispx NUMBER, estado_dispx VARCHAR) IS
  BEGIN
    UPDATE DISPONIBILIDADES
    SET estado_disp = estado_dispx
    WHERE idDisp = idDispx;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20033, 'Error al MOD_disponibilidad: ' || SQLERRM);
  END;
-------------
  FUNCTION CON_disp(idDispx NUMBER) RETURN SYS_REFCURSOR IS
    rc SYS_REFCURSOR;
  BEGIN
    OPEN rc FOR
      SELECT * FROM DISPONIBILIDADES WHERE idDisp = idDispx;
    RETURN rc;
  END;
-------------
  PROCEDURE ADD_invent(idInvx NUMBER, fechAgx DATE, nombreAx VARCHAR, cantidad_invx NUMBER, 
            condicion_invx VARCHAR, estanteriax VARCHAR, idBiblioInx NUMBER, idDispinx NUMBER, accesox VARCHAR) IS
  BEGIN
    INSERT INTO INVENTARIOS (idInv, fechAg, nombreA, cantidad_inv, condicion_inv, estanteria, acceso, idBiblioIn,idDispIn) 
    VALUES (idInvx, fechAgx, nombreAx, cantidad_invx,condicion_invx, estanteriax, accesox, idBiblioInx, idDispinx);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20034, 'Error al ADD_inventario: ' || SQLERRM);
  END;
-------------
  PROCEDURE MOD_invent(idInvx NUMBER, cantidad_invx NUMBER, condicion_invx VARCHAR,estanteriax VARCHAR, accesox VARCHAR) IS
  BEGIN
    UPDATE INVENTARIOS
    SET cantidad_inv = cantidad_invx,
        condicion_inv = condicion_invx,
        estanteria = estanteriax,
        acceso = accesox
    WHERE idInv = idInvx;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20035, 'Error al MOD_inventario: ' || SQLERRM);
  END;
-------------
  FUNCTION CON_invent(idInvx NUMBER) RETURN SYS_REFCURSOR IS
    rc SYS_REFCURSOR;
  BEGIN
    OPEN rc FOR SELECT * FROM INVENTARIOS WHERE idInv = idInvx;
    RETURN rc;
  END;
-------------
  PROCEDURE DEL_invent(idInvx NUMBER) IS
  BEGIN
    DELETE FROM INVENTARIOS WHERE idInv = idInvx;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20036, 'Error al DEL_inventario: ' || SQLERRM);
  END;
-- CONSULTAR ARTICULOS PERDIDOS
  FUNCTION CON_EXT_ART RETURN SYS_REFCURSOR IS
    rc SYS_REFCURSOR;
  BEGIN
    OPEN rc FOR 
        SELECT i.idInv, a.nombreArticulo, i.estanteria
        FROM INVENTARIOS i
        JOIN DISPONIBILIDADES d ON i.idDispIn = d.idDisp
        JOIN ARTICULOS a ON d.idDisp = a.idADisp
        WHERE d.estado_disp = 'Perdido';
    RETURN rc;
  END;
-- CONSULTAR INVENTARIO DE UNA BIBLIOTECA
  FUNCTION CON_INV RETURN SYS_REFCURSOR IS
    rc SYS_REFCURSOR;
  BEGIN
    OPEN rc FOR
        SELECT eu.cantidadP, a.idArticulo, a.nombreArticulo
        FROM ESTADISTICAS_USO eu
        JOIN HISTORIALES_PRESTAMOS hp ON eu.idHistorialEU = hp.idHistorial
        JOIN ARTICULOS a ON hp.idArticuloHP = a.idArticulo
        ORDER BY eu.cantidadP DESC;
    RETURN rc;
  END;
END PC_INVENTARIOS;

--=============================================================================--

--CASO_USOS--
CREATE OR REPLACE PACKAGE BODY PC_CASOS_USO IS
-------------
PROCEDURE ADD_devol(idDevolucionx NUMBER, fechaDevx DATE, observacionesx VARCHAR, idHistorialDx NUMBER) IS
  BEGIN
    INSERT INTO DEVOLUCIONES (idDevolucion, fechaDev, observaciones, idHistorialD)
    VALUES (idDevolucionx, fechaDevx, observacionesx, idHistorialDx);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20037, 'Error al ADD_devolución: ' || SQLERRM);
  END;
-------------
  PROCEDURE MOD_devol(idDevolucionx NUMBER, observacionesx VARCHAR) IS
  BEGIN
    UPDATE DEVOLUCIONES
    SET observaciones = observacionesx
    WHERE idDevolucion = idDevolucionx;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20038, 'Error al MOD_devolución: ' || SQLERRM);
  END;
-------------
  FUNCTION CON_devol(idDevolucionx NUMBER) RETURN SYS_REFCURSOR IS
    rc SYS_REFCURSOR;
  BEGIN
    OPEN rc FOR SELECT * FROM DEVOLUCIONES WHERE idDevolucion = idDevolucionx;
    RETURN rc;
  END;
-------------
  PROCEDURE ADD_hist(idHistorialx NUMBER, idArticuloHPx NUMBER) IS
  BEGIN
    INSERT INTO HISTORIALES_PRESTAMOS (idHistorial, fechaP, idArticuloHP)
    VALUES (idHistorialx, SYSDATE, idArticuloHPx);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20039, 'Error al ADD_historial: ' || SQLERRM);
  END;
-------------
  PROCEDURE MOD_hist(idHistorialx NUMBER, idArticuloHPx NUMBER) IS
  BEGIN
    UPDATE HISTORIALES_PRESTAMOS
    SET idArticuloHP = idArticuloHPx
    WHERE idHistorial = idHistorialx;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20040, 'Error al MOD_historial: ' || SQLERRM);
  END;
-------------
  FUNCTION CON_hist(idHistorialx NUMBER) RETURN SYS_REFCURSOR IS
    rc SYS_REFCURSOR;
  BEGIN
    OPEN rc FOR SELECT * FROM HISTORIALES_PRESTAMOS WHERE idHistorial = idHistorialx;
    RETURN rc;
  END;
-------------
  PROCEDURE ADD_estad(idEux NUMBER, cantidadPx NUMBER, eRetrasadasx NUMBER,
            eTiempox NUMBER, dPendientesx NUMBER, idHistorialEux NUMBER, idBiblioEux NUMBER) IS
  BEGIN
    INSERT INTO ESTADISTICAS_USO (idEU, cantidadP, eRetrasadas, eTiempo, dPendientes, idHistorialEU, idBiblioEU)
    VALUES (idEux, cantidadPx, eRetrasadasx, eTiempox,dPendientesx, idHistorialEux, idBiblioEux);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20041, 'Error al ADD_estadística: ' || SQLERRM);
  END;
-------------
  PROCEDURE MOD_estad(idEux NUMBER, cantidadPx NUMBER, eRetrasadasx NUMBER, eTiempox NUMBER, dPendientesx NUMBER) IS
  BEGIN
    UPDATE ESTADISTICAS_USO
    SET cantidadP = cantidadPx,
        eRetrasadas = eRetrasadasx,
        eTiempo = eTiempox,
        dPendientes = dPendientesx
    WHERE idEU = idEux;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20042, 'Error al MOD_estadística: ' || SQLERRM);
  END;
-------------
  FUNCTION CON_estad(idEux NUMBER) RETURN SYS_REFCURSOR IS
    rc SYS_REFCURSOR;
  BEGIN
    OPEN rc FOR SELECT * FROM ESTADISTICAS_USO WHERE idEU = idEux;
    RETURN rc;
  END;
-------------
  PROCEDURE DEL_estad(idEux NUMBER) IS
  BEGIN
    DELETE FROM ESTADISTICAS_USO WHERE idEU = idEux;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20043, 'Error al DEL_estadística: ' || SQLERRM);
  END;
-- CONSULTAR ULTIMAS 5 DEVOLUCIONES
  FUNCTION CON_ULT_DEV RETURN SYS_REFCURSOR IS
    rc SYS_REFCURSOR;
  BEGIN
    OPEN rc FOR
        SELECT d.idDevolucion, d.fechaDev, a.nombreArticulo
        FROM DEVOLUCIONES d
        JOIN HISTORIALES_PRESTAMOS h ON d.idHistorialD = h.idHistorial
        JOIN ARTICULOS a ON h.idArticuloHP = a.idArticulo
        ORDER BY d.fechaDev DESC
        FETCH FIRST 5 ROWS ONLY;
    RETURN rc;
  END;
-- CONSULTAR LAS ESTADISTICAS GENERALES
  FUNCTION CON_EST RETURN SYS_REFCURSOR IS
    rc SYS_REFCURSOR;
  BEGIN
    OPEN rc FOR
      SELECT idBiblioEU,
             SUM(cantidadP) AS total_prestamos,
             SUM(eRetrasadas) AS total_retrasadas,
             SUM(eTiempo) AS total_tiempo,
             SUM(dPendientes) AS total_pendientes
      FROM ESTADISTICAS_USO
      GROUP BY idBiblioEU;
    RETURN rc;
  END;
END PC_CASOS_USO;