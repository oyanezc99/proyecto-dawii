CREATE DATABASE BD_RinconDelTurista;
USE bd_rincondelturista;
 
-- Crear la tabla ROL
CREATE TABLE rol (
    idrol INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion TEXT,
    activo BOOLEAN DEFAULT TRUE
);
 
-- Crear la tabla USUARIO
CREATE TABLE usuario (
    idusuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255),
    dni varchar(50),
    sexo varchar(1),
    telefono VARCHAR(20),
    email VARCHAR(255),    
    nombre_usuario VARCHAR(255) NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    fecha_nacimiento timestamp,
    fecha_registro timestamp,
    activo BOOLEAN DEFAULT TRUE,
    idrol INT not NULL,
    FOREIGN KEY (idrol) REFERENCES rol(idrol)
);
 
-- Crear la tabla CATEGORIA
CREATE TABLE categoria (
    idcategoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    activo BOOLEAN DEFAULT TRUE
);

-- Crear la tabla Ciudades
create table ciudad(
	idciudad int auto_increment primary key,
	nombre varchar(100)
);
 
-- Crear la tabla Empresas
CREATE TABLE empresa (
    idempresa INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) not null,
    descripcion TEXT,
    idcategoria INT not null,
    estrellas INT,
    likes INT,
    idciudad int not null,
    activo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (idcategoria) REFERENCES categoria(idcategoria),
    FOREIGN KEY (idciudad) REFERENCES ciudad(idciudad)
);

-- Crer la tabla Servicios
create table servicio(
	idservicio int auto_increment primary key,
	nombre varchar(100) not null,
	descripcion text,
	idempresa int not null,
	estrellas int,
	likes int,
	precio DECIMAL(10, 2) not null,
	precioincremento DECIMAL(10, 2) not null,
	stock int not null,
	activo BOOLEAN DEFAULT TRUE,
	foreign key (idempresa) references empresa(idempresa)
);


-- Crear la tabla RESERVA
CREATE TABLE reserva (
    idreserva INT AUTO_INCREMENT PRIMARY KEY,
    idusuario INT not null,
    idservicio INT not null,
    fecha_reserva timestamp,
    cantidad_personas INT,
    cantidad_dias int,    
    subtotal DECIMAL(10, 2),
    fecha_registro timestamp,
    activo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (idusuario) REFERENCES usuario(idusuario),
    FOREIGN KEY (idservicio) REFERENCES servicio(idservicio)
);


-- Procedimientos almacenados
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- Crear rol
CREATE PROCEDURE sp_CrearRol(
    IN p_nombre VARCHAR(50),
    IN p_descripcion TEXT
)
BEGIN
    INSERT INTO rol (nombre, descripcion)
    VALUES (p_nombre, p_descripcion);
END;

-- Leer rol por ID
CREATE PROCEDURE sp_LeerRol(
    IN p_idrol INT
)
BEGIN
    SELECT * FROM rol WHERE idrol = p_idrol AND activo = TRUE;
END;

-- Leer todos los roles (filtrar por nombre o descripción)
CREATE PROCEDURE sp_LeerTodosRoles(
    IN p_nombre_descripcion VARCHAR(255)
)
BEGIN
    IF p_nombre_descripcion IS NULL OR p_nombre_descripcion = '' THEN
        SELECT * FROM rol WHERE activo = TRUE;
    ELSE
        SELECT * FROM rol WHERE activo = TRUE AND (nombre LIKE CONCAT('%', p_nombre_descripcion, '%') OR descripcion LIKE CONCAT('%', p_nombre_descripcion, '%'));
    END IF;
END;

-- Actualizar rol
CREATE PROCEDURE sp_ActualizarRol(
    IN p_idrol INT,
    IN p_nombre VARCHAR(50),
    IN p_descripcion TEXT
)
BEGIN
    UPDATE rol
    SET nombre = p_nombre,
        descripcion = p_descripcion
    WHERE idrol = p_idrol;
END;

-- Eliminar rol (cambiar activo a FALSE)
CREATE PROCEDURE sp_EliminarRol(
    IN p_idrol INT
)
BEGIN
    UPDATE rol
    SET activo = FALSE
    WHERE idrol = p_idrol;
