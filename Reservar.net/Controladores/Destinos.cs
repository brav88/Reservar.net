using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Reservar.net.Modelos;

namespace Reservar.net.Controladores
{
    public class Destinos
    {
        public List<Destino> ObtenerDestinos()
        {
            List<Destino> destinos = new List<Destino>();

            Destino destino1 = new Destino()
            {
                Codigo = 1,
                Nombre = "Hotel Papagayo Resort",
                Descripcion = "Disfruta de tus vacaciones con todo incluido en Costa Rica en el fabuloso hotel sólo para adultos Occidental Papagayo - Adults only. ¡Reserva ahora!",
                Foto = "/Assets/images/HPR.jpg",
                Precio = 250
            };

            Destino destino2 = new Destino()
            {
                Codigo = 2,
                Nombre = "Holiday Inn San José",
                Descripcion = "Sitio oficial de Holiday Inn San Jose-Aurola. Opiniones de clientes y reservas con nuestra garantía de mejor precio. Alojamiento y comida gratuitos para ...",
                Foto = "/Assets/images/HIS.jpg",
                Precio = 350
            };

            Destino destino3 = new Destino()
            {
                Codigo = 3,
                Nombre = "Puntarenas Hilton Resort",
                Descripcion = "Encuentra lo Que Necesitas en Reservar.net, la Web de Viajes Más Grande Del Mundo. Fiesta Resort All Inclusive Central Pacific.",
                Foto = "/Assets/images/PHR.jpg",
                Precio = 450
            };

            Destino destino4 = new Destino()
            {
                Codigo = 4,
                Nombre = "Puntarenas Hilton Resort",
                Descripcion = "Encuentra lo Que Necesitas en Reservar.net, la Web de Viajes Más Grande Del Mundo. Fiesta Resort All Inclusive Central Pacific.",
                Foto = "/Assets/images/PHR.jpg",
                Precio = 450
            };

            destinos.Add(destino1);
            destinos.Add(destino2);
            destinos.Add(destino3);
            destinos.Add(destino4);

            return destinos;
        }

        public List<Destino> ObtenerDestino(int codigo)
        {            
            List<Destino> destinos = ObtenerDestinos();

            foreach (Destino destino in destinos)
            {
                if (destino.Codigo == codigo)
                {
                    destinos.Clear();
                    destinos.Add(destino);

                    return destinos;
                }
            }

            return null;
        }
    }
}