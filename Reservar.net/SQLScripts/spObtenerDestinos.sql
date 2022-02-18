USE [Reservar.net]
GO

/****** Object:  StoredProcedure [dbo].[spObtenerDestinos]    Script Date: 17/2/2022 19:42:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spObtenerDestinos] 	
AS
BEGIN
	SELECT 
		codigo,
		nombre,
		descripcion,
		foto,
		precio
	FROM Destinos
END
GO


