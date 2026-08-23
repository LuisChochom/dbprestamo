-- PRUEBA 1: Falla por duplicar clave UNIQUE (Correo ya existente)
-- Error esperado: duplicate key value violates unique constraint "prestatario_correo_key"
INSERT INTO PRESTATARIO (nombre, correo) 
VALUES ('Duplicado Test', 'carlos.mendoza@email.com');

-- PRUEBA 2: Falla por violar condición CHECK (Cantidad <= 0)
-- Error esperado: new row violates check constraint "chk_detalle_cantidad"
INSERT INTO DETALLE_PRESTAMO (id_prestamo, id_equipo, cantidad) 
VALUES (1, 2, 0);

-- PRUEBA 3: Falla por violar restricción CHECK de estado no permitido
-- Error esperado: new row violates check constraint "chk_prestamo_estado"
INSERT INTO PRESTAMO (id_prestatario, fecha_prestamo, fecha_devolucion_prevista, estado) 
VALUES (1, '2026-08-20', '2026-08-25', 'EXTRAVIADO');

-- PRUEBA 4: Falla por FOREIGN KEY inexistente (id_prestatario no existe)
-- Error esperado: violates foreign key constraint "fk_prestamo_prestatario"
INSERT INTO PRESTAMO (id_prestatario, fecha_prestamo, fecha_devolucion_prevista, estado) 
VALUES (999, '2026-08-20', '2026-08-25', 'ACTIVO');