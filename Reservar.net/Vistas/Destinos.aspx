<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Destinos.aspx.cs" Inherits="Reservar.net.Vistas.Destinos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet"
        id="theme_link"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/4.3.1/lumen/bootstrap.min.css" />    
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

        <div class="container-fluid ml-3" style="margin-top: 10%">
            <div class="row">

                <asp:Repeater ID="repDestinos" runat="server">
                    <ItemTemplate>

                        <div class="card" style="width: 18rem; margin-left: 2%; margin-top: 1%">
                            <img src="<%# Eval("Foto") %>" class="card-img-top" />
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                <p class="card-text"><%# Eval("Descripcion") %></p>
                                <strong class="card-text">$<%# Eval("Precio") %> / p</strong>
                                <a style="float: right" href="Reservar.aspx?codigo=<%# Eval("Codigo") %>" class="btn btn-primary">Reservar</a>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>
    </form>
</body>
</html>
