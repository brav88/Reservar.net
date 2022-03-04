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
                //Login valido
                cardLogin.Attributes.Add("hidden", "hidden");
                cardUser.Attributes.Remove("hidden");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showMessage('Login realizado con exito')", true);
            }
            else
            {
                //login invalido
                txtEmail.Attributes.Add("class", "form-control is-invalid");
                txtPassword.Attributes.Add("class", "form-control is-invalid");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showMessage('Usuario no registrado en el sistema')", true);
            }
        }

    }
}