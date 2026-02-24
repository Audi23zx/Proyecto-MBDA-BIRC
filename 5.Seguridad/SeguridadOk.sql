EXECUTE PC_GESTOR_PENALIZACION.ADD_sanc('10','Retraso',TO_DATE('2025-05-01', 'YYYY-MM-DD'),TO_DATE('2025-05-11', 'YYYY-MM-DD'));

EXECUTE PC_GESTOR_PENALIZACION.MOD_sanc('M0010',25);

DECLARE
  rc SYS_REFCURSOR;
  v_idSancion  VARCHAR2(5);
  v_tiempoS    NUMBER(3);
  v_tipoS      VARCHAR2(25);
  v_fechaInS   DATE;
  v_fechaFinS  DATE;
BEGIN
  rc := PC_GESTOR_PENALIZACION.CON_sanc('M0010');
  LOOP
    FETCH rc INTO v_idSancion, v_tiempoS, v_tipoS, v_fechaInS, v_fechaFinS;
    EXIT WHEN rc%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('ID: ' || v_idSancion || ', Tiempo: ' || v_tiempoS || ', Tipo: ' || v_tipoS || 
                         ', Inicio: ' || TO_CHAR(v_fechaInS, 'YYYY-MM-DD') || ', Fin: ' || TO_CHAR(v_fechaFinS, 'YYYY-MM-DD'));
  END LOOP;
  CLOSE rc;
END;

EXECUTE PC_GESTOR_PENALIZACION.DEL_sanc('M0010');

EXECUTE PC_GESTOR_PENALIZACION.ADD_bloq('entrega del libro con mas de 7 dias de retraso','7',TO_DATE('2025-05-17', 'YYYY-MM-DD'));

EXECUTE PC_GESTOR_PENALIZACION.MOD_bloq('B0010','se encontraron mas libros no devueltos por el usuario','30');

DECLARE
  rc SYS_REFCURSOR;
  v_idBloqueo  VARCHAR2(5);
  v_razonB     VARCHAR2(250);
  v_duracionB  VARCHAR2(10);
  v_fechB      DATE;
BEGIN
  rc := PC_GESTOR_PENALIZACION.CON_bloq('B0010');
  LOOP
    FETCH rc INTO v_idBloqueo, v_razonB, v_duracionB, v_fechB;
    EXIT WHEN rc%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('ID: ' || v_idBloqueo || ', Razón: ' || v_razonB || ', Duración: ' || v_duracionB ||
                         ', Fecha: ' || TO_CHAR(v_fechB, 'YYYY-MM-DD'));
  END LOOP;
  CLOSE rc;
END;

INSERT INTO SANCIONES (idSancion, tiempoS, tipoS, fechaInS, fechaFinS)
VALUES ('M0003', 10, 'Libro Dañado', TO_DATE('2025-02-20', 'YYYY-MM-DD'), TO_DATE('2025-03-02', 'YYYY-MM-DD'));

EXECUTE PC_GESTOR_PENALIZACION.ADD_multa(5000, TO_DATE('2025-05-10', 'YYYY-MM-DD'),TO_DATE('2025-05-25', 'YYYY-MM-DD'),'Pendiente');

EXECUTE PC_GESTOR_PENALIZACION.MOD_multa('B0005','Pagado');

DECLARE
  rc SYS_REFCURSOR;
  v_idMulta   VARCHAR2(5);
  v_montoM    NUMBER(6);
  v_fechaM    DATE;
  v_fechaPM   DATE;
  v_estadoM   VARCHAR2(10);
BEGIN
  rc := PC_GESTOR_PENALIZACION.CON_multa('B0005');
  LOOP
    FETCH rc INTO v_idMulta, v_montoM, v_fechaM, v_fechaPM, v_estadoM;
    EXIT WHEN rc%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('ID: ' || v_idMulta || ', Monto: ' || v_montoM || ', Fecha Multa: ' || TO_CHAR(v_fechaM, 'YYYY-MM-DD') ||
                         ', Fecha Pago: ' || TO_CHAR(v_fechaPM, 'YYYY-MM-DD') || ', Estado: ' || v_estadoM);
  END LOOP;
  CLOSE rc;
END;

DECLARE
  rc SYS_REFCURSOR;
  v_idMulta    VARCHAR2(5);
  v_fechaM     DATE;
  v_montoM     NUMBER(6);
  v_idUsuario  NUMBER(10);
  v_nombreU    VARCHAR2(15);
  v_apellidoU  VARCHAR2(15);
