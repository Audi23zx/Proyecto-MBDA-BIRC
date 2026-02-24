--Creación de las tablas
--Articulos--
CREATE TABLE ARTICULOS (
    idArticulo      NUMBER(10)  NOT NULL,
    nombreArticulo  VARCHAR(50) NOT NULL,
    autor           VARCHAR(25) NOT NULL,
    fecha_pub       DATE        NOT NULL,
    estadoFis       VARCHAR(20) NOT NULL,
    extension       NUMBER(4)   NOT NULL,
    num_ISBN        NUMBER(13)  NOT NULL,
    idioma          VARCHAR(10) NOT NULL,
    sinopsis        VARCHAR(250),
    costoAdq        NUMBER(10)  NOT NULL,
    idACatem        NUMBER(10)  NOT NULL,
    idAEdit         NUMBER(10)  NOT NULL,
    idADisp         NUMBER(10)  NOT NULL
);

CREATE TABLE CATEGORIAS_TEMAS (
    idCatem         NUMBER(10)  NOT NULL,
    categoria       VARCHAR(15) NOT NULL,
    tema            VARCHAR(30) NOT NULL,
    genero          VARCHAR(20) NOT NULL
);

CREATE TABLE EDITORIALES (
    idEdit          NUMBER(10)  NOT NULL,
    nombreEd        VARCHAR(20) NOT NULL,
    contacto        VARCHAR(15) NOT NULL,
    sitWeb          XMLTYPE
);

--Inventarios--
CREATE TABLE DISPONIBILIDADES (
    idDisp          NUMBER(10)  NOT NULL,
    estado_disp     VARCHAR(15) NOT NULL
);

CREATE TABLE INVENTARIOS (
    idInv           NUMBER(10)  NOT NULL,
    fechAg          DATE        NOT NULL,
    nombreA         VARCHAR(30) NOT NULL,
    cantidad_inv    NUMBER(3)   NOT NULL,
    condicion_inv   VARCHAR(20) NOT NULL,
    estanteria      VARCHAR(6)  NOT NULL,
    acceso          VARCHAR(20),
    idBiblioIn      NUMBER(10)  NOT NULL,
    idDispIn        NUMBER(10)  NOT NULL
);

--Bibliotecas--
CREATE TABLE BIBLIOTECAS (
    idBiblio        NUMBER(10)  NOT NULL,
    nombreBiblio    VARCHAR(50) NOT NULL,
    ubicacion       VARCHAR(30) NOT NULL,
    contactoB       VARCHAR(20) NOT NULL,
    cantEmpleado    NUMBER(2)   NOT NULL,
    horaApert       VARCHAR(10) NOT NULL,
    horaCierre      VARCHAR(10) NOT NULL,
    instalacion     VARCHAR(30) NOT NULL
);

CREATE TABLE EVENTOS (
    idEvento        NUMBER(10)  NOT NULL,
    nombreE         VARCHAR(20) NOT NULL,
    fecha           DATE        NOT NULL,
    numAsistentes   NUMBER(4)   NOT NULL,
    tematica        VARCHAR(15) NOT NULL,
    objetivo        VARCHAR(255),
    idBiblioEv      NUMBER(10)
);

CREATE TABLE TRABAJADORES (
    idTrab          NUMBER(13)  NOT NULL,
    nombreTr        VARCHAR(10) NOT NULL,
    apellidoTr      VARCHAR(10) NOT NULL,
    edad            NUMBER(2)   NOT NULL,
    contactoTrab    VARCHAR(20) NOT NULL,
    residencia      VARCHAR(25) NOT NULL,
    tipoDoc         VARCHAR(30) NOT NULL,
    numDoc          NUMBER(10)  NOT NULL,
    cargo           VARCHAR(15) NOT NULL,
    estadoCivil     VARCHAR(10) NOT NULL,
    idBiblioT       NUMBER(10)
);

CREATE TABLE TRABAJADORESXTURNOS (
    idTrabP         NUMBER(13) NOT NULL,
    idTurnoP        NUMBER(5)  NOT NULL
);

