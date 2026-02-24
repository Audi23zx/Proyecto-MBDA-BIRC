--SANCION--
BEGIN
  PC_SANCIONES.ADD_sanc(
    tiempoSx    => '10',
    tipoSx      => 'Retraso',
    fechaInSx   => TO_DATE('2025-05-01', 'YYYY-MM-DD'),
    fechaFinSx  => TO_DATE('2025-05-11', 'YYYY-MM-DD'));
END;

BEGIN
  PC_SANCIONES.MOD_sanc(
    idSancionx => 'M0001',
    tiempoSx   => 15);
END;

DECLARE
  rc SYS_REFCURSOR;
  v_idSancion  VARCHAR2(5);
  v_tiempoS    NUMBER(3);
  v_tipoS      VARCHAR2(25);
  v_fechaInS   DATE;
  v_fechaFinS  DATE;
BEGIN
  rc := PC_SANCIONES.CON_sanc('M0001');
  LOOP
    FETCH rc INTO v_idSancion, v_tiempoS, v_tipoS, v_fechaInS, v_fechaFinS;
    EXIT WHEN rc%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('ID: ' || v_idSancion || ', Tiempo: ' || v_tiempoS || ', Tipo: ' || v_tipoS || 
                         ', Inicio: ' || TO_CHAR(v_fechaInS, 'YYYY-MM-DD') || ', Fin: ' || TO_CHAR(v_fechaFinS, 'YYYY-MM-DD'));
  END LOOP;
  CLOSE rc;
END;

BEGIN
  PC_SANCIONES.DEL_sanc('M0001');
END;

BEGIN
  PC_SANCIONES.ADD_bloq(
    razonBx    => 'entrega del libro con mas de 7 dias de retraso',
    duracionBx => '7',
    fechaBx    => TO_DATE('2025-05-17', 'YYYY-MM-DD'));
END;

BEGIN
  PC_SANCIONES.MOD_bloq(
    idBloqueox => 'M0009',
    razonBx    => 'se encontraron mas libros no devueltos por el usuario',
    duracionBx => '30');
END;

DECLARE
  rc SYS_REFCURSOR;
  v_idBloqueo  VARCHAR2(5);
  v_razonB     VARCHAR2(250);
  v_duracionB  VARCHAR2(10);
  v_fechB      DATE;
BEGIN
  rc := PC_SANCIONES.CON_bloq('B0010');
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

BEGIN
  PC_SANCIONES.ADD_multa(
    montoMx    => 5000,
    fechaMx    => TO_DATE('2025-05-10', 'YYYY-MM-DD'),
    fechaPMx   => TO_DATE('2025-05-25', 'YYYY-MM-DD'),
    estadoMx   => 'Pendiente');
END;

BEGIN
  PC_SANCIONES.MOD_multa(
    idMultax => 'M0003',
    estadoMx => 'Pagado');
END;

DECLARE
  rc SYS_REFCURSOR;
  v_idMulta   VARCHAR2(5);
  v_montoM    NUMBER(6);
  v_fechaM    DATE;
  v_fechaPM   DATE;
  v_estadoM   VARCHAR2(10);
BEGIN
  rc := PC_SANCIONES.CON_multa('M0005');
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
  rc := PC_SANCIONES.CON_NO_PAG;
  LOOP
    FETCH rc INTO v_idMulta, v_fechaM, v_montoM, v_idUsuario, v_nombreU, v_apellidoU;
    EXIT WHEN rc%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Multa: ' || v_idMulta || ', Fecha: ' || TO_CHAR(v_fechaM, 'YYYY-MM-DD') || 
                         ', Monto: ' || v_montoM || ', Usuario: ' || v_idUsuario || ' - ' || v_nombreU || ' ' || v_apellidoU);
  END LOOP;
  CLOSE rc;
END;

--ARTICULO--
BEGIN
  PC_ARTICULOS.ADD_catem(
    idCatemx    => 101,
    categoriax  => 'Ciencia',
    temax       => 'Física',
    generox     => 'Académico');
END;

