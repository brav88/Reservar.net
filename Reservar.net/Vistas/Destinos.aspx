<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Destinos.aspx.cs" Inherits="Reservar.net.Vistas.Destinos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet"
        id="theme_link"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.1.2/lumen/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
                        <a class="nav-link" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">Mi perfil</a>
                    </li>
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
                </ul>
            </div>
        </nav>

        <div class="container-fluid ml-3" style="margin-top: 1%">
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

        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
            <div class="offcanvas-header primary-color">
                <h5 id="offcanvasRightLabel" style="color: white">Bienvenido a Reservar.net</h5>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div class="card" id="cardLogin" runat="server">
                    <div class="card-body">
                        <div class="form-floating mb-3">
                            <input runat="server" type="email" class="form-control" id="txtEmail" placeholder="name@example.com" />
                            <label for="floatingInput">Email</label>
                        </div>
                        <div class="form-floating">
                            <input runat="server" type="password" class="form-control" id="txtPassword" placeholder="Password" />
                            <label for="floatingPassword">Password</label>
                        </div>
                    </div>
                    <div class="card-footer">
                        <button id="btnLogin" runat="server" class="btn btn-primary" style="width: 100%" onserverclick="Login_Click">Login</button>
                    </div>
                </div>
                <div class="card" id="cardUser" runat="server" hidden="hidden" style="margin-top: 15%">
                    <div class="card">
                        <div class="card-body text-center">
                            <img src="https://bootdey.com/img/Content/avatar/avatar7.png" style="width: 100px; margin-top: -65px" alt="User" class="img-fluid img-thumbnail rounded-circle border-0 mb-3" />
                            <h5 class="card-title">Braulio Sandi</h5>
                            <p class="text-secondary mb-1">Senior Software Engineer</p>
                            <p class="text-muted font-size-sm">Ciudad Colón, Mora</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="message">
        </div>       
        <script src="../js/app.js"></script>
    </form>
</body>
</html>