END;

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- Crear usuario
CREATE PROCEDURE sp_CrearUsuario (
    IN p_nombre VARCHAR(255),
    IN p_apellido VARCHAR(255),
    IN p_dni VARCHAR(50),
    IN p_sexo VARCHAR(1),
    IN p_telefono VARCHAR(20),
    IN p_email VARCHAR(255),
    IN p_nombre_usuario VARCHAR(255),
    IN p_contrasena VARCHAR(255),
    IN p_fecha_nacimiento DATE,
    IN p_idrol INT
)
BEGIN
    INSERT INTO usuario (
        nombre, apellido, dni, sexo, telefono, email,
        nombre_usuario, contrasena, fecha_nacimiento, fecha_registro, idrol, activo
    ) VALUES (
        p_nombre, p_apellido, p_dni, p_sexo, p_telefono, p_email,
        p_nombre_usuario, p_contrasena, p_fecha_nacimiento, NOW(), p_idrol, TRUE
    );
END;


-- Leer usuario por ID
CREATE PROCEDURE sp_LeerUsuario(
    IN p_idusuario INT
)
BEGIN
    SELECT * FROM usuario WHERE idusuario = p_idusuario AND activo = TRUE;
END;

-- Leer todos los usuarios (filtrar por nombre de usuario o email)
CREATE PROCEDURE sp_LeerTodosUsuarios(
    IN p_nombre_usuario_email VARCHAR(255)
)
BEGIN
    IF p_nombre_usuario_email IS NULL OR p_nombre_usuario_email = '' THEN
        SELECT * FROM usuario WHERE activo = TRUE;
    ELSE
        SELECT * FROM usuario WHERE activo = TRUE AND (nombre_usuario LIKE CONCAT('%', p_nombre_usuario_email, '%') OR email LIKE CONCAT('%', p_nombre_usuario_email, '%'));
    END IF;
END;

-- Actualizar usuario
CREATE PROCEDURE sp_ActualizarUsuario(
    IN p_idusuario INT,
    IN p_nombre VARCHAR(255),
    IN p_apellido VARCHAR(255),
    IN p_dni VARCHAR(50),
    IN p_sexo VARCHAR(1),
    IN p_telefono VARCHAR(20),
    IN p_email VARCHAR(255),
    IN p_nombre_usuario VARCHAR(255),
    IN p_contrasena VARCHAR(255),
    IN p_fecha_nacimiento TIMESTAMP,
    IN p_idrol INT
)
BEGIN
    UPDATE usuario
    SET nombre = p_nombre,
        apellido = p_apellido,
        dni = p_dni,
        sexo = p_sexo,
        telefono = p_telefono,
        email = p_email,
        nombre_usuario = p_nombre_usuario,
        contrasena = p_contrasena,
        fecha_nacimiento = p_fecha_nacimiento,
        idrol = p_idrol
    WHERE idusuario = p_idusuario;
END;

-- Eliminar usuario (cambiar activo a FALSE)
CREATE PROCEDURE sp_EliminarUsuario(
    IN p_idusuario INT
)
BEGIN
    UPDATE usuario
    SET activo = FALSE
    WHERE idusuario = p_idusuario;
END;
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- Crear categoria
CREATE PROCEDURE sp_CrearCategoria(
    IN p_nombre VARCHAR(100),
    IN p_descripcion TEXT
)
BEGIN
    INSERT INTO categoria (nombre, descripcion)
    VALUES (p_nombre, p_descripcion);
END;

-- Leer categoria por ID
CREATE PROCEDURE sp_LeerCategoria(
    IN p_idcategoria INT
)
BEGIN
    SELECT * FROM categoria WHERE idcategoria = p_idcategoria AND activo = TRUE;
END;

-- Leer todas las categorias (filtrar por nombre)
CREATE PROCEDURE sp_LeerTodasCategorias(
    IN p_nombre VARCHAR(100)
)
BEGIN
    IF p_nombre IS NULL OR p_nombre = '' THEN
        SELECT * FROM categoria WHERE activo = TRUE;
    ELSE
        SELECT * FROM categoria WHERE activo = TRUE AND nombre LIKE CONCAT('%', p_nombre, '%');
    END IF;
