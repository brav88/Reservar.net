<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Destinos.aspx.cs" Inherits="Reservar.net.Vistas.Destinos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid ml-3" style="margin-top: 10%">
            <div class="row">

                <asp:Repeater ID="repDestinos" runat="server">
                    <ItemTemplate>
                        
                        <div class="card" style="width: 18rem;margin-left:2%">
                            <img src="<%# Eval("Foto") %>" class="card-img-top" />
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                <p class="card-text"><%# Eval("Descripcion") %></p>
                                <strong class="card-text">$<%# Eval("Precio") %> / p</strong>
                                <a style="float:right" href="Reservar.aspx?codigo=<%# Eval("Codigo") %>" class="btn btn-primary">Reservar</a>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>
    </form>
</body>
</html>
