--atributos--
--Articulos--
ALTER TABLE ARTICULOS
ADD CONSTRAINT CK_ARTICULOS_EST_FIS
CHECK (estadoFis IN ('Buen Estado', 'Condicion Regular', 'Desgastado', 'Dañado', 'Restaurado'));

ALTER TABLE ARTICULOS
ADD CONSTRAINT CK_ARTICULOS_COSTO_ADQ
CHECK (costoAdq > 0);

--Inventarios--
ALTER TABLE DISPONIBILIDADES
ADD CONSTRAINT CK_DISP_ESTADO
CHECK (estado_disp IN ('Disponible', 'Prestado', 'Reservado', 'Retirado/daño', 'Perdido'));

ALTER TABLE INVENTARIOS
ADD CONSTRAINT CK_INVENT_CONDICION
CHECK (condicion_inv IN ('retirado', 'publico', 'extraviado', 'en restauracion'));

ALTER TABLE INVENTARIOS
ADD CONSTRAINT CK_INVENT_ACCESO
CHECK (acceso IN ('Acceso total', 'Acceso restringido'));

--Bibliotecas--
ALTER TABLE EVENTOS
ADD CONSTRAINT CK_EVENTO_TEMATICA
CHECK (tematica IN ('Celebración', 'Conmemoración', 'Aniversario', 'Festividad', 'Tributo'));

ALTER TABLE TRABAJADORES
ADD CONSTRAINT CK_TRABAJADOR_TIPO_DOC
CHECK (tipoDoc IN ('Cedula Ciudadanía', 'Cedula Extranjería', 'Registro Civil', 'Tarjeta Identidad', 'Acta Nacimiento'));

ALTER TABLE TURNOS_TRABAJADORES
ADD CONSTRAINT CK_TRAB_TIPO_TURNO
CHECK (tipoTurno IN ('Diurno', 'Nocturno', 'Rotativo', 'Fijo'));

--Usuarios--
ALTER TABLE SUSCRIPCIONES
ADD CONSTRAINT CK_SUSCRIP_COSTO
CHECK (costoSus > 0);

ALTER TABLE USUARIOS
ADD CONSTRAINT CK_USUARIO_TIPO_DOC
CHECK (tipoDocU IN ('Cedula Ciudadanía', 'Cedula Extranjería', 'Registro Civil', 'Tarjeta Identidad', 'Acta Nacimiento'));

--Sanciones--
ALTER TABLE SANCIONES
ADD CONSTRAINT CK_TIPO_SANCION
CHECK (tipoS IN ('Retraso', 'Libro Perdido', 'Libro Dañado', 'LPPNS'));--Libro  prestado pero no solicitado--

ALTER TABLE SANCIONES
ADD CONSTRAINT CK_TIPO_ID
CHECK ((idSancion LIKE 'M____' OR idSancion LIKE 'B____') AND LENGTH(idSancion) = 5);

ALTER TABLE MULTAS
ADD CONSTRAINT CK_ESTADO_MULTA
CHECK (estadoM IN ('Pagado', 'Pendiente'));