END;

-- Actualizar categoria
CREATE PROCEDURE sp_ActualizarCategoria(
    IN p_idcategoria INT,
    IN p_nombre VARCHAR(100),
    IN p_descripcion TEXT
)
BEGIN
    UPDATE categoria
    SET nombre = p_nombre,
        descripcion = p_descripcion
    WHERE idcategoria = p_idcategoria;
END;

-- Eliminar categoria (cambiar activo a FALSE)
CREATE PROCEDURE sp_EliminarCategoria(
    IN p_idcategoria INT
)
BEGIN
    UPDATE categoria
    SET activo = FALSE
    WHERE idcategoria = p_idcategoria;
END;
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- Crear ciudad
CREATE PROCEDURE sp_CrearCiudad(
    IN p_nombre VARCHAR(100)
)
BEGIN
    INSERT INTO ciudad (nombre)
    VALUES (p_nombre);
END;

-- Leer ciudad por ID
CREATE PROCEDURE sp_LeerCiudad(
    IN p_idciudad INT
)
BEGIN
    SELECT * FROM ciudad WHERE idciudad = p_idciudad;
END;

-- Leer todas las ciudades (filtrar por nombre)
CREATE PROCEDURE sp_LeerTodasCiudades(
    IN p_nombre VARCHAR(100)
)
BEGIN
    IF p_nombre IS NULL OR p_nombre = '' THEN
        SELECT * FROM ciudad;
    ELSE
        SELECT * FROM ciudad WHERE nombre LIKE CONCAT('%', p_nombre, '%');
    END IF;
END;

-- Actualizar ciudad
CREATE PROCEDURE sp_ActualizarCiudad(
    IN p_idciudad INT,
    IN p_nombre VARCHAR(100)
)
BEGIN
    UPDATE ciudad
    SET nombre = p_nombre
    WHERE idciudad = p_idciudad;
END;

-- Eliminar ciudad
CREATE PROCEDURE sp_EliminarCiudad(
    IN p_idciudad INT
)
BEGIN
    DELETE FROM ciudad WHERE idciudad = p_idciudad;
END;
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- Crear empresa
CREATE PROCEDURE sp_CrearEmpresa(
    IN p_nombre VARCHAR(255),
    IN p_descripcion TEXT,
    IN p_idcategoria INT,
    IN p_estrellas INT,
    IN p_likes INT,
    IN p_idciudad INT
)
BEGIN
    INSERT INTO empresa (nombre, descripcion, idcategoria, estrellas, likes, idciudad)
    VALUES (p_nombre, p_descripcion, p_idcategoria, p_estrellas, p_likes, p_idciudad);
END;

-- Leer empresa por ID
CREATE PROCEDURE sp_LeerEmpresa(
    IN p_idempresa INT
)
BEGIN
    SELECT * FROM empresa WHERE idempresa = p_idempresa AND activo = TRUE;
END;

-- Leer todas las empresas (filtrar por nombre o descripción)
CREATE PROCEDURE sp_LeerTodasEmpresas(
    IN p_nombre_descripcion VARCHAR(255)
)
BEGIN
    IF p_nombre_descripcion IS NULL OR p_nombre_descripcion = '' THEN
        SELECT * FROM empresa WHERE activo = TRUE;
    ELSE
        SELECT * FROM empresa WHERE activo = TRUE AND (nombre LIKE CONCAT('%', p_nombre_descripcion, '%') OR descripcion LIKE CONCAT('%', p_nombre_descripcion, '%'));
    END IF;
END;

-- Actualizar empresa
CREATE PROCEDURE sp_ActualizarEmpresa(
    IN p_idempresa INT,
    IN p_nombre VARCHAR(255),
    IN p_descripcion TEXT,
    IN p_idcategoria INT,
    IN p_estrellas INT,
    IN p_likes INT,
    IN p_idciudad INT
)
BEGIN
    UPDATE empresa
    SET nombre = p_nombre,
        descripcion = p_descripcion,
        idcategoria = p_idcategoria,
        estrellas = p_estrellas,
        likes = p_likes,
        idciudad = p_idciudad
    WHERE idempresa = p_idempresa;
