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
            if ((Usuario)Session["Login"] != null)
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
            else
            {
                Response.Redirect("Destinos.aspx?session=false");
            }
        }

        protected void btnGuardarReservacion_Click(object sender, EventArgs e)
        {
            try
            {
                Int16 codigoDestino = Convert.ToInt16(Request.QueryString["codigo"]);
                Usuario usuario = (Usuario)Session["Login"];

                //TODO: re-calcular montos

                Reservacion reservacion = new Reservacion()
                {
                    Codigo = codigoDestino,
                    Email = usuario.Email,
                    Adultos = Convert.ToInt16(intAdultos.Value),
                    Ninos = Convert.ToInt16(intNinos.Value),
                    FechaLlegada = Convert.ToDateTime(dtLlegada.Value).ToShortDateString(),
                    FechaSalida = Convert.ToDateTime(dtSalida.Value).ToShortDateString(),
                    CantidadNoches = Convert.ToInt16(lblCantidadNoches.InnerText),
                    MontoHospedajeDetalle = Convert.ToInt32(lblMontoNocheDetalle.InnerText),
                    MontoHospedaje = Convert.ToInt32(lblMontoHospedaje.InnerText),
                    MontoHospedajeFinal = Convert.ToInt32(lblMontoHospedajeFinal.InnerText)
                };

                Controlador.Reservaciones reservaciones = new Controlador.Reservaciones();

                reservaciones.GuardarReservacion(reservacion);

                MostrarAlert("Reservación guardada con éxito", "info");
            }
            catch
            {
                MostrarAlert("Error al guardar reservación", "danger");
            }
        }

        public void MostrarAlert(string mensaje, string tipoMensaje)
        {
            divAlert.Attributes.Add("class", "alert alert-" + tipoMensaje);
            divAlert.Attributes.Remove("hidden");
            lblAlert.InnerText = mensaje;
        }
    }
}