BEGIN
  PC_ARTICULOS.MOD_catem(
    idCatemx    => 101,
    categoriax  => 'Ciencia Moderna');
END;

DECLARE
  rc SYS_REFCURSOR;
  v_id NUMBER;
  v_cat VARCHAR2(50);
  v_tema VARCHAR2(50);
  v_genero VARCHAR2(50);
BEGIN
  rc := PC_ARTICULOS.CON_catem(101);
  LOOP
    FETCH rc INTO v_id, v_cat, v_tema, v_genero;
    EXIT WHEN rc%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ', Categoría: ' || v_cat || ', Tema: ' || v_tema || ', Género: ' || v_genero);
  END LOOP;
  CLOSE rc;
END;

BEGIN
  PC_ARTICULOS.ADD_editor(
    idEditx    => 201,
    nombreEdx  => 'Marte',
    contactox  => '+57 20 7010 200');
END;

BEGIN
  PC_ARTICULOS.MOD_editor(
    idEditx => 201,
    sitWebx => XMLTYPE('<sitio_web>https://www.marte.com</sitio_web>'));
END;

DECLARE
  rc SYS_REFCURSOR;
  v_id NUMBER;
  v_nombre VARCHAR2(50);
  v_contacto VARCHAR2(100);
BEGIN
  rc := PC_ARTICULOS.CON_editor(201);
  LOOP
    FETCH rc INTO v_id, v_nombre, v_contacto;
    EXIT WHEN rc%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ', Nombre: ' || v_nombre || ', Contacto: ' || v_contacto);
  END LOOP;
  CLOSE rc;
END;

BEGIN
  PC_ARTICULOS.ADD_artic(
    idArticulox     => 3001,
    nombreArticulox => 'Cien Años de Soledad',
    autorx          => 'Gabriel García Márquez',
    fecha_pubx      => TO_DATE('1982-05-01', 'YYYY-MM-DD'),
    estadoFisx      => 'Buen Estado',
    num_ISBNx       => 9788497592208,
    idiomax         => 'Español',
    idACatemx       => 101,
    idAEditx        => 201,
    idADispx        => 852959);
END;

BEGIN
  PC_ARTICULOS.MOD_artic(
    idArticulox => 3001,
    estadoFisx  => 'Condicion Regular',
    costoAdqx   => 1200,
    sinopsisx   => 'Novela emblemática del realismo mágico');
END;

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
  rc := PC_ARTICULOS.CON_artic(3001);
  LOOP
    FETCH rc INTO v_idArticulo, v_nombreArticulo, v_autor, v_fecha_pub, v_estadoFis,
                  v_extension, v_num_ISBN, v_idioma, v_sinopsis, v_costoAdq,
                  v_idACatem, v_idAEdit, v_idADisp;
    EXIT WHEN rc%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_idArticulo || ' - ' || v_nombreArticulo || ' - ' || v_autor);
  END LOOP;
  CLOSE rc;
END;

BEGIN
  PC_ARTICULOS.DEL_artic(3001);
END;

DECLARE
  rc SYS_REFCURSOR;
  v_categoria       VARCHAR2(50);
  v_idArticulo      NUMBER;
  v_nombreArticulo  VARCHAR2(100);
  v_autor           VARCHAR2(100);
BEGIN
  rc := PC_ARTICULOS.CON_INFO_CATEG;
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
  rc := PC_ARTICULOS.CON_ART_EST;
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
  rc := PC_ARTICULOS.CON_CAT_PREF;
  LOOP
    FETCH rc INTO v_idCatem, v_categoria, v_num_reservas;
    EXIT WHEN rc%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('ID Categoría: ' || v_idCatem || ', Nombre: ' || v_categoria || ', Nº Reservas: ' || v_num_reservas);
  END LOOP;
  CLOSE rc;
END;

--USUARIO--
BEGIN
  PC_USUARIOS.ADD_reserva(
    idReservax => 1, 
    tiempoRx => 7, 
    canLibrosx => 3, 
    caractEntregax => 'Entrega en persona', 
    idDispRx => 852959);
END;

