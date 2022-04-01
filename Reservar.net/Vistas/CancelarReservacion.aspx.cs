using Reservar.net.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controlador = Reservar.net.Controladores;

namespace Reservar.net.Vistas
{
    public partial class CancelarReservacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int codigoReservacion = Convert.ToInt16(Request.QueryString["codigoReservacion"]);

            Controlador.Reservaciones reservaciones = new Controlador.Reservaciones();

            reservaciones.CancelarReservacion(codigoReservacion);

            Response.Redirect("Reservaciones.aspx");
        }
    }
}