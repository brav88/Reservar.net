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
                                <input runat="server" type="date" class="form-control" id="llegada" />
                            </div>
                            <div class="col">
                                Salida<br />
                                <input runat="server" type="date" class="form-control" id="salida" />
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                Adultos
                                <br />
                                <input runat="server" type="number" class="form-control" id="adultos" min="1" max="5" />
                            </div>
                            <div class="col">
                                Niños
                                <br />
                                <input runat="server" type="number" class="form-control" id="Number1" min="0" max="5" />
                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col">
                                <p style="text-align: center">No se hará ningún cargo por el momento</p>
                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col"><u>₡20,414 x 5 noches</u></div>
                            <div class="col text-end">₡102,068</div>
                        </div>
                        <div class="row mb-2">
                            <div class="col"><u>Tarifa de limpieza</u></div>
                            <div class="col text-end">₡9,422</div>
                        </div>
                        <div class="row mb-2">
                            <div class="col"><u>Tarifa por servicio</u></div>
                            <div class="col text-end">₡15,740</div>
                        </div>
                        <hr />
                        <div class="row mb-2">
                            <div class="col"><strong>Total</strong> </div>
                            <div class="col text-end"><strong>₡127,230</strong></div>
                        </div>
                        <hr />
                        <div class="row mb-2">
                            <div class="col mb-2">
                                <asp:Button class="btn-primary" ID="btnReservar" runat="server" Text="Reserva" Style="width: 100%; height: 40px; border-radius: 5px 5px 5px 5px" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
