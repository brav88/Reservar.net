USE [Reservar.net]
GO

/****** Object:  Table [dbo].[Reservaciones]    Script Date: 3/24/2022 6:44:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Reservaciones](
	[codigoReservacion] [int] IDENTITY(1,1) NOT NULL,
	[codigoDestino] [int] NULL,
	[email] [varchar](50) NOT NULL,
	[adultos] [int] NOT NULL,
	[ninos] [int] NOT NULL,
	[fechaLlegada] [datetime] NOT NULL,
	[fechaSalida] [datetime] NOT NULL,
	[cantidadNoches] [int] NOT NULL,
	[montoHospedajeDetalle] [int] NOT NULL,
	[montoHospedaje] [int] NOT NULL,
	[montoHospedajeFinal] [int] NOT NULL
CONSTRAINT [PK_Reservaciones] PRIMARY KEY CLUSTERED 
(
	[codigoReservacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