BEGIN
  rc := PC_AUXILIAR_ORGANIZACION.CON_NO_PAG;
  LOOP
    FETCH rc INTO v_idMulta, v_fechaM, v_montoM, v_idUsuario, v_nombreU, v_apellidoU;
    EXIT WHEN rc%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Multa: ' || v_idMulta || ', Fecha: ' || TO_CHAR(v_fechaM, 'YYYY-MM-DD') || 
                         ', Monto: ' || v_montoM || ', Usuario: ' || v_idUsuario || ' - ' || v_nombreU || ' ' || v_apellidoU);
  END LOOP;
  CLOSE rc;
END;

EXECUTE PC_BIBLIOTECARIO_REGISTRO.ADD_catem(205,'Ciencia','Física','Académico');

EXECUTE PC_BIBLIOTECARIO_REGISTRO.MOD_catem(205,'Ciencia Moderna');

DECLARE
  rc SYS_REFCURSOR;
  v_id NUMBER;
  v_cat VARCHAR2(50);
  v_tema VARCHAR2(50);
  v_genero VARCHAR2(50);
BEGIN
  rc := PC_BIBLIOTECARIO_REGISTRO.CON_catem(205);
  LOOP
    FETCH rc INTO v_id, v_cat, v_tema, v_genero;
    EXIT WHEN rc%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ', Categoría: ' || v_cat || ', Tema: ' || v_tema || ', Género: ' || v_genero);
  END LOOP;
  CLOSE rc;
END;

EXECUTE PC_BIBLIOTECARIO_REGISTRO.ADD_editor(501,'Jupiter','+57 20 7010 200');

EXECUTE PC_BIBLIOTECARIO_REGISTRO.MOD_editor(501, XMLTYPE('<sitio_web>https://www.amen.com</sitio_web>'));

DECLARE
  rc SYS_REFCURSOR;
  v_id NUMBER;
  v_nombre VARCHAR2(50);
  v_contacto VARCHAR2(100);
BEGIN
  rc := PC_BIBLIOTECARIO_REGISTRO.CON_editor(501);
  LOOP
    FETCH rc INTO v_id, v_nombre, v_contacto;
    EXIT WHEN rc%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ', Nombre: ' || v_nombre || ', Contacto: ' || v_contacto);
  END LOOP;
  CLOSE rc;
END;

EXECUTE PC_ARCHIVADOR_GENERAL.ADD_artic(1010, 'Cien Años de Soledad', 'Gabriel García Márquez', TO_DATE('1982-05-01', 'YYYY-MM-DD'), 'Buen Estado', 9788497592208, 'Español', 101, 201, 852959);

EXECUTE PC_ARCHIVADOR_GENERAL.MOD_artic(1010, 'Condicion Regular', 1200, 'Novela emblemática del realismo mágico');

DECLARE
  rc SYS_REFCURSOR;
  v_idArticulo      NUMBER;
  v_nombreArticulo  VARCHAR2(100);
  v_autor           VARCHAR2(100);
  v_fecha_pub       DATE;
  v_estadoFis       VARCHAR2(20);
  v_extension       NUMBER;
  v_num_ISBN        NUMBER;
  v_idioma          VARCHAR2(50);
  v_sinopsis        VARCHAR2(4000);
  v_costoAdq        NUMBER;
  v_idACatem        NUMBER;
  v_idAEdit         NUMBER;
  v_idADisp         NUMBER;
BEGIN
  rc := PC_ARCHIVADOR_GENERAL.CON_artic(1010);
  LOOP
    FETCH rc INTO v_idArticulo, v_nombreArticulo, v_autor, v_fecha_pub, v_estadoFis,
                  v_extension, v_num_ISBN, v_idioma, v_sinopsis, v_costoAdq,
                  v_idACatem, v_idAEdit, v_idADisp;
    EXIT WHEN rc%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_idArticulo || ' - ' || v_nombreArticulo || ' - ' || v_autor);
  END LOOP;
  CLOSE rc;
END;

EXECUTE PC_ARCHIVADOR_GENERAL.DEL_artic(1010);

DECLARE
  rc SYS_REFCURSOR;
  v_categoria       VARCHAR2(50);
  v_idArticulo      NUMBER;
  v_nombreArticulo  VARCHAR2(100);
  v_autor           VARCHAR2(100);
