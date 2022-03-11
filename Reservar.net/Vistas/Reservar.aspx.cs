using Reservar.net.Modelos;
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
            if (!IsPostBack)
            {
                Int16 Codigo = Convert.ToInt16(Request.QueryString["codigo"]);

                Controlador.Destinos destinos = new Controlador.Destinos();

                List<Modelo.Destino> lista = destinos.ObtenerDestino(Codigo);

                lblMontoNoche.InnerText = lista[0].Precio.ToString();
                lblMontoNocheDetalle.InnerText = lista[0].Precio.ToString();
                lblCantidadNoches.InnerText = "4";
                lblMontoHospedaje.InnerText = (lista[0].Precio * 4).ToString();
                lblMontoHospedajeFinal.InnerText = ((lista[0].Precio * 4) + 9422 + 15740).ToString();

                dtLlegada.Value = DateTime.Now.AddDays(15).ToString("yyyy-MM-dd");
                dtSalida.Value = DateTime.Now.AddDays(19).ToString("yyyy-MM-dd");
                intAdultos.Value = "1";
                intNinos.Value = "0";

                repDestinos.DataSource = lista;
                repDestinos.DataBind();
            }
        }

        protected void btnGuardarReservacion_Click(object sender, EventArgs e)
        {
            Reservacion reservacion = new Reservacion()
            {
                Id = 1,
                Email = "",
                Codigo = 1
            };
        }
    }
}