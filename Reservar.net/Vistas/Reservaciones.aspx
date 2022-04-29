<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reservaciones.aspx.cs" Inherits="Reservar.net.Vistas.Reservaciones" %>

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
    <title>Mis reservaciones</title>
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
                <asp:Repeater ID="repReservaciones" runat="server">
                    <ItemTemplate>
                        <div class="card" style="width: 18rem; margin-left: 2%; margin-top: 1%">
                            <img src="<%# Eval("Foto") %>" class="card-img-top" style="width: 265px; height: 230px" />
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("nombre") %></h5>
                                <div class="row mb-2">
                                    <div class="col">
                                        Cantidad noches: <%# Eval("cantidadNoches") %>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col">
                                        Entrada:
                                        <p class="card-text"><%# Eval("fechaLlegada") %></p>
                                    </div>
                                    <div class="col">
                                        Salida:
                                        <p class="card-text"><%# Eval("fechaSalida") %></p>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col">
                                        Adultos:
                                        <p class="card-text"><%# Eval("adultos") %></p>
                                    </div>
                                    <div class="col">
                                        Niños:
                                        <p class="card-text"><%# Eval("ninos") %></p>
                                    </div>
                                </div>
                                Coste: <strong class="card-text">₡<%# Eval("montoHospedajeFinal") %></strong>
                                <hr />
                                <div class="row mb-2">
                                    <button type="button" class="btn btn-success" onclick="redirect('Reservar.aspx?codigo=<%# Eval("codigo") %>&codigoReservacion=<%# Eval("codigoReservacion") %>')">Editar</button>
                                    <button class="btn btn-danger" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">Cancelar</button>
                                    <div class="collapse" id="collapseExample">
                                        <div class="card card-body" style="width: 250px;">
                                            ¿Esta seguro que desea cancelar la reservación?
                                            <br />
                                            <button type="button" class="btn btn-danger" onclick="redirect('CancelarReservacion.aspx?codigoReservacion=<%# Eval("codigoReservacion") %>')">Si Cancelar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <script type="text/javascript">
            function redirect(url) {
                window.location.href = url, true;
            }
        </script>
    </form>
</body>
</html>
