--Usuario--
---------------------------------------------------------------------
--Trigger encargado de generar el codigo de membresia del usuario--
--suscrito de forma automatica y secuencial--
---------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TR_MEMB_BI
BEFORE INSERT ON SUSCRIPCIONES
FOR EACH ROW
DECLARE
    membresia NUMBER;
BEGIN
    SELECT NVL(MAX(codMembre),0)+1 INTO membresia
    FROM SUSCRIPCIONES;
    :NEW.codMembre := membresia;
END TR_MEMB_BI;
---------------------------------------------------------------------
--Trigger encargado de verificar que el costo de suscripción sea mayor a 10.000--
--y menor a 100.000, ademas, que este mismo debe ser multiplo de 500--
---------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TR_COSTO_SUS_BI
BEFORE INSERT ON SUSCRIPCIONES
FOR EACH ROW
BEGIN
    IF :NEW.costoSus < 10000 OR :NEW.costoSus > 99999 THEN
        RAISE_APPLICATION_ERROR(-20011, 'El costo de suscripción debe ser mayor a 10.000 pero menor a 100.000');
    END IF;
    IF MOD(:NEW.costoSus, 500) != 0 THEN
        RAISE_APPLICATION_ERROR(-20012, 'El costo de suscripción debe ser múltiplo de 500.');
    END IF;
END TR_COSTO_SUS_BI;
---------------------------------------------------------------------

--Caso de Uso--
---------------------------------------------------------------------
--Trigger que se encarga de verificar que las observaciones en la seccion de--
--devoluciones sea diferentes a uno o más espacion en blanco--
---------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TR_OBSR_DEV_BI
BEFORE INSERT ON DEVOLUCIONES
FOR EACH ROW
BEGIN
    IF TRIM(:NEW.observaciones) = '' THEN
        RAISE_APPLICATION_ERROR(-20013, 'La observación no puede estar en blanco.');
    END IF;
END TR_OBSR_DEV_BI;
---------------------------------------------------------------------
--Trigger que se encargada de programar la fecha del sistema automaticamente--
--al momento de realizar un prestamo--
---------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TR_FECHA_HIST_BI
BEFORE INSERT ON HISTORIALES_PRESTAMOS
FOR EACH ROW
BEGIN
    :NEW.fechaP := SYSDATE;
END TR_FECHA_HIST_BI;
---------------------------------------------------------------------

--Sancion--
---------------------------------------------------------------------
--Trigger que se encarga de crear automaticamente el id de la sancion tomando--
--como parametro si es clasificada como bloqueo o como una multa--
---------------------------------------------------------------------
CREATE SEQUENCE ID_SANCION
START WITH 10
INCREMENT BY 1
MAXVALUE 9999
NOCYCLE;

CREATE OR REPLACE TRIGGER TR_IDS_BI
BEFORE INSERT ON SANCIONES
FOR EACH ROW
BEGIN
    IF :NEW.tipoS IN ('Retraso','LPPNS') THEN
        :NEW.idSancion := 'B'||LPAD(ID_SANCION.NEXTVAL,4,'0');
    ELSIF :NEW.tipoS IN ('Libro Perdido', 'Libro Dañado') THEN
        :NEW.idSancion := 'M'||LPAD(ID_SANCION.NEXTVAL,4,'0');
    END IF;
END TR_IDS_BI;
---------------------------------------------------------------------
--Trigger que se encarga de asignar automaticamente el ultimo id generado por sanciones--
--y que aún no se ha utilizado en multas para la nueva inserciónd e datos--
---------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TR_IDMULTAS_BI
BEFORE INSERT ON MULTAS
FOR EACH ROW
DECLARE
    v_id VARCHAR(5);
BEGIN
    SELECT idSancion INTO v_id
    FROM (SELECT idSancion
          FROM SANCIONES
          WHERE idSancion LIKE 'M%' AND idSancion NOT IN (SELECT idMulta FROM MULTAS)
          ORDER BY idSancion DESC)
    WHERE ROWNUM = 1;
    :NEW.idMulta := v_id;
END TR_IDMULTAS_BI;
---------------------------------------------------------------------
--Trigger que se encarga de asignar automaticamente el ultimo id generado por sanciones--
--y que aún no se ha utilizado en bloqueos para la nueva inserciónd e datos--
---------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TR_IDBLOQUEOS_BI
BEFORE INSERT ON BLOQUEOS
FOR EACH ROW
DECLARE
    v_id VARCHAR(5);