END;

-- Eliminar empresa (cambiar activo a FALSE)
CREATE PROCEDURE sp_EliminarEmpresa(
    IN p_idempresa INT
)
BEGIN
    UPDATE empresa
    SET activo = FALSE
    WHERE idempresa = p_idempresa;
END;
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- Crear servicio
CREATE PROCEDURE sp_CrearServicio(
    IN p_nombre VARCHAR(100),
    IN p_descripcion TEXT,
    IN p_idempresa INT,
    IN p_estrellas INT,
    IN p_likes INT,
    IN p_precio DECIMAL(10, 2),
    IN p_precioincremento DECIMAL(10, 2),
    IN p_stock INT
)
BEGIN
    INSERT INTO servicio (nombre, descripcion, idempresa, estrellas, likes, precio, precioincremento, stock)
    VALUES (p_nombre, p_descripcion, p_idempresa, p_estrellas, p_likes, p_precio, p_precioincremento, p_stock);
END;

-- Leer servicio por ID
CREATE PROCEDURE sp_LeerServicio(
    IN p_idservicio INT
)
BEGIN
    SELECT * FROM servicio WHERE idservicio = p_idservicio AND activo = TRUE;
END;

-- Leer todos los servicios (filtrar por nombre o descripción)
CREATE PROCEDURE sp_LeerTodosServicios(
    IN p_nombre_descripcion VARCHAR(255)
)
BEGIN
    IF p_nombre_descripcion IS NULL OR p_nombre_descripcion = '' THEN
        SELECT * FROM servicio WHERE activo = TRUE;
    ELSE
        SELECT * FROM servicio WHERE activo = TRUE AND (nombre LIKE CONCAT('%', p_nombre_descripcion, '%') OR descripcion LIKE CONCAT('%', p_nombre_descripcion, '%'));
    END IF;
END;

-- Actualizar servicio
CREATE PROCEDURE sp_ActualizarServicio(
    IN p_idservicio INT,
    IN p_nombre VARCHAR(100),
    IN p_descripcion TEXT,
    IN p_idempresa INT,
    IN p_estrellas INT,
    IN p_likes INT,
    IN p_precio DECIMAL(10, 2),
    IN p_precioincremento DECIMAL(10, 2),
    IN p_stock INT
)
BEGIN
    UPDATE servicio
    SET nombre = p_nombre,
        descripcion = p_descripcion,
        idempresa = p_idempresa,
        estrellas = p_estrellas,
        likes = p_likes,
        precio = p_precio,
        precioincremento = p_precioincremento,
        stock = p_stock
    WHERE idservicio = p_idservicio;
END;

-- Eliminar servicio (cambiar activo a FALSE)
CREATE PROCEDURE sp_EliminarServicio(
    IN p_idservicio INT
)
BEGIN
    UPDATE servicio
    SET activo = FALSE
    WHERE idservicio = p_idservicio;
END;
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- Crear reserva
CREATE PROCEDURE sp_CrearReserva(
    IN p_idusuario INT,
    IN p_idservicio INT,
    IN p_fecha_reserva TIMESTAMP,
    IN p_cantidad_personas INT,
    IN p_cantidad_dias INT,
    IN p_subtotal DECIMAL(10, 2),
    IN p_fecha_registro TIMESTAMP
)
BEGIN
    INSERT INTO reserva (idusuario, idservicio, fecha_reserva, cantidad_personas, cantidad_dias, subtotal, fecha_registro)
    VALUES (p_idusuario, p_idservicio, p_fecha_reserva, p_cantidad_personas, p_cantidad_dias, p_subtotal, p_fecha_registro);
END;

-- Leer reserva por ID
CREATE PROCEDURE sp_LeerReserva(
    IN p_idreserva INT
)
BEGIN
    SELECT * FROM reserva WHERE idreserva = p_idreserva AND activo = TRUE;
END;

