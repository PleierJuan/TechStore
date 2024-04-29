function validarUsuario() {

    var modalInstance = M.Modal.getInstance(document.getElementById('modalValidaCampos'));
    var modalValidaCampos = document.getElementById("msgModalValidaCampos");
    
    if (document.getElementById("nombre").value === "") {
        modalValidaCampos.innerHTML = "Falta llenar el campo requerido * Nombre";
        modalInstance.open();
        return false;
    }
    if (document.getElementById("apellidoP").value === "") {
        modalValidaCampos.innerHTML = "Falta llenar el campo requerido * Apellido Paterno";
        modalInstance.open();
        return false;
    }
    if (document.getElementById("apellidoM").value === "") {
        modalValidaCampos.innerHTML = "Falta llenar el campo requerido * Apellido Materno";
        modalInstance.open();
        return false;
    }
    if (document.getElementById("nomUsuario").value === "") {
        modalValidaCampos.innerHTML = "Falta llenar el campo requerido * Nombre del Usuario";
        modalInstance.open();
        return false;
    }
    if (document.getElementById("validaUsuario").innerHTML !== "") {
        modalValidaCampos.innerHTML = "Oops, parece ya existe el nombre de usuario...";
        modalInstance.open();
        return false;
    }
    if (document.getElementById("contrasena").value === "") {
        modalValidaCampos.innerHTML = "Falta llenar el campo requerido * Contrasena";
        modalInstance.open();
        return false;
    }
    if (document.getElementById("valContrasena").value === "") {
        modalValidaCampos.innerHTML = "Falta llenar el campo requerido * Repetir Contrasena";
        modalInstance.open();
        return false;
    }
    if (document.getElementById("correo").value === "") {
        modalValidaCampos.innerHTML = "Falta llenar el campo requerido * Correo";
        modalInstance.open();
        return false;
    }
    if (document.getElementById("contrasena").value !== document.getElementById("valContrasena").value) {
        modalValidaCampos.innerHTML = "Las contrasenas no coinciden, intentalo de nuevo";
        modalInstance.open();
        return false;
    }
}

function validarEdicionUsuario() {

    var modalInstance = M.Modal.getInstance(document.getElementById('modalValidaCampos'));
    var modalValidaCampos = document.getElementById("msgModalValidaCampos");
    if (document.getElementById("nombreE").value === "") {
        modalValidaCampos.innerHTML = "Falta llenar el campo requerido * Nombre";
        modalInstance.open();
        return false;
    }
    if (document.getElementById("apellidoPE").value === "") {
        modalValidaCampos.innerHTML = "Falta llenar el campo requerido * Apellido Paterno";
        modalInstance.open();
        return false;
    }
    if (document.getElementById("apellidoME").value === "") {
        modalValidaCampos.innerHTML = "Falta llenar el campo requerido * Apellido Materno";
        modalInstance.open();
        return false;
    }
    if (document.getElementById("nomUsuarioE").value === "") {
        modalValidaCampos.innerHTML = "Falta llenar el campo requerido * Nombre del Usuario";
        modalInstance.open();
        return false;
    }
    if (document.getElementById("validaUsuarioE").innerHTML !== "") {
        modalValidaCampos.innerHTML = "Oops, parece ya existe el nombre de usuario...";
        modalInstance.open();
        return false;
    }
    if (document.getElementById("contrasenaE").value === "") {
        modalValidaCampos.innerHTML = "Falta llenar el campo requerido * Contrasena";
        modalInstance.open();
        return false;
    }
    if (document.getElementById("valContrasenaE").value === "") {
        modalValidaCampos.innerHTML = "Falta llenar el campo requerido * Repetir Contrasena";
        modalInstance.open();
        return false;
    }
    if (document.getElementById("correoE").value === "") {
        modalValidaCampos.innerHTML = "Falta llenar el campo requerido * Correo";
        modalInstance.open();
        return false;
    }
    if (document.getElementById("contrasenaE").value !== document.getElementById("valContrasenaE").value) {
        modalValidaCampos.innerHTML = "Las contrasenas no coinciden, intentalo de nuevo";
        modalInstance.open();
        return false;
    }
}

