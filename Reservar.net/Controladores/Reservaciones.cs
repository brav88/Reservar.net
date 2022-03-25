using Reservar.net.Modelos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Reservar.net.Controladores
{
    public class Reservaciones
    {
        public void GuardarReservacion(Reservacion reservacion)
        {
            List<SqlParameter> param = new List<SqlParameter>();

            param.Add(new SqlParameter("@codigoDestino", reservacion.Codigo));
            param.Add(new SqlParameter("@email", reservacion.Email));
            param.Add(new SqlParameter("@adultos", reservacion.Adultos));
            param.Add(new SqlParameter("@ninos", reservacion.Ninos));
            param.Add(new SqlParameter("@fechaLlegada", reservacion.FechaLlegada));
            param.Add(new SqlParameter("@fechaSalida", reservacion.FechaSalida));
            param.Add(new SqlParameter("@cantidadNoches", reservacion.CantidadNoches));
            param.Add(new SqlParameter("@montoHospedajeDetalle", reservacion.MontoHospedajeDetalle));
            param.Add(new SqlParameter("@montoHospedaje", reservacion.MontoHospedaje));
            param.Add(new SqlParameter("@montoHospedajeFinal", reservacion.MontoHospedajeFinal));

            Database.executeQuery("spGuardarReservacion", param);
        }
    }
}