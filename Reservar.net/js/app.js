
function onCart(object, idn, correo) {
    $('#' + object).addClass("animated rubberBand");
    $('#' + object).addClass("disabled");

    //Metodo C# guardar carrito
    PageMethods.GuardarCarrito(idn, correo, onSucess, onError);

    function onSucess(result) {
        var x = document.getElementById("snackbar");
        x.className = "show";
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
    }

    function onError(result) {
        alert('Cannot process your request at the moment, please try later.');
    }
}

function cargarReservacion(idn) {
    document.getElementById("txtCodigo").value = idn;
}

function showMessage(msg) {

    const message = document.querySelector("#message");

    var html = "<div class='modal' data-backdrop='static' id='myModal' tabindex='-1' role='dialog'> " +
        "    <div class='modal-dialog modal-dialog-centered' >" +
        "        <div class='modal-content'>" +
        "            <div class='modal-header'>" +
        "                <h5 class='modal-title'>Validación</h5>" +
        "           <button type='button' class='close' data-dismiss='modal' aria-label='Close'>" +
        "               <span aria-hidden='true'>&times;</span>" +
        "            </button>" +
        "        </div>" +
        "        <div class='modal-body'>" +
        "            <p>" + msg + "</p>" +
        "        </div>" +
        "        <div class='modal-footer'>" +
        "            <button type='button' class='btn btn-primary' data-dismiss='modal'>Ok</button>" +
        "        </div>" +
        "    </div>" +
        "</div >" +
        "</div >";

    message.innerHTML = html;

    $("#myModal").modal('show');

    $(function () {
        $("#btnShow").click(function () {
            showModal();
        });
    });
}