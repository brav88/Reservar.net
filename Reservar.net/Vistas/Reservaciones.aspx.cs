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
    public partial class Reservaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if ((Usuario)Session["Login"] != null)
                {
                    Controlador.Reservaciones reservaciones = new Controlador.Reservaciones();
                    Usuario usuario = (Usuario)Session["Login"];

                    repReservaciones.DataSource = reservaciones.ObtenerReservaciones(usuario);
                    repReservaciones.DataBind();
                }
            }             
        }
    }
}