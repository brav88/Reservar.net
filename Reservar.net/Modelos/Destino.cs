using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Reservar.net.Modelos
{
    public class Destino
    {
        public int Codigo { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string Foto { get; set; }
        public double Precio { get; set; }
    }
}