USE [Reservar.net]
GO
/****** Object:  StoredProcedure [dbo].[spObtenerReservaciones]    Script Date: 4/28/2022 7:07:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spObtenerReservaciones]
	@email varchar(50)
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
		d.foto,
		d.nombre
	  FROM Reservaciones r
		INNER JOIN Destinos d
		ON r.codigoDestino = d.codigo
	  WHERE r.email = @email
END
