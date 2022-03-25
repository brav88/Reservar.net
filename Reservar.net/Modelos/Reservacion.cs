using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Reservar.net.Modelos
{
    public class Reservacion : Destino
    {
        public int CodigoReservacion { get; set; }
        public string Email { get; set; }
        public int Adultos{ get; set; }
        public int Ninos { get; set; }
        public DateTime FechaLlegada { get; set; }
        public DateTime FechaSalida { get; set; }
        public int CantidadNoches { get; set; }
        public int MontoHospedajeDetalle { get; set; }
        public int MontoHospedaje { get; set; }
        public int MontoHospedajeFinal { get; set; }
    }
}