function obtenerIdUsuario(idUsuario, nombre, apellidoPaterno, apellidoMaterno, nomUsuario, correo) {
    document.getElementById("idUsuario").value = idUsuario;
    document.getElementById("nombreE").value = nombre;
    document.getElementById("apellidoPE").value = apellidoPaterno;
    document.getElementById("apellidoME").value = apellidoMaterno;
    document.getElementById("nomUsuarioE").value = nomUsuario;
    document.getElementById("correoE").value = correo;
}
//funciones para el modulo usuarios campo usuario
function buscarUsuario(nomUsuario) {

    var validaUsuario = document.getElementById("validaUsuario");
    $.ajax({
        type: "POST",
        url: "./buscarUsuario.jsp",
        data: "usuario=" + nomUsuario,
        success: function (text) {

            if (parseInt(text) === 0) {
                validaUsuario.innerHTML = '';
            } else {
                validaUsuario.innerHTML = 'El usuario: ' + nomUsuario + ' ya esta registrado';
                //alert('el usuario: ' + usuario + ' exite');
            }


        }
    });
}
//funciones para el modulo usuarios campo usuario
function buscarUsuarioEdicion(nomUsuario) {

    var validaUsuario = document.getElementById("validaUsuarioE");
    $.ajax({
        type: "POST",
        url: "./buscarUsuario.jsp",
        data: "usuario=" + nomUsuario,
        success: function (text) {

            if (parseInt(text) === 0) {
                validaUsuario.innerHTML = '';
            } else {
                validaUsuario.innerHTML = 'El usuario: ' + nomUsuario + ' ya esta registrado';
                //alert('el usuario: ' + usuario + ' exite');
            }


        }
    });
}
//eliminar usuario
function confirmSubmit(idUsuario) {
    var confirmed = window.confirm("Estas seguro de que deseas eliminar a este usuario?");
    if (confirmed) {
// Si el usuario confirmó, envía el formulario
        location.href = "Usuarios?idUsuario=" + idUsuario;
    } else {

// Si el usuario canceló, no se envía el formulario
// Puedes agregar aquí cualquier otra acción que desees realizar
    }
}
//DataTable
$('#tablaUsuarios').DataTable({
    columnDefs: [{width: 200, targets: 0}],
    fixedColumns: true,
    //paging: false,
    scrollCollapse: true,
    scrollX: true,   
    lengthMenu: [[5, 10, 20, -1], [5, 10, 20, 'Todos']],
    pageLength: 10,
    scrollY: 500,
    dom: 'Bfrtip',
    buttons: [
        {
            extend: 'copyHtml5',
            exportOptions: {
                columns: ':visible'
            }
        },
        {
            extend: 'excelHtml5',
            exportOptions: {
                columns: ':visible'
            }
        },
        
        {
            extend: 'pdfHtml5',
            exportOptions: {
                columns: ':visible'
            }
        },
        {
            extend: 'csvHtml5',
            exportOptions: {
                columns: ':visible'
            }
        },
        
        
         'print','colvis'
    ],
    language: {
        url: 'https://cdn.datatables.net/plug-ins/1.11.5/i18n/es-ES.json'
    }
});

//Permisos
function abrirModalPermisos(idUsuario, nombre) {
//alert(nombre);
    document.getElementById("idUsuarioPermisos").value = idUsuario;
    document.getElementById("nombrePermisos").innerHTML = nombre;
    var elem = document.getElementById("modalPermisos");
    var instance = M.Modal.getInstance(elem);
    instance.open();
}
function resetearPermisos() {
//    var progreso = document.getElementById('progreso');
//    progreso.style.display = "block";
    var administrarUsuario = document.getElementById('administrarUsuario');
    var administrarInventario = document.getElementById('administrarInventario');
    var consultarInventario = document.getElementById('consultarInventario');
    var administrarCatalogos = document.getElementById('administrarCatalogos');

    administrarUsuario.checked = false;
    administrarInventario.checked = false;
    consultarInventario.checked = false;
    administrarCatalogos.checked = false;

//    progreso.style.display = "none";

}
function cargarPermisos(idUsuario) {

//    var progreso = document.getElementById('progreso');
//    progreso.style.display = "block";
    
    
    var administrarUsuario = document.getElementById('administrarUsuario');
    var administrarInventario = document.getElementById('administrarInventario');
    var consultarInventario = document.getElementById('consultarInventario');
    var administrarCatalogos = document.getElementById('administrarCatalogos');
    
    resetearPermisos();


    $.ajax({
        type: "POST",
        url: "./consultarPermisos.jsp",
        data: "idUsuario=" + idUsuario,
        success: function (text) {
//alert(text);
            var arreglo = text.split('|');

            var tamanoArreglo = arreglo.length;
            //alert(arreglo);
            for (var i = 0; i < tamanoArreglo; i++) {
                //alert(arreglo[i]);

                switch (arreglo[i]) {
                    case "1":
                        //alert(arreglo[i]);
                        administrarUsuario.checked = true;
                        break;
                    case "2":
                        administrarInventario.checked = true;
                        break;
                    case "3":
                        consultarInventario.checked = true;
                        break;
                    case "4":
                        administrarCatalogos.checked = true;
                        break;                   

                }

            }
        }
    });
    //progreso.style.display = "none";
}


