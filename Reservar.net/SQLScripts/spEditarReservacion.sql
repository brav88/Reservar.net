USE [Reservar.net]
GO
/****** Object:  StoredProcedure [dbo].[spEditarReservacion]    Script Date: 4/28/2022 6:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEditarReservacion] 	
	@codigoReservacion int,
	@adultos int,
	@ninos int,
	@fechaLlegada datetime,
	@fechaSalida datetime,
	@cantidadNoches int,
	@montoHospedajeDetalle int,
	@montoHospedaje int,
	@montoHospedajeFinal int
AS
BEGIN	
	  UPDATE [dbo].[Reservaciones] 
		  SET adultos = @adultos,
			  ninos = @ninos,
			  fechaLlegada = @fechaLlegada,
			  fechaSalida = @fechaSalida,
			  cantidadNoches = @cantidadNoches,
			  montoHospedajeDetalle = @montoHospedajeDetalle,
			  montoHospedaje = @montoHospedaje,
			  montoHospedajeFinal = @montoHospedajeFinal
		  WHERE codigoReservacion = @codigoReservacion
END
