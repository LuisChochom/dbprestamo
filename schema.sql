DROP TABLE IF EXISTS DETALLE_PRESTAMO CASCADE;
DROP TABLE IF EXISTS PRESTAMO CASCADE;
DROP TABLE IF EXISTS EQUIPO CASCADE;
DROP TABLE IF EXISTS PRESTATARIO CASCADE;

CREATE TABLE PRESTATARIO (
    id_prestatario SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE EQUIPO (
    id_equipo SERIAL PRIMARY KEY,
    codigo_equipo VARCHAR(50) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL
);

CREATE TABLE PRESTAMO (
    id_prestamo SERIAL PRIMARY KEY,
    id_prestatario INT NOT NULL,
    fecha_prestamo DATE NOT NULL DEFAULT CURRENT_DATE,
    fecha_devolucion_prevista DATE NOT NULL,
    fecha_devolucion_real DATE,
    estado VARCHAR(20) NOT NULL DEFAULT 'ACTIVO',
    CONSTRAINT fk_prestamo_prestatario 
        FOREIGN KEY (id_prestatario) REFERENCES PRESTATARIO(id_prestatario) 
        ON DELETE RESTRICT,
    CONSTRAINT chk_prestamo_estado 
        CHECK (estado IN ('ACTIVO', 'DEVUELTO', 'VENCIDO', 'CANCELADO')),
    CONSTRAINT chk_prestamo_fechas 
        CHECK (fecha_devolucion_prevista >= fecha_prestamo)
);

CREATE TABLE DETALLE_PRESTAMO (
    id_detalle SERIAL PRIMARY KEY,
    id_prestamo INT NOT NULL,
    id_equipo INT NOT NULL,
    cantidad INT NOT NULL,
    CONSTRAINT fk_detalle_prestamo 
        FOREIGN KEY (id_prestamo) REFERENCES PRESTAMO(id_prestamo) 
        ON DELETE CASCADE,
    CONSTRAINT fk_detalle_equipo 
        FOREIGN KEY (id_equipo) REFERENCES EQUIPO(id_equipo) 
        ON DELETE RESTRICT,
    CONSTRAINT chk_detalle_cantidad 
        CHECK (cantidad > 0)
);