USE [Reservar.net]
GO

/****** Object:  StoredProcedure [dbo].[spObtenerDestinos]    Script Date: 17/2/2022 19:42:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGuardarReservacion] 	
	@codigoDestino int,
	@email varchar(50),
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
	INSERT INTO [dbo].[Reservaciones]
           ([codigoDestino]
           ,[email]
           ,[adultos]
           ,[ninos]
           ,[fechaLlegada]
           ,[fechaSalida]
           ,[cantidadNoches]
           ,[montoHospedajeDetalle]
           ,[montoHospedaje]
           ,[montoHospedajeFinal])
     VALUES
           (@codigoDestino
           ,@email
           ,@adultos
           ,@ninos
           ,@fechaLlegada
           ,@fechaSalida
           ,@cantidadNoches
           ,@montoHospedajeDetalle
           ,@montoHospedaje
           ,@montoHospedajeFinal)
END
GO