<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reservar.aspx.cs" Inherits="Reservar.net.Vistas.Reservar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet"
        id="theme_link"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.1.2/lumen/bootstrap.min.css" />    
    <link href="../css/mdb.min.css" rel="stylesheet" />
    <link href="../css/navbar-fixed-left.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../css/navbar-fixed-left.min.css" />
    <link rel="stylesheet" href="../css/docs.css" />
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/app.js"></script>
    <script type="text/javascript">

        function CalcularMontoHospedaje() {

            const lblMontoHospedaje = document.querySelector("#lblMontoHospedaje");

            var montoNocheDetalle = lblMontoNocheDetalle.innerText;
            var rangoDias = lblCantidadNoches.innerText;
            var montoHospedaje = parseInt(montoNocheDetalle * rangoDias)

            lblMontoHospedaje.innerText = montoHospedaje;
            lblMontoHospedajeFinal.innerText = (montoHospedaje + 9422 + 15740);
        }

        function CalcularMontoNocheDetalle() {
            const lblMontoNocheDetalle = document.querySelector("#lblMontoNocheDetalle");
            const lblMontoNoche = document.querySelector("#lblMontoNoche");
            const intAdultos = document.querySelector("#intAdultos");
            const montoNoche = parseInt(lblMontoNoche.innerText);

            if (intAdultos.value > 2) {                
                var impuesto = (montoNoche * 0.13);
                lblMontoNocheDetalle.innerText = montoNoche + impuesto;
            }
            else {
                lblMontoNocheDetalle.innerText = montoNoche;
            }

            CalcularMontoHospedaje();
        }

        function CalcularCantidadNoches()
        {
            const lblCantidadNoches = document.querySelector("#lblCantidadNoches");
            const dtLlegada = new Date(document.querySelector("#dtLlegada").value);
            const dtSalida = new Date(document.querySelector("#dtSalida").value);            
            var rangoDias = Math.ceil((dtSalida.getTime() - dtLlegada.getTime()) / (86400000));

            if (dtSalida > dtLlegada) {
                if (rangoDias > 0) {
                    lblCantidadNoches.innerText = rangoDias;
                }
            }
            else {
                alert('Fecha llegada no puede ser mas alta que la fecha salida.');                                
            }

            CalcularMontoHospedaje();
        }
    </script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-md navbar-dark bg-primary fixed-left">
            <a class="navbar-brand" href="#">Reservar.com</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault"
                aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="destinos.aspx">Destinos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="reservaciones.aspx">Mis reservaciones</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">Mi carrito</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">Contacténos</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Configuracion</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="login.aspx">Cerrar sesión</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>

        <div id="divAlert" hidden="hidden" role="alert" runat="server">
            <label id="lblAlert" runat="server"></label>
        </div>

        <div class="container-fluid ml-3" style="margin-top: 1%">
            <div class="row">
                <asp:Repeater ID="repDestinos" runat="server">
                    <ItemTemplate>
                        <div class="card" style="width: 18rem; margin-left: 2%">
                            <img src="<%# Eval("Foto") %>" class="card-img-top" />
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                <p class="card-text"><%# Eval("Descripcion") %></p>
                                <strong class="card-text">₡<%# Eval("Precio") %> / p</strong>
                                <a style="float: right" href="Destinos.aspx" class="btn btn-primary">Regresar</a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <div class="card" style="width: 30rem; margin-left: 2%">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <h5 class="card-title"><strong>₡<label id="lblMontoNoche" runat="server"></label></strong>
                                    <label style="font-size: small">/ noche</label></h5>
                            </div>
                            <div class="col">
                                <h6 class="card-subtitle mb-2 text-muted" style="float: right">4.95 · 97 reseñas</h6>
                            </div>
                        </div>
                        <hr />
                        <div class="row mb-2">
                            <div class="col">
                                Llegada<br />
                                <input runat="server" type="date" class="form-control" id="dtLlegada" onchange="CalcularCantidadNoches()" />
                            </div>
                            <div class="col">
                                Salida<br />
                                <input runat="server" type="date" class="form-control" id="dtSalida" onchange="CalcularCantidadNoches()" />
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                Adultos
                                <br />
                                <input runat="server" type="number" class="form-control" id="intAdultos" min="1" max="4" onclick="CalcularMontoNocheDetalle()" />
                            </div>
                            <div class="col">
                                Niños
                                <br />
                                <input runat="server" type="number" class="form-control" id="intNinos" min="0" max="3" />
                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col">
                                <p style="text-align: center">No se hará ningún cargo por el momento</p>
                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col"><u>₡ <label runat="server" id="lblMontoNocheDetalle"></label> x 
                                                  <label runat="server" id="lblCantidadNoches"></label> noches</u></div>
                            <div class="col text-end">₡ <label runat="server" id="lblMontoHospedaje"></label></div>
                        </div>
                        <div class="row mb-2">
                            <div class="col"><u>Tarifa de limpieza</u></div>
                            <div class="col text-end">₡9422</div>
                        </div>
                        <div class="row mb-2">
                            <div class="col"><u>Tarifa por servicio</u></div>
                            <div class="col text-end">₡15740</div>
                        </div>
                        <hr />
                        <div class="row mb-2">
                            <div class="col"><strong>Total</strong> </div>
                            <div class="col text-end"><strong>₡ <label runat="server" id="lblMontoHospedajeFinal"></label></strong></div>
                        </div>
                        <hr />
                        <div class="row mb-2">
                            <div class="col mb-2">
                                <button runat="server" id="btnGuardarReservacion" class="btn btn-primary" onserverclick="btnGuardarReservacion_Click">Reservar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
