--ENTIDADES

-- Creación del tipo ENUM para Estado
CREATE TYPE coworking.estado_espacio AS ENUM ('Disponible', 'Ocupado');

-- Creación de las tablas
CREATE TABLE coworking.Sala (
    ID_Sala SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Ubicacion VARCHAR(255) NOT NULL,
    Numero_Filas INT NOT NULL,
    Numero_Columnas INT NOT NULL
);

CREATE TABLE coworking.EspacioTrabajo (
    ID_EspacioTrabajo SERIAL PRIMARY KEY,
    ID_Sala INT NOT NULL,
    Fila INT NOT NULL,
    Columna INT NOT NULL,
    Estado estado_espacio DEFAULT 'Disponible',
    FOREIGN KEY (ID_Sala) REFERENCES coworking.Sala(ID_Sala)
);

CREATE TABLE coworking.Usuario (
    ID_Usuario SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Apellido VARCHAR(255) NOT NULL,
    Correo_Electronico VARCHAR(255) UNIQUE NOT NULL,
    Telefono VARCHAR(50)
);

CREATE TABLE coworking.Reserva (
    ID_Reserva SERIAL PRIMARY KEY,
    ID_Usuario INT NOT NULL,
    ID_EspacioTrabajo INT NOT NULL,
    Fecha_Reserva DATE NOT NULL,
    Hora_Inicio TIME NOT NULL,
    Hora_Fin TIME NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES coworking.Usuario(ID_Usuario),
    FOREIGN KEY (ID_EspacioTrabajo) REFERENCES coworking.EspacioTrabajo(ID_EspacioTrabajo)
);

CREATE TABLE coworking.Sesion (
    ID_Sesion SERIAL PRIMARY KEY,
    ID_Usuario INT NOT NULL,
    Nombre_Sesion VARCHAR(255) NOT NULL,
    Fecha_Sesion DATE NOT NULL,
    Hora_Inicio TIME NOT NULL,
    Hora_Fin TIME NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES coworking.Usuario(ID_Usuario)
);

CREATE TABLE coworking.SesionEspacioTrabajo (
    ID_Sesion INT NOT NULL,
    ID_EspacioTrabajo INT NOT NULL,
    PRIMARY KEY (ID_Sesion, ID_EspacioTrabajo),
    FOREIGN KEY (ID_Sesion) REFERENCES coworking.Sesion(ID_Sesion),
    FOREIGN KEY (ID_EspacioTrabajo) REFERENCES coworking.EspacioTrabajo(ID_EspacioTrabajo)
);
