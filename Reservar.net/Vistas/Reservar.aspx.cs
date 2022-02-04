using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controlador = Reservar.net.Controladores;
using Modelo = Reservar.net.Modelos;

namespace Reservar.net.Vistas
{
    public partial class Reservar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Int16 Codigo = Convert.ToInt16(Request.QueryString["codigo"]);
                        
            Controlador.Destinos destinos = new Controlador.Destinos();

            List<Modelo.Destino> lista = destinos.ObtenerDestino(Codigo);

            repDestinos.DataSource = lista;
            repDestinos.DataBind();          
        }
    }
}