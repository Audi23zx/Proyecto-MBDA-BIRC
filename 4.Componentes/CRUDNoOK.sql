--SANCION--
BEGIN
  PC_SANCIONES.ADD_sanc(
    tiempoSx => '5',
    tipoSx => 'Retraso',
    fechaInSx => TO_DATE('2025-06-01', 'YYYY-MM-DD'),
    fechaFinSx => TO_DATE('2025-05-30', 'YYYY-MM-DD'));
END;

BEGIN
  PC_SANCIONES.MOD_sanc(
    idSancionx => 'M0003',
    tiempoSx => NULL);
END;

BEGIN
  PC_SANCIONES.ADD_bloq(
    razonBx => 'Robo de libros',
    duracionBx => '',
    fechaBx => TO_DATE('2025-06-01', 'YYYY-MM-DD'));
END;

BEGIN
  PC_SANCIONES.MOD_bloq(
    idBloqueox => 'B0008',
    razonBx => 'Robo',
    duracionBx => NULL);
END;

BEGIN
  PC_SANCIONES.ADD_multa(
    montoMx => -100,
    fechaMx => TO_DATE('2025-05-01', 'YYYY-MM-DD'),
    fechaPMx => TO_DATE('2025-04-30', 'YYYY-MM-DD'),
    estadoMx => 'Pendiente');
END;

BEGIN
  PC_SANCIONES.MOD_multa(
    idMultax => 'M0007',
    estadoMx => 'Pagada');
END;

--ARTICULO--
BEGIN
  PC_ARTICULOS.ADD_catem(
    idCatemx    => 102,
    categoriax  => NULL,
    temax       => 'Química',
    generox     => 'Académico');
END;

BEGIN
  PC_ARTICULOS.MOD_catem(
    idCatemx    => 1111222233,
    categoriax  => NULL);
END;

BEGIN
  PC_ARTICULOS.ADD_editor(
    idEditx    => 202,
    nombreEdx  => NULL,
    contactox  => 'editorial@null.com');
END;

BEGIN
  PC_ARTICULOS.MOD_editor(
    idEditx => NULL,
    sitWebx => XMLTYPE('<sitio_web>https://www.penguinrandomhouse.com</sitio_web>'));
END;

BEGIN
  PC_ARTICULOS.ADD_artic(
    idArticulox     => NULL,
    nombreArticulox => 'Libro Sin ID',
    autorx          => 'Autor Desconocido',
    fecha_pubx      => SYSDATE,
    estadoFisx      => 'Malo',
    num_ISBNx       => 1234567890,
    idiomax         => 'Español',
    idACatemx       => 101,
    idAEditx        => 201,
    idADispx        => 1);
END;

BEGIN
  PC_ARTICULOS.MOD_artic(
    idArticulox => 300002,
    estadoFisx  => 'Desgastado',
    costoAdqx   => 0,
    sinopsisx   => 'Sinopsis de prueba');
END;

--USUARIO--
BEGIN
  PC_USUARIOS.ADD_reserva(
    idReservax => NULL, 
    tiempoRx => 5, 
    canLibrosx => 2, 
    caractEntregax => 'Entrega rápida', 
    idDispRx => 102);
END;

BEGIN
  PC_USUARIOS.MOD_usser(
    idUsuariox => 1, 
    edadx => NULL, 
    idSusUsx => 202);
END;

BEGIN
  PC_USUARIOS.ADD_usser(
    idUsuariox => 2, 
    nombreUx => 'Ana', 
    apellidoUx => 'García', 
    tipoDocUx => 'DNI', 
    numDocUx => 87654321, 
    edadUx => -5, 
    idHistUx => 102, 
    idSusUsx => 202);
END;

BEGIN
  PC_USUARIOS.ADD_suscrip(
    idSusx => 3, 
    contactoSusx => 'ana@.com', 
    residenciaSusx => 'Av. Siempre Viva 742', 
    costoSusx => -100);
END;

--BIBLIOTECA--
BEGIN
  PC_BIBLIOTECAS.ADD_evento(
    idEventox => 2, 
    nombreEx => 'Conferencia', 
    fechax => TO_DATE('2025-01-30', 'YYYY-MM-DD'), 
    tematicax => 'Educación', 
    numAsistentesx => 50, 
    idBiblioEvx => 1);
END;

BEGIN
  PC_BIBLIOTECAS.MOD_biblio(
    idBibliox => 200001, 
    nombreBibliox => 'Biblioteca Norte', 
    ubicacionx => 'Av. Las Rosas', 
    cantEmpleadosx => NULL);
END;

BEGIN
  PC_BIBLIOTECAS.ADD_turno(
    idTurnox => 1, 
    tipoTurnox => NULL, 
    tareax => 'Atención al público', 
    horainiciox => '25:00', 
    horaFinx => '12:00');
END;

BEGIN
  PC_BIBLIOTECAS.MOD_turno(
    idTurnox => 50001, 
    tipoTurnox => 'Tarde', 
    tareax => 'Inventario', 
    horainiciox => '15:00', 
    horaFinx => '10:00');
END;

--INVENTARIO--
BEGIN
  PC_INVENTARIOS.ADD_disp(
    idDispx => 2, 
    estado_dispx => NULL);
END;

BEGIN
  PC_INVENTARIOS.MOD_disp(
    idDispx => 852959, 
    estado_dispx => 'bueno');
END;

BEGIN
  PC_INVENTARIOS.MOD_disp(
    idDispx => 1, 
    estado_dispx => NULL);
END;

BEGIN
  PC_INVENTARIOS.ADD_invent(
    idInvx => 2, 
    fechAgx => SYSDATE, 
    nombreAx => 'Diccionario', 
    cantidad_invx => -5, 
    condicion_invx => 'Nuevo', 
    estanteriax => 'A3', 
    idBiblioInx => 1, 
    idDispinx => 1, 
    accesox => 'Accreso restringido');
END;

--CASOS DE USO--
BEGIN
  PC_CASOS_USO.ADD_devol(
    idDevolucionx => NULL, 
    fechaDevx => SYSDATE, 
    observacionesx => 'Intento de ingreso sin ID', 
    idHistorialDx => 1);
END;

BEGIN
  PC_CASOS_USO.MOD_devol(
    idDevolucionx => 10, 
    observacionesx => NULL);
END;

BEGIN
  PC_CASOS_USO.ADD_hist(
    idHistorialx => 202, 
    idArticuloHPx => 9999);
END;

BEGIN
  PC_CASOS_USO.MOD_hist(
    idHistorialx => 101, 
    idArticuloHPx => 3003);
END;

BEGIN
  PC_CASOS_USO.ADD_estad(
    idEux => 302, 
    cantidadPx => -10, 
    eRetrasadasx => 3, 
    eTiempox => 5, 
    dPendientesx => 0, 
    idHistorialEux => 201, 
    idBiblioEux => 4001);
END;

BEGIN
  PC_CASOS_USO.MOD_estad(
    idEux => 10, 
    cantidadPx => 90, 
    eRetrasadasx => NULL, 
    eTiempox => -5, 
    dPendientesx => 1);
END;