-- Leer todas las reservas de un usuario por ID de usuario
CREATE PROCEDURE sp_LeerReservasPorUsuario(
    IN p_idusuario INT
)
BEGIN
    SELECT * FROM reserva WHERE idusuario = p_idusuario AND activo = TRUE;
END;

-- Actualizar reserva
CREATE PROCEDURE sp_ActualizarReserva(
    IN p_idreserva INT,
    IN p_idusuario INT,
    IN p_idservicio INT,
    IN p_fecha_reserva TIMESTAMP,
    IN p_cantidad_personas INT,
    IN p_cantidad_dias INT,
    IN p_subtotal DECIMAL(10, 2)
)
BEGIN
    UPDATE reserva
    SET idusuario = p_idusuario,
        idservicio = p_idservicio,
        fecha_reserva = p_fecha_reserva,
        cantidad_personas = p_cantidad_personas,
        cantidad_dias = p_cantidad_dias,
        subtotal = p_subtotal
    WHERE idreserva = p_idreserva;
END;

-- Eliminar reserva (cambiar activo a FALSE)
CREATE PROCEDURE sp_EliminarReserva(
    IN p_idreserva INT
)
BEGIN
    UPDATE reserva
    SET activo = FALSE
    WHERE idreserva = p_idreserva;
END;
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- Llenar datos
-- Insertar roles de prueba
CALL sp_CrearRol('Administrador', 'Rol con permisos administrativos');
CALL sp_CrearRol('Usuario', 'Rol estándar para usuarios');
CALL sp_CrearRol('Supervisor', 'Rol para supervisores');

SELECT COUNT(*) FROM usuario;
-- Limpiar tabla usuario
DELETE FROM usuario;

-- Insertar usuarios de prueba nuevamente
CALL sp_CrearUsuario('Juan', 'Pérez', '12345678', 'M', '123456789', 'juan@example.com', 'juanperez', 'clave123', '1990-01-15', 1);
CALL sp_CrearUsuario('María', 'Gómez', '87654321', 'F', '987654321', 'maria@example.com', 'mariagomez', 'clave456', '1995-05-20', 2);
CALL sp_CrearUsuario('Pedro', 'López', '45678912', 'M', '456789123', 'pedro@example.com', 'pedrolopez', 'clave789', '1985-11-10', 3);

-- Insertar categorías de prueba
CALL sp_CrearCategoria('Turismo Aventura', 'Actividades de aventura al aire libre');
CALL sp_CrearCategoria('Gastronomía', 'Experiencias gastronómicas locales');
CALL sp_CrearCategoria('Cultura', 'Actividades culturales y turísticas');

-- Insertar ciudades de prueba
CALL sp_CrearCiudad('Lima');
CALL sp_CrearCiudad('Cusco');
CALL sp_CrearCiudad('Arequipa');

-- Insertar empresas de prueba
CALL sp_CrearEmpresa('Aventuras Extremas', 'Empresa especializada en turismo de aventura', 1, 4, 150, 1);
CALL sp_CrearEmpresa('Sabores del Perú', 'Empresa dedicada a la promoción de la gastronomía peruana', 2, 5, 200, 2);
CALL sp_CrearEmpresa('Cultural Tours', 'Agencia de viajes especializada en tours culturales', 3, 4, 180, 3);

-- Insertar servicios de prueba
CALL sp_CrearServicio('Rafting en Río Urubamba', 'Experiencia emocionante de rafting en Cusco', 1, 4, 120, 150.00, 20.00, 50);
CALL sp_CrearServicio('Tour Gastronómico en Lima', 'Descubre los sabores de la gastronomía limeña', 2, 5, 180, 100.00, 15.00, 30);
CALL sp_CrearServicio('Tour Machu Picchu', 'Visita guiada a la maravilla del mundo, Machu Picchu', 3, 4, 200, 250.00, 30.00, 40);

-- Insertar reservas de prueba
CALL sp_CrearReserva(4, 1, '2024-07-05 10:00:00', 2, 1, 300.00, NOW());
CALL sp_CrearReserva(4, 2, '2024-07-06 11:30:00', 3, 2, 630.00, NOW());
CALL sp_CrearReserva(4, 3, '2024-07-07 09:00:00', 4, 1, 1000.00, NOW());