BEGIN
  PC_USUARIOS.MOD_reserva(
    idReservax => 1, 
    tiempoRx => 10, 
    canLibrosx => 5);
END;

DECLARE
  c SYS_REFCURSOR;
  idReserva NUMBER;
  tiempoR NUMBER;
  cantLibros NUMBER;
  caractEntrega VARCHAR2(50);
  idDispR NUMBER;
BEGIN
  c := PC_USUARIOS.CON_reserva(1);
  LOOP
    FETCH c INTO idReserva, tiempoR, cantLibros, caractEntrega, idDispR;
    EXIT WHEN c%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Reserva ID: ' || idReserva || ', Tiempo: ' || tiempoR || ', Libros: ' || cantLibros || 
    ', Entrega: ' || caractEntrega || ', Dispositivo: ' || idDispR);
  END LOOP;
  CLOSE c;
END;

BEGIN
  PC_USUARIOS.ADD_usser(
    idUsuariox => 111, 
    nombreUx => 'Juan', 
    apellidoUx => 'Pérez', 
    tipoDocUx => 'Cedula Ciudadanía', 
    numDocUx => 12345678, 
    edadUx => 25, 
    idHistUx => 107, 
    idSusUsx => 210);
END;

BEGIN
  PC_USUARIOS.MOD_usser(
    idUsuariox => 111, 
    edadx => 30, 
    idSusUsx => 206);
END;

BEGIN
  PC_USUARIOS.DEL_usser(111);
END;

--BIBLIOTECA--
BEGIN
  PC_BIBLIOTECAS.ADD_evento(
    idEventox => 1, 
    nombreEx => 'Feria del Libro', 
    fechax => TO_DATE('2025-06-15', 'YYYY-MM-DD'), 
    tematicax => 'Festividad', 
    numAsistentesx => 100, 
    idBiblioEvx => NULL);
END;

BEGIN
  PC_BIBLIOTECAS.MOD_evento(
    idEventox => 1, 
    nombreEx => 'Taller de Escritura', 
    tematicax => 'Conmemoración', 
    numAsistentesx => 50, 
    objetivox => 'Fomentar la escritura');
END;

BEGIN
  PC_BIBLIOTECAS.ADD_biblio(
    idBibliox => 101, 
    nombreBibliox => 'Biblioteca Horn', 
    ubicacionx => 'Av. Principal 100', 
    contactox => '123456789', 
    cantEmpleadosx => 15, 
    instalacionx => 'Edificio Moderno');
END;

BEGIN
  PC_BIBLIOTECAS.MOD_biblio(
    idBibliox => 1, 
    nombreBibliox => 'Biblioteca Nueva', 
    ubicacionx => 'Calle Secundaria 45', 
    cantEmpleadosx => 20);
END;

BEGIN
  PC_BIBLIOTECAS.ADD_trabaj(
    idTrabx => 1, 
    nombreTrx => 'Carlos', 
    apellidoTrx => 'Lopez', 
    edadx => 30, 
    contactoTrx => '987654321', 
    tipoDocx => 'Cedula Ciudadanía', 
    numDocx => 10203040, 
    estadoCivilx => 'Soltero', 
    idBiblioTx => NULL);
END;

--INVENTARIO--
-------------------------------------
ALTER TABLE DISPONIBILIDADES 
DROP CONSTRAINT CK_DISP_ESTADO;

ALTER TABLE DISPONIBILIDADES
ADD CONSTRAINT CK_DISP_ESTADO
CHECK (estado_disp IN ('Disponible', 'Prestado', 'Reservado', 'Retirado/daño', 'Perdido','probado','probado2'));
-----------------------------
BEGIN
  PC_INVENTARIOS.ADD_disp(
    idDispx => 1, 
    estado_dispx => 'probado');
END;

BEGIN
  PC_INVENTARIOS.MOD_disp(
    idDispx => 1, 
    estado_dispx => 'probado2');
END;

DECLARE
  rc SYS_REFCURSOR;
  v_id NUMBER;
  v_estado VARCHAR2(50);
