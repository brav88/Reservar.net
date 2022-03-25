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
    public partial class Destinos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string session = Request.QueryString["session"];

            if (session == "false")
            {
                LoginInactivo();
            }

            if ((Usuario)Session["Login"] != null)
            {
                LoginActivo();
            }

            Controlador.Destinos controladorDestinos = new Controlador.Destinos();

            repDestinos.DataSource = controladorDestinos.ObtenerDestinos();
            repDestinos.DataBind();
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            Controlador.Usuarios controladorUsuarios = new Controlador.Usuarios();

            Usuario usuario = new Usuario()
            {
                Email = txtEmail.Value,
                Password = txtPassword.Value
            };

            if (controladorUsuarios.Login(usuario))
            {
                Session["Login"] = usuario;

                LoginActivo();
            }
            else
            {
                LoginInactivo();
            }
        }

        protected void CerrarSesion_Click(object sender, EventArgs e)
        {
            Session["Login"] = null;
            MostrarAlert("Gratis por su visita");
            MostrarCardLogin();
            CerrarSesion.Attributes.Add("hidden", "hidden");
        }

        public void LoginActivo()
        {
            Usuario usuario = (Usuario)Session["Login"];

            OcultarCardLogin();
            MostrarAlert("Bienvenido " + usuario.Email);
            lblName.InnerText = usuario.Email;
            CerrarSesion.Attributes.Remove("hidden");
            Reservaciones.Attributes.Remove("hidden");
        }

        public void MostrarCardLogin()
        {
            cardLogin.Attributes.Remove("hidden");
            cardUser.Attributes.Add("hidden", "hidden");
        }

        public void OcultarCardLogin()
        {
            cardUser.Attributes.Remove("hidden");
            cardLogin.Attributes.Add("hidden", "hidden");
        }

        public void LoginInactivo()
        {
            //login invalido
            txtEmail.Attributes.Add("class", "form-control is-invalid");
            txtPassword.Attributes.Add("class", "form-control is-invalid");
            divAlert.Attributes.Add("class", "alert alert-danger");
            divAlert.Attributes.Remove("hidden");
            lblAlert.InnerText = "Usuario no registrado";
        }

        public void MostrarAlert(string mensaje)
        {
            divAlert.Attributes.Add("class", "alert alert-info");
            divAlert.Attributes.Remove("hidden");
            lblAlert.InnerText = mensaje;
        }
    }
}