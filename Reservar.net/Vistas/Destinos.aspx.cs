using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controlador = Reservar.net.Controladores;

namespace Reservar.net.Vistas
{
    public partial class Destinos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Controlador.Destinos controladorDestinos = new Controlador.Destinos();

            repDestinos.DataSource = controladorDestinos.ObtenerDestinos();
            repDestinos.DataBind();
        }
    }
}