BEGIN
  rc := PC_INVENTARIOS.CON_disp(1);
  LOOP
    FETCH rc INTO v_id, v_estado;
    EXIT WHEN rc%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ' - Estado: ' || v_estado);
  END LOOP;
  CLOSE rc;
END;

BEGIN
  PC_INVENTARIOS.ADD_invent(
    idInvx => 1, 
    fechAgx => SYSDATE, 
    nombreAx => 'Enciclopedia', 
    cantidad_invx => 10, 
    condicion_invx => 'publico', 
    estanteriax => 'H1-415', 
    idBiblioInx => 200001, 
    idDispinx => 1, 
    accesox => 'Acceso total');
END;

BEGIN
  PC_INVENTARIOS.MOD_invent(
    idInvx => 1, 
    cantidad_invx => 8, 
    condicion_invx => 'publico', 
    estanteriax => 'B2', 
    accesox => 'Acceso restringido');
END;

BEGIN
  PC_INVENTARIOS.DEL_invent(1);
END;

--CASOD DE USO--
BEGIN
  PC_CASOS_USO.ADD_devol(
    idDevolucionx => 101, 
    fechaDevx => SYSDATE, 
    observacionesx => 'Artículo devuelto sin daños', 
    idHistorialDx => 105);
END;

BEGIN
  PC_CASOS_USO.MOD_devol(
    idDevolucionx => 101, 
    observacionesx => 'Artículo revisado y en buen estado');
END;

DECLARE
  rc SYS_REFCURSOR;
  v_id NUMBER;
  v_fecha DATE;
  v_observaciones VARCHAR2(255);
  v_id_historial NUMBER;
BEGIN
  rc := PC_CASOS_USO.CON_devol(idDevolucionx => 101);
  LOOP
    FETCH rc INTO v_id, v_fecha, v_observaciones, v_id_historial;
    EXIT WHEN rc%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ' - Fecha: ' || v_fecha || ' - Observaciones: ' || v_observaciones || ' - ID Historial: ' || v_id_historial);
  END LOOP;
  CLOSE rc;
END;

BEGIN
  PC_CASOS_USO.ADD_hist(
    idHistorialx => 201, 
    idArticuloHPx => 300005);
END;

BEGIN
  PC_CASOS_USO.MOD_hist(
    idHistorialx => 201, 
    idArticuloHPx => 300001);
END;

DECLARE
  rc SYS_REFCURSOR;
  v_id NUMBER;
  v_fecha DATE;
  v_id_articulo NUMBER;
BEGIN
  rc := PC_CASOS_USO.CON_hist(idHistorialx => 201);
  LOOP
    FETCH rc INTO v_id, v_fecha, v_id_articulo;
    EXIT WHEN rc%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ' - Fecha: ' || v_fecha || ' - ID Artículo: ' || v_id_articulo);
  END LOOP;
  CLOSE rc;
END;

BEGIN
  PC_CASOS_USO.ADD_estad(
    idEux => 301, 
    cantidadPx => 100, 
    eRetrasadasx => 5, 
    eTiempox => 10, 
    dPendientesx => 2, 
    idHistorialEux => 105, 
    idBiblioEux => 200003);
END;

BEGIN
  PC_CASOS_USO.MOD_estad(
    idEux => 301, 
    cantidadPx => 120, 
    eRetrasadasx => 3, 
    eTiempox => 8, 
    dPendientesx => 1);
END;

BEGIN
  PC_CASOS_USO.DEL_estad(
    idEux => 301);
END;

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
  rc := PC_CASOS_USO.CON_estad(idEux => 301);
  LOOP
    FETCH rc INTO v_id, v_cantidad, v_retrasadas, v_tiempo, v_pendientes, v_id_historial, v_id_biblioteca;
    EXIT WHEN rc%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ' - Cantidad: ' || v_cantidad || ' - Retrasadas: ' || v_retrasadas || ' - Tiempo: ' || v_tiempo || ' - Pendientes: ' || v_pendientes || ' - ID Historial: ' || v_id_historial || ' - ID Biblioteca: ' || v_id_biblioteca);
  END LOOP;
  CLOSE rc;
END;