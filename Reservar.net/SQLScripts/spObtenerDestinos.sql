USE [Reservar.net]
GO
/****** Object:  StoredProcedure [dbo].[spObtenerDestinos]    Script Date: 4/28/2022 9:08:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spObtenerDestinos] 	
	@desc VARCHAR(50)
AS
BEGIN
	SELECT 
		codigo,
		nombre,
		descripcion,
		foto,
		precio
	FROM Destinos
	WHERE nombre like @desc
END