CREATE TABLE TURNOS_TRABAJADORES (
    idTurno         NUMBER(5)    NOT NULL,
    horaInicio      VARCHAR(10)  NOT NULL,
    horaFin         VARCHAR(10)  NOT NULL,
    cantHoras       VARCHAR(10)  NOT NULL,
    tipoTurno       VARCHAR(25)  NOT NULL,
    tarea           VARCHAR(250) NOT NULL
);

--Usuarios--
CREATE TABLE SUSCRIPCIONES (
    idSus           NUMBER(10)  NOT NULL,
    contactoSus     VARCHAR(10) NOT NULL,
    residenciaSus   VARCHAR(25) NOT NULL,
    codMembre       NUMBER(10)  NOT NULL,
    costoSus        NUMBER(5)   NOT NULL
);

CREATE TABLE RESERVAS (
    idReserva       NUMBER(10)   NOT NULL,
    tiempoR         NUMBER(3)    NOT NULL,
    cantLibros      NUMBER(2)    NOT NULL,
    caractEntrega   VARCHAR(250) NOT NULL,
    idDispR         NUMBER(10)   NOT NULL
);

CREATE TABLE USUARIOS (
    idUsuario       NUMBER(10)  NOT NULL,
    nombreU         VARCHAR(15) NOT NULL,
    apellidoU       VARCHAR(15) NOT NULL,
    tipoDocU        VARCHAR(30) NOT NULL,
    numDocU         NUMBER(10)  NOT NULL,
    edadU           NUMBER(2)   NOT NULL,
    idHistorialU    NUMBER(10)  NOT NULL,
    idSusUss        NUMBER(10)
);

CREATE TABLE USUARIOSXRESERVAS (
    idUsuarioS  NUMBER(10)  NOT NULL,
    idReservaS  NUMBER(10)  NOT NULL
);

--Casos de Usos--
CREATE TABLE HISTORIALES_PRESTAMOS (
    idHistorial    NUMBER(10) NOT NULL,
    fechaP         DATE       NOT NULL,
    idArticuloHP   NUMBER(10) NOT NULL
);

CREATE TABLE DEVOLUCIONES (
    idDevolucion   NUMBER(3)     NOT NULL,
    fechaDev       DATE          NOT NULL,
    observaciones  VARCHAR(255)  NOT NULL,
    idHistorialD   NUMBER(10)    NOT NULL
);

CREATE TABLE ESTADISTICAS_USO (
    idEU            NUMBER(10) NOT NULL,
    cantidadP       NUMBER(3)  NOT NULL,
    eRetrasadas     NUMBER(3)  NOT NULL,
    eTiempo         NUMBER(3)  NOT NULL,
    dPendientes     NUMBER(3)  NOT NULL,
    idHistorialEU   NUMBER(10) NOT NULL,
    idBiblioEU      NUMBER(10) NOT NULL
);

CREATE TABLE HISTORIALESXSANCIONES (
    idSancionG      VARCHAR(5)  NOT NULL,
    idHistorialG    NUMBER(10)  NOT NULL
);

--Sanciones--
CREATE TABLE SANCIONES (
    idSancion   VARCHAR(5)  NOT NULL,
    tiempoS     NUMBER(3)   NOT NULL,
    tipoS       VARCHAR(25) NOT NULL,
    fechaInS    DATE        NOT NULL,
    fechaFinS   DATE        NOT NULL
);

CREATE TABLE BLOQUEOS (
    idBloqueo   VARCHAR(5)   NOT NULL,
    razonB      VARCHAR(250) NOT NULL,
    duracionB   VARCHAR(10)  NOT NULL,
    fechB       DATE         NOT NULL
);

CREATE TABLE MULTAS (
    idMulta     VARCHAR(5)  NOT NULL,
    montoM      NUMBER(6)   NOT NULL,
    fechaM      DATE        NOT NULL,
    fechaPM     DATE        NOT NULL,
    estadoM     VARCHAR(10) NOT NULL
);