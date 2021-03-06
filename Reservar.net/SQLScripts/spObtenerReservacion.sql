USE [Reservar.net]
GO
/****** Object:  StoredProcedure [dbo].[spObtenerReservacion]    Script Date: 4/28/2022 7:15:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spObtenerReservacion]
	@codigoReservacion INT
AS
BEGIN
	  SELECT 
		r.codigoDestino,
		r.codigoReservacion,
		r.email,
		r.adultos,
		r.ninos,
		r.fechaLlegada,
		r.fechaSalida,
		r.cantidadNoches,
		r.montoHospedajeFinal,
		r.montoHospedajeDetalle,
		r.montoHospedaje,
		d.foto,
		d.nombre
	  FROM Reservaciones r
		INNER JOIN Destinos d
		ON r.codigoDestino = d.codigo
	  WHERE r.codigoReservacion = @codigoReservacion
END
