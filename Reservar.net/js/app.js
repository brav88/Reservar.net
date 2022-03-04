function showMessage(msg) {

    const message = document.querySelector("#message");

    var html = "<div class='modal' id='myModal' tabindex='-1'> " +
        "    <div class='modal-dialog modal-dialog-centered' >" +
        "        <div class='modal-content'>" +
        "            <div class='modal-header'>" +
        "                <h5 class='modal-title'>Validación</h5>" +
        "           <button type='button' class='btn-close' data-bs-dismiss='modal' aria-label='Close'>" +                    
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