BEGIN
    SELECT idSancion INTO v_id
    FROM (SELECT idSancion
          FROM SANCIONES
          WHERE idSancion LIKE 'B%' AND idSancion NOT IN (SELECT idBloqueo FROM BLOQUEOS)
          ORDER BY idSancion DESC)
    WHERE ROWNUM = 1;
    :NEW.idBloqueo := v_id;
END TR_IDBLOQUEOS_BI;
---------------------------------------------------------------------   

--Articulo--
---------------------------------------------------------------------
--Trigger encargado de verificar que el costo de adquisicion sea mayor a 1.000--
--y menor a 1.000.000, ademas, que este mismo debe ser multiplo de 100--
---------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TR_COSTO_ADQ_BI
BEFORE INSERT ON ARTICULOS
FOR EACH ROW
BEGIN
    IF :NEW.costoAdq < 1000 OR :NEW.costoAdq > 999999 THEN
        RAISE_APPLICATION_ERROR(-20003, 'El costo de adquisición debe ser mayor a 1.000 pero menor a 1.000.000');
    END IF;
    IF MOD(:NEW.costoAdq, 100) != 0 THEN
        RAISE_APPLICATION_ERROR(-20004, 'El costo de adquisición debe ser múltiplo de 100.');
    END IF;
END TR_COSTO_ADQ_BI;
---------------------------------------------------------------------
--Trigger encargado de no permitir ninguna modificacion al nombre o al--
--contacto de la editorial anteriormente ingresada--
---------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TR_NO_EDITORIAL_BU
BEFORE UPDATE ON EDITORIALES
FOR EACH ROW
BEGIN
    IF :OLD.nombreEd != :NEW.nombreEd THEN
        RAISE_APPLICATION_ERROR(-20005, 'No está permitido modificar el nombre de la editorial.');
    END IF;
    IF :OLD.contacto != :NEW.contacto THEN
        RAISE_APPLICATION_ERROR(-20006, 'No está permitido modificar el contacto de la editorial.');
    END IF;
END TR_NO_EDITORIAL_BU;
---------------------------------------------------------------------

--Inventarios--
---------------------------------------------------------------------
--Trigger que no permite la eliminación de ningún dato insertado en--
--la seccion de disponibilidades--
---------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TR_NO_DISP_BD
BEFORE DELETE ON DISPONIBILIDADES
BEGIN
    RAISE_APPLICATION_ERROR(-20009, 'No está permitido eliminar registros de la tabla disponibilidades.');
END TR_NO_DISP_BD;
---------------------------------------------------------------------
--Trigger que no permite modificar el ID, fecha de agregacion ni el nombre del articulo--
--ya registrado en el inventario de una biblioteca--
---------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TR_RESTRINGIR_INV_BU
BEFORE UPDATE ON INVENTARIOS
FOR EACH ROW
BEGIN
    IF :OLD.idInv != :NEW.idInv OR :OLD.fechAg != :NEW.fechAg OR :OLD.nombreA != :NEW.nombreA
    OR :OLD.idBiblioIn != :NEW.idBiblioIn OR :OLD.idDispIn != :NEW.idDispIn THEN
        RAISE_APPLICATION_ERROR(-20007, 'No posee el permiso para modificar estos datos seleccionados. Solo se puede modificar: cantidad, condicion, estanteria y acceso.');
    END IF;
END TR_RESTRINGIR_INV_BU;
---------------------------------------------------------------------

--Biblioteca--
---------------------------------------------------------------------
--Trigger que se encarga de verificar la información de edad de cualquier--
--empleado de una biblioteca. Debe ser mayor de edad--
---------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TR_EDAD_T_BI
BEFORE INSERT ON TRABAJADORES
FOR EACH ROW
BEGIN
    IF :NEW.edad < 18 THEN
        RAISE_APPLICATION_ERROR(-20008, 'El trabajador debe ser mayor de edad.');
    END IF;
END TR_EDAD_T_BI;
---------------------------------------------------------------------
--Trigger que se encarga de evitar las asignaciones de eventos en una biblioteca--
--con la misma fecha, si ya hay una existente, no pueden haber mas eventos en esa fecha--
---------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TR_NO_EVENT_BI
BEFORE INSERT ON EVENTOS
FOR EACH ROW
DECLARE cantidad NUMBER;
BEGIN
    SELECT COUNT(*) INTO cantidad
    FROM EVENTOS
    WHERE idBiblioEv = :NEW.idBiblioEv
    AND fecha = :NEW.fecha;
    
    IF cantidad > 0 THEN
        RAISE_APPLICATION_ERROR(-20010, 'Ya existe un evento en esa biblioteca para esa fecha.');
    END IF;
END TR_NO_EVENT_BI;
---------------------------------------------------------------------