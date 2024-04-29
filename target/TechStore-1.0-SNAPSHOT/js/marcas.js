
function editar(id, nomMar, desc, precio, img) {
    document.getElementById("idMarcasE").value = id;
    document.getElementById("nomMarE").value = nomMar;
    document.getElementById("descE").value = desc;
    document.getElementById("precioE").value = precio;
    document.getElementById("imgE").value = img;
}

function eliminar(id, nomMar) {
    document.getElementById("idMarcasX").value = id;
    document.getElementById("nomMarX").value = nomMar;
}

function validarEdicionMarca() {

    var modalInstance = M.Modal.getInstance(document.getElementById('modalValidaCampos'));
    var modalValidaCampos = document.getElementById("msgModalValidaCampos");
    if (document.getElementById("nomMarE").value === "") {
        modalValidaCampos.innerHTML = "Falta llenar el campo requerido * Marca";
        modalInstance.open();
        return false;
    }
    if (document.getElementById("descE").value === "") {
        modalValidaCampos.innerHTML = "Falta llenar el campo requerido * Descripcion";
        modalInstance.open();
        return false;
    }
    if (document.getElementById("precioE").value === ("" || ".")) {
        modalValidaCampos.innerHTML = "Falta llenar el campo requerido * Precio";
        modalInstance.open();
        return false;
    }if (document.getElementById("precioE").value < 0) {
        modalValidaCampos.innerHTML = "El precio tiene que ser mayor o igual a 0";
        modalInstance.open();
        return false;
    }
    if (document.getElementById("imgE").value === "") {
        modalValidaCampos.innerHTML = "Falta llenar el campo requerido * Imagen";
        modalInstance.open();
        return false;
    }
}

function validarRegistrarMarca() {

    var modalInstance = M.Modal.getInstance(document.getElementById('modalValidaCampos'));
    var modalValidaCampos = document.getElementById("msgModalValidaCampos");
    if (document.getElementById("nomMar").value === "") {
        modalValidaCampos.innerHTML = "Falta llenar el campo requerido * Producto";
        modalInstance.open();
        return false;
    }
    if (document.getElementById("desc").value === "") {
        modalValidaCampos.innerHTML = "Falta llenar el campo requerido * Descripcion";
        modalInstance.open();
        return false;
    }
    if (document.getElementById("precio").value === ("" || ".")) {
        modalValidaCampos.innerHTML = "Falta llenar el campo requerido * Precio";
        modalInstance.open();
        return false;
    }if (document.getElementById("precio").value < "0") {
        modalValidaCampos.innerHTML = "El precio tiene que ser mayor o igual a 0";
        modalInstance.open();
        return false;
    }
    if (document.getElementById("img").value === "") {
        modalValidaCampos.innerHTML = "Falta llenar el campo requerido * Imagen";
        modalInstance.open();
        return false;
    }
    
}

//DataTable
$('#tablaCatalogosMarcas').DataTable({
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