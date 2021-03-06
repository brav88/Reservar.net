using Reservar.net.Modelos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Reservar.net.Controladores
{
    public class Reservaciones
    {
        public List<Reservacion> ObtenerReservaciones(Usuario usuario)
        {
            List<SqlParameter> param = new List<SqlParameter>();
            List<Reservacion> listaReservaciones = new List<Reservacion>();

            param.Add(new SqlParameter("@email", usuario.Email));

            DataTable dt = Database.fillDTStoreProcedure("spObtenerReservaciones", param);

            foreach (DataRow dr in dt.Rows)
            {
                Reservacion reservacion = new Reservacion()
                {
                    CodigoReservacion = Convert.ToInt16(dr["codigoReservacion"]),
                    Codigo = Convert.ToInt16(dr["codigoDestino"]),
                    Email = dr["email"].ToString(),
                    Adultos = Convert.ToInt16(dr["adultos"]),
                    Ninos = Convert.ToInt16(dr["ninos"]),
                    FechaLlegada = Convert.ToDateTime(dr["fechaLlegada"]).ToShortDateString(),
                    FechaSalida = Convert.ToDateTime(dr["fechaSalida"]).ToShortDateString(),
                    CantidadNoches = Convert.ToInt16(dr["cantidadNoches"]),
                    MontoHospedajeFinal = Convert.ToInt32(dr["montoHospedajeFinal"]),
                    Foto = dr["foto"].ToString(),
                    Nombre = dr["nombre"].ToString()
                };

                listaReservaciones.Add(reservacion);
            }

            return listaReservaciones;
        }

        public Reservacion ObtenerReservacion(int codigoReservacion)
        {
            List<SqlParameter> param = new List<SqlParameter>();            

            param.Add(new SqlParameter("@codigoReservacion", codigoReservacion));

            DataTable dt = Database.fillDTStoreProcedure("spObtenerReservacion", param);

            if (dt.Rows.Count == 0) return null;

            Reservacion reservacion = new Reservacion()
            {
                CodigoReservacion = Convert.ToInt16(dt.Rows[0]["codigoReservacion"]),
                Codigo = Convert.ToInt16(dt.Rows[0]["codigoDestino"]),
                Email = dt.Rows[0]["email"].ToString(),
                Adultos = Convert.ToInt16(dt.Rows[0]["adultos"]),
                Ninos = Convert.ToInt16(dt.Rows[0]["ninos"]),
                FechaLlegada = Convert.ToDateTime(dt.Rows[0]["fechaLlegada"]).ToShortDateString(),
                FechaSalida = Convert.ToDateTime(dt.Rows[0]["fechaSalida"]).ToShortDateString(),
                CantidadNoches = Convert.ToInt16(dt.Rows[0]["cantidadNoches"]),
                MontoHospedajeFinal = Convert.ToInt32(dt.Rows[0]["montoHospedajeFinal"]),
                MontoHospedajeDetalle = Convert.ToInt32(dt.Rows[0]["montoHospedajeDetalle"]),
                MontoHospedaje = Convert.ToInt32(dt.Rows[0]["montoHospedaje"]),
                Foto = dt.Rows[0]["foto"].ToString(),
                Nombre = dt.Rows[0]["nombre"].ToString()
            };                

            return reservacion;
        }


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

        public void EditarReservacion(Reservacion reservacion)
        {
            List<SqlParameter> param = new List<SqlParameter>();

            param.Add(new SqlParameter("@codigoReservacion", reservacion.CodigoReservacion));            
            param.Add(new SqlParameter("@adultos", reservacion.Adultos));
            param.Add(new SqlParameter("@ninos", reservacion.Ninos));
            param.Add(new SqlParameter("@fechaLlegada", reservacion.FechaLlegada));
            param.Add(new SqlParameter("@fechaSalida", reservacion.FechaSalida));
            param.Add(new SqlParameter("@cantidadNoches", reservacion.CantidadNoches));
            param.Add(new SqlParameter("@montoHospedajeDetalle", reservacion.MontoHospedajeDetalle));
            param.Add(new SqlParameter("@montoHospedaje", reservacion.MontoHospedaje));
            param.Add(new SqlParameter("@montoHospedajeFinal", reservacion.MontoHospedajeFinal));

            Database.executeQuery("spEditarReservacion", param);
        }

        public void CancelarReservacion(int codigoReservacion)
        {
            List<SqlParameter> param = new List<SqlParameter>();

            param.Add(new SqlParameter("@codigoReservacion", codigoReservacion));

            Database.executeQuery("spCancelarReservacion", param);
        }
    }
}