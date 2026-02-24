--tuplas--
-----------------------------------------------------------------
--Verifica que la fecha donde inicia la sancion sea menor a la--
--terminacion de la misma--
-----------------------------------------------------------------
ALTER TABLE SANCIONES
ADD CONSTRAINT chk_fechas_sancion CHECK (fechaInS < fechaFinS);
-----------------------------------------------------------------
--verifica que la fecha donde sea registrada la multa sea menor--
--o igual a la fehca de pago de la misma--
-----------------------------------------------------------------
ALTER TABLE MULTAS
ADD CONSTRAINT chk_fechas_multa CHECK (fechaM <= fechaPM);
-----------------------------------------------------------------
--verifica que la hora de apertura de la biblioteca sea estrictamente--
--menor a la hora de cierre de la misma--
-----------------------------------------------------------------
ALTER TABLE BIBLIOTECAS
ADD CONSTRAINT chk_horas_biblioteca
CHECK (
  REGEXP_LIKE(horaApert,  '^\d{2}:\d{2}$') AND
  REGEXP_LIKE(horaCierre, '^\d{2}:\d{2}$') AND
  horaApert < horaCierre
);
-----------------------------------------------------------------
--verifica que la hora de inicio del turno del trabajador sea
--estrictamente menor a la hora fin del mismo--
-----------------------------------------------------------------
ALTER TABLE TURNOS_TRABAJADORES
ADD CONSTRAINT chk_horas_turno
CHECK (
  REGEXP_LIKE(horaInicio, '^\d{2}:\d{2}$') AND
  REGEXP_LIKE(horaFin,    '^\d{2}:\d{2}$') AND
  horaInicio < horaFin
);
-----------------------------------------------------------------
