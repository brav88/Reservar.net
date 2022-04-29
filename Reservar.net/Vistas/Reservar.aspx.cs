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
                    Int16 codigo = Convert.ToInt16(Request.QueryString["codigo"]);
                    Int16 codigoReservacion = Convert.ToInt16(Request.QueryString["codigoReservacion"]);

                    Controlador.Destinos destinos = new Controlador.Destinos();
                    List<Modelo.Destino> lista = destinos.ObtenerDestino(codigo);
                    repDestinos.DataSource = lista;
                    repDestinos.DataBind();
                    lblMontoNoche.InnerText = lista[0].Precio.ToString();

                    if (codigoReservacion > 0)
                    {
                        Controlador.Reservaciones reservaciones = new Controlador.Reservaciones();
                        Reservacion reservacion = reservaciones.ObtenerReservacion(codigoReservacion);
                                                
                        lblMontoNocheDetalle.InnerText = reservacion.MontoHospedajeDetalle.ToString();
                        lblCantidadNoches.InnerText = reservacion.CantidadNoches.ToString();
                        lblMontoHospedaje.InnerText = reservacion.MontoHospedaje.ToString();
                        lblMontoHospedajeFinal.InnerText = reservacion.MontoHospedajeFinal.ToString();
                        dtLlegada.Value = Convert.ToDateTime(reservacion.FechaLlegada).ToString("yyyy-MM-dd");
                        dtSalida.Value = Convert.ToDateTime(reservacion.FechaSalida).ToString("yyyy-MM-dd");
                        intAdultos.Value = reservacion.Adultos.ToString();
                        intNinos.Value = reservacion.Ninos.ToString();

                        btnGuardarReservacion.InnerText = "Editar";
                    }
                    else
                    {                                                                        
                        lblMontoNocheDetalle.InnerText = lista[0].Precio.ToString();
                        lblCantidadNoches.InnerText = "4";
                        lblMontoHospedaje.InnerText = (lista[0].Precio * 4).ToString();
                        lblMontoHospedajeFinal.InnerText = ((lista[0].Precio * 4) + 9422 + 15740).ToString();

                        dtLlegada.Value = DateTime.Now.AddDays(15).ToString("yyyy-MM-dd");
                        dtSalida.Value = DateTime.Now.AddDays(19).ToString("yyyy-MM-dd");
                        intAdultos.Value = "1";
                        intNinos.Value = "0";                        
                    }                  
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
                Int16 codigoReservacion = Convert.ToInt16(Request.QueryString["codigoReservacion"]);
                Usuario usuario = (Usuario)Session["Login"];

                //TODO: re-calcular montos
                int cantidadNoches = (Convert.ToDateTime(dtSalida.Value) - Convert.ToDateTime(dtLlegada.Value)).Days;
                int detalle = Convert.ToInt32(lblMontoNocheDetalle.InnerText);
                int montoHospedajeDetalle = Convert.ToInt16(intAdultos.Value) > 2 ? (Convert.ToInt16(detalle * 0.13)) + detalle : detalle;
                int montoHospedaje = montoHospedajeDetalle * cantidadNoches;
                int montoHospedajeFinal = montoHospedaje + 9422 + 15740;

                Reservacion reservacion = new Reservacion()
                {
                    CodigoReservacion = codigoReservacion,
                    Codigo = codigoDestino,
                    Email = usuario.Email,
                    Adultos = Convert.ToInt16(intAdultos.Value),
                    Ninos = Convert.ToInt16(intNinos.Value),
                    FechaLlegada = Convert.ToDateTime(dtLlegada.Value).ToShortDateString(),
                    FechaSalida = Convert.ToDateTime(dtSalida.Value).ToShortDateString(),
                    CantidadNoches = cantidadNoches,
                    MontoHospedajeDetalle = montoHospedajeDetalle,
                    MontoHospedaje = montoHospedaje,
                    MontoHospedajeFinal = montoHospedajeFinal
                };

                Controlador.Reservaciones reservaciones = new Controlador.Reservaciones();

                if (codigoReservacion > 0)
                {
                    reservaciones.EditarReservacion(reservacion);
                    Response.Redirect("reservaciones.aspx", false);
                }
                else
                {
                    reservaciones.GuardarReservacion(reservacion);
                    MostrarAlert("Reservación guardada con éxito", "info");
                }                    
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