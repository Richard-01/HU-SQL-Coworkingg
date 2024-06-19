-- Insertar una reserva para un espacio de trabajo en una sesión específica
INSERT INTO Reserva (ID_Usuario, ID_EspacioTrabajo, Fecha_Reserva, Hora_Inicio, Hora_Fin)
VALUES 
(1, 1, '2024-06-18', '09:00:00', '17:00:00'),
(1, 2, '2024-06-18', '09:00:00', '17:00:00'),
(1, 3, '2024-06-18', '09:00:00', '17:00:00'),
(1, 4, '2024-06-18', '09:00:00', '17:00:00'),
(1, 5, '2024-06-18', '09:00:00', '17:00:00'),
(1, 6, '2024-06-18', '09:00:00', '17:00:00'),
(1, 7, '2024-06-18', '09:00:00', '17:00:00'),
(1, 8, '2024-06-18', '09:00:00', '17:00:00'),
(1, 9, '2024-06-18', '09:00:00', '17:00:00'),
(1, 10, '2024-06-18', '09:00:00', '17:00:00');




-- Eliminar una reserva por su ID
DELETE FROM coworking.Reserva
WHERE ID_Reserva = :id_reserva;



