-- 2 Prestatarios
INSERT INTO PRESTATARIO (nombre, correo) VALUES
('Carlos Mendoza', 'carlos.mendoza@email.com'),
('Ana Morales', 'ana.morales@email.com');

-- 4 Equipos
INSERT INTO EQUIPO (codigo_equipo, nombre, categoria) VALUES
('PROY-001', 'Proyector Epson Full HD', 'Proyección'),
('CAM-001', 'Cámara Sony Alpha III', 'Fotografía'),
('MIC-001', 'Micrófono Inalámbrico Shure', 'Audio'),
('TRIP-001', 'Trípode Manfrotto Pro', 'Accesorios');

-- 3 Préstamos
INSERT INTO PRESTAMO (id_prestatario, fecha_prestamo, fecha_devolucion_prevista, fecha_devolucion_real, estado) VALUES
(1, '2026-08-01', '2026-08-05', '2026-08-05', 'DEVUELTO'),
(1, '2026-08-10', '2026-08-15', NULL, 'ACTIVO'),
(2, '2026-08-12', '2026-08-18', NULL, 'ACTIVO');

-- 5 Detalles de préstamo
INSERT INTO DETALLE_PRESTAMO (id_prestamo, id_equipo, cantidad) VALUES
(1, 1, 1),
(1, 4, 1),
(2, 2, 1),
(2, 4, 2),
(3, 3, 2);