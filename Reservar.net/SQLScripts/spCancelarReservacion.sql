USE [Reservar.net]
GO
/****** Object:  StoredProcedure [dbo].[spCancelarReservacion]    Script Date: 3/31/2022 9:06:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spCancelarReservacion] 		
	@codigoReservacion INT
AS
BEGIN	
	DELETE FROM Reservaciones WHERE codigoReservacion = @codigoReservacion
END
