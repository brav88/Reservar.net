using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Reservar.net.Modelos;

namespace Reservar.net.Controladores
{
    public class Destinos
    {
        public List<Destino> ObtenerDestinos(string criterio)
        {
            List<Destino> listaDestinos = new List<Destino>();
            List<SqlParameter> param = new List<SqlParameter>();
            List<Reservacion> listaReservaciones = new List<Reservacion>();
            param.Add(new SqlParameter("@desc", criterio));

            DataTable dt = Database.fillDTStoreProcedure("spObtenerDestinos", param);

            foreach(DataRow dr in dt.Rows)
            {
                Destino destino = new Destino()
                {
                    Codigo = Convert.ToInt16(dr["codigo"]),
                    Nombre = dr["nombre"].ToString(),
                    Descripcion = dr["descripcion"].ToString(),
                    Foto = dr["foto"].ToString(),
                    Precio = Convert.ToDouble(dr["precio"])
                };

                listaDestinos.Add(destino);
            }

            return listaDestinos;           
        }

        public List<Destino> ObtenerDestino(int codigo)
        {            
            List<Destino> destinos = ObtenerDestinos("%%");

            foreach(Destino destino in destinos.Where(d => d.Codigo.Equals(codigo)))
            {
                destinos.Clear();
                destinos.Add(destino);

                return destinos;
            }           

            return null;
        }
    }
}