-- NOTA CAMBIAR EL ID POR EL QUE SE DESEA BUSCAR


-- Ver la lista de espacios de trabajo disponibles de una sala en una sesión x.
SELECT ET.ID_EspacioTrabajo, ET.Fila, ET.Columna
FROM coworking.EspacioTrabajo ET
LEFT JOIN coworking.Reserva R ON ET.ID_EspacioTrabajo = R.ID_EspacioTrabajo
WHERE ET.ID_Sala = :id_sala
AND (R.ID_Sesion IS NULL OR (:fecha_sesion NOT BETWEEN R.Fecha_Reserva AND R.Fecha_Reserva));


-- Ver la lista de espacios de trabajo ocupados de una sala en una sesión x.
SELECT ET.ID_EspacioTrabajo, ET.Fila, ET.Columna
FROM coworking.EspacioTrabajo ET
INNER JOIN coworking.Reserva R ON ET.ID_EspacioTrabajo = R.ID_EspacioTrabajo
WHERE ET.ID_Sala = :id_sala
AND R.ID_Sesion = :id_sesion;


-- Ver las sesiones con orden por las más ocupadas.
SELECT S.ID_Sesion, COUNT(R.ID_Reserva) AS Total_Reservas
FROM coworking.Sesion S
LEFT JOIN coworking.Reserva R ON S.ID_Sesion = R.ID_Sesion
GROUP BY S.ID_Sesion
ORDER BY Total_Reservas DESC;


-- Ver las sesiones con orden por las más disponibles.
SELECT S.ID_Sesion, COUNT(R.ID_Reserva) AS Total_Reservas
FROM coworking.Sesion S
LEFT JOIN coworking.Reserva R ON S.ID_Sesion = R.ID_Sesion
GROUP BY S.ID_Sesion
ORDER BY Total_Reservas ASC;



-- Ver la lista de espacios de trabajo asignados a un usuario.
SELECT ET.ID_EspacioTrabajo, ET.Fila, ET.Columna
FROM coworking.EspacioTrabajo ET
INNER JOIN coworking.Reserva R ON ET.ID_EspacioTrabajo = R.ID_EspacioTrabajo
WHERE R.ID_Usuario = :id_usuario;



-- Ver la lista de espacios de trabajo asignados a una sesión.
SELECT ET.ID_EspacioTrabajo, ET.Fila, ET.Columna
FROM coworking.EspacioTrabajo ET
INNER JOIN coworking.Reserva R ON ET.ID_EspacioTrabajo = R.ID_EspacioTrabajo
WHERE R.ID_Sesion = :id_sesion;



-- Consulta adicional para obtener información detallada sobre la sesión "Curso Desarrollo" que el id "x" ha reservado o el nombre del curso(Solo si ya se registro)

SELECT 
    u.Nombre AS Usuario_Nombre,
    u.Apellido AS Usuario_Apellido,
    u.Correo_Electronico,
    s.Nombre_Sesion,
    s.Fecha_Sesion,
    s.Hora_Inicio,
    s.Hora_Fin,
    et.ID_EspacioTrabajo,
    et.Fila,
    et.Columna,
    et.Estado,
    sl.Nombre AS Sala_Nombre,
    sl.Ubicacion
FROM 
    coworking.Sesion s
JOIN 
    coworking.Usuario u ON s.ID_Usuario = u.ID_Usuario
JOIN 
    coworking.SesionEspacioTrabajo set ON s.ID_Sesion = set.ID_Sesion
JOIN 
    coworking.EspacioTrabajo et ON set.ID_EspacioTrabajo = et.ID_EspacioTrabajo
JOIN 
    coworking.Sala sl ON et.ID_Sala = sl.ID_Sala
WHERE 
    s.Nombre_Sesion = 'Curso Desarrollo'; -- no esta registrado porque agregue un campo mas en la tabla sesion así que este "Nombre_Sesion" esta vacio
