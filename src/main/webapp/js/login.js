function validarLogin() {

    var modalInstance = M.Modal.getInstance(document.getElementById('modalValidaLogin'));
    var modalValidaLogin = document.getElementById("msgModalValidaLogin");

    if (document.getElementById("usuario").value === "") {
        modalValidaLogin.innerHTML = "No se ingreso * Usuario";
        modalInstance.open();
        return false;
    }
    if (document.getElementById("contrasena").value === "") {
        modalValidaLogin.innerHTML = "No se ingreso * Contrasena";
        modalInstance.open();
        return false;
    }


}


