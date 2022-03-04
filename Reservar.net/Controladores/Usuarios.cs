using Reservar.net.Modelos;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;

namespace Reservar.net.Controladores
{
    public class Usuarios
    {
        const string firebaseUrl = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=";
        const string apiKey = "AIzaSyANt85KwRr3bpoO7-GW-BQta2bpl2-af5g";

        public bool Login(Usuario usuario)
        {
            try
            {
                var request = (HttpWebRequest)WebRequest.Create(firebaseUrl + apiKey);
                var data = "email=" + usuario.Email + "&password=" + usuario.Password;
                var bytes = Encoding.ASCII.GetBytes(data);

                request.Method = "POST";
                request.ContentType = "application/x-www-form-urlencoded";
                request.ContentLength = bytes.Length;

                using (var stream = request.GetRequestStream())
                {
                    stream.Write(bytes, 0, bytes.Length);
                }

                var response = (HttpWebResponse)request.GetResponse();
                var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();

                if (responseString.Contains(usuario.Email))
                {
                    return true;
                }
                else 
                {
                    return false;
                }                
            }
            catch
            {
                return false;
            }
        }
    }
}