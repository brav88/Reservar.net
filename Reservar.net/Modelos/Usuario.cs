using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Reservar.net.Modelos
{
    public class Usuario
    {
        public int Id { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Nombre { get; set; }
        public string Foto { get; set; }
    }
}