BEGIN
  rc := PC_TRABAJADOR.CON_INFO_CATEG;
  LOOP
    FETCH rc INTO v_categoria, v_idArticulo, v_nombreArticulo, v_autor;
    EXIT WHEN rc%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Categoría: ' || v_categoria || ', Artículo: ' || v_nombreArticulo || ', Autor: ' || v_autor);
  END LOOP;
  CLOSE rc;
END;

DECLARE
  rc SYS_REFCURSOR;
  v_idArticulo        NUMBER;
  v_estado_disp       VARCHAR2(20);
  v_titulo            VARCHAR2(100);
  v_autor             VARCHAR2(100);
  v_ultima_devolucion DATE;
BEGIN
  rc := PC_ARCHIVADOR_JEFE.CON_ART_EST;
  LOOP
    FETCH rc INTO v_idArticulo, v_estado_disp, v_titulo, v_autor, v_ultima_devolucion;
    EXIT WHEN rc%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('ID: ' || v_idArticulo || ', Título: ' || v_titulo || ', Autor: ' || v_autor || ', Estado: ' || v_estado_disp || 
    ', Últ. Devolución: ' || TO_CHAR(v_ultima_devolucion, 'YYYY-MM-DD'));
  END LOOP;
  CLOSE rc;
END;

DECLARE
  rc SYS_REFCURSOR;
  v_idCatem      NUMBER;
  v_categoria    VARCHAR2(50);
  v_num_reservas NUMBER;
BEGIN
  rc := PC_ANIMADOR_PUBLICO.CON_CAT_PREF;
  LOOP
    FETCH rc INTO v_idCatem, v_categoria, v_num_reservas;
    EXIT WHEN rc%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('ID Categoría: ' || v_idCatem || ', Nombre: ' || v_categoria || ', Nº Reservas: ' || v_num_reservas);
  END LOOP;
  CLOSE rc;
END;

EXECUTE PC_GESTOR_MEMBRESIA.ADD_reserva(5, 7, 3, 'Entrega en persona', 852959);

EXECUTE PC_GESTOR_MEMBRESIA.MOD_reserva(5, 10, 5);

DECLARE
  c SYS_REFCURSOR;
  idReserva NUMBER;
  tiempoR NUMBER;
  cantLibros NUMBER;
  caractEntrega VARCHAR2(50);
  idDispR NUMBER;
BEGIN
  c := PC_GESTOR_MEMBRESIA.CON_reserva(5);
  LOOP
    FETCH c INTO idReserva, tiempoR, cantLibros, caractEntrega, idDispR;
    EXIT WHEN c%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Reserva ID: ' || idReserva || ', Tiempo: ' || tiempoR || ', Libros: ' || cantLibros || 
    ', Entrega: ' || caractEntrega || ', Dispositivo: ' || idDispR);
  END LOOP;
  CLOSE c;
END;

EXECUTE PC_GESTOR_MEMBRESIA.ADD_usser(222, 'Juan', 'Pérez', 'Cedula Ciudadanía', 12345678, 25, 107, 210);

EXECUTE PC_GESTOR_MEMBRESIA.MOD_usser(222, 30, 206);

EXECUTE PC_GESTOR_MEMBRESIA.DEL_usser(222);

EXECUTE PC_ORGANIZADOR_JEFE.ADD_evento(10, 'Feria del Libro', TO_DATE('2025-06-15', 'YYYY-MM-DD'), 'Festividad', 100, NULL);

EXECUTE PC_ORGANIZADOR_JEFE.MOD_evento(10, 'Taller de León', 'Conmemoración', 50, 'Fomentar la escritura');

EXECUTE PC_ORGANIZADOR_JEFE.ADD_biblio(10101, 'Biblioteca Pop', 'Av. Principal 100', '123456789', 15, 'Edificio Moderno');

EXECUTE PC_ORGANIZADOR_JEFE.MOD_biblio(10101, 'Biblioteca Nueva', 'Calle Secundaria 45', 20);

EXECUTE PC_CONTRATISTA.ADD_trabaj(15, 'Carlos', 'Lopez', 30, '987654321', 'Cedula Ciudadanía', 1234567890, 'Soltero', NULL);

ALTER TABLE DISPONIBILIDADES DROP CONSTRAINT CK_DISP_ESTADO;

ALTER TABLE DISPONIBILIDADES
ADD CONSTRAINT CK_DISP_ESTADO
CHECK (estado_disp IN ('Disponible', 'Prestado', 'Reservado', 'Retirado/daño', 'Perdido','probado','probado2','pro3','pro4'));

EXECUTE PC_BIBLIOTECARIO_REGISTRO.ADD_disp(2, 'pro3');

EXECUTE PC_BIBLIOTECARIO_REGISTRO.MOD_disp(2, 'pro4');

DECLARE
  rc SYS_REFCURSOR;
  v_id NUMBER;
  v_estado VARCHAR2(50);
BEGIN
  rc := PC_BIBLIOTECARIO_REGISTRO.CON_disp(2);
  LOOP
    FETCH rc INTO v_id, v_estado;
    EXIT WHEN rc%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ' - Estado: ' || v_estado);
  END LOOP;
  CLOSE rc;
END;

EXECUTE PC_ARCHIVADOR_GENERAL.ADD_invent(8, SYSDATE, 'Enciclopedia', 10, 'publico', 'H1-415', 200001, 1, 'Acceso total');

EXECUTE PC_ARCHIVADOR_GENERAL.MOD_invent(4, 8, 'publico', 'B2', 'Acceso restringido');

EXECUTE PC_ARCHIVADOR_GENERAL.DEL_invent(4);

EXECUTE PC_BIBLIOTECARIO_REGISTRO.ADD_devol(301, SYSDATE, 'Artículo devuelto sin daños', 105);

EXECUTE PC_BIBLIOTECARIO_REGISTRO.MOD_devol(301, 'Artículo revisado y en buen estado');

DECLARE
  rc SYS_REFCURSOR;
  v_id NUMBER;
  v_fecha DATE;
  v_observaciones VARCHAR2(255);
  v_id_historial NUMBER;
BEGIN
  rc := PC_BIBLIOTECARIO_REGISTRO.CON_devol(idDevolucionx => 301);
  LOOP
    FETCH rc INTO v_id, v_fecha, v_observaciones, v_id_historial;
    EXIT WHEN rc%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ' - Fecha: ' || v_fecha || ' - Observaciones: ' || v_observaciones || ' - ID Historial: ' || v_id_historial);
  END LOOP;
  CLOSE rc;
END;

EXECUTE PC_GESTOR_MEMBRESIA.ADD_hist(605, 300005);

EXECUTE PC_GESTOR_MEMBRESIA.MOD_hist(605, 300001);

DECLARE
  rc SYS_REFCURSOR;
  v_id NUMBER;
  v_fecha DATE;
  v_id_articulo NUMBER;
BEGIN
  rc := PC_GESTOR_MEMBRESIA.CON_hist(idHistorialx => 605);
  LOOP
    FETCH rc INTO v_id, v_fecha, v_id_articulo;
    EXIT WHEN rc%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ' - Fecha: ' || v_fecha || ' - ID Artículo: ' || v_id_articulo);
  END LOOP;
  CLOSE rc;
END;

EXECUTE PC_ARCHIVADOR_GENERAL.ADD_estad(100, 100, 5, 10, 2, 105, 200003);

EXECUTE PC_ARCHIVADOR_GENERAL.MOD_estad(100, 120, 3, 8, 1);

EXECUTE PC_ARCHIVADOR_GENERAL.DEL_estad(100);

DECLARE
  rc SYS_REFCURSOR;
  v_id NUMBER;
  v_cantidad NUMBER;
  v_retrasadas NUMBER;
  v_tiempo NUMBER;
  v_pendientes NUMBER;
  v_id_historial NUMBER;
  v_id_biblioteca NUMBER;
BEGIN
  rc := PC_ARCHIVADOR_GENERAL.CON_estad(idEux => 100);
  LOOP
    FETCH rc INTO v_id, v_cantidad, v_retrasadas, v_tiempo, v_pendientes, v_id_historial, v_id_biblioteca;
    EXIT WHEN rc%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ' - Cantidad: ' || v_cantidad || ' - Retrasadas: ' || v_retrasadas || ' - Tiempo: ' || v_tiempo || ' - Pendientes: ' || v_pendientes || ' - ID Historial: ' || v_id_historial || ' - ID Biblioteca: ' || v_id_biblioteca);
  END LOOP;
  CLOSE rc;
END;
