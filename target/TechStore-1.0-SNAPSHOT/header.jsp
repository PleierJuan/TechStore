<%@page import="beanDTO.UsuarioDTO"%>
<%@page import="datos.UsuarioJDBC"%>
<%@page import="beanDTO.PermisoDTO"%>
<%@page import="datos.PermisosJDBC"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="beanDTO.MarcasDTO"%>
<%@page import="datos.MarcasJDBC"%>
<%@page import="datos.VariablesGlobales" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesion = request.getSession();   
    String currentURL = null;
    String queryString = null;    
    //si es nulo es la primera vez que accedemos a la aplicacion
    currentURL = request.getRequestURL().toString();
    queryString = request.getQueryString();
    if (queryString != null) {
        currentURL += "?" + queryString;
    }
    session.setAttribute("urlSinSesion", currentURL);
    if (session.getAttribute("nombre") == null) {     
%>
<jsp:forward page="index.jsp" />
<%  
    } 
%>
<!DOCTYPE html>
<html>
    <head>
        <!--favicon-->
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
        <link rel="icon" href="img/favicon.ico" type="image/x-icon">
        <title> TechSTORE</title>
        <!-- DataTable -->
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>  
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>  
        <!-- DataTables Buttons CSS -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.4.2/css/buttons.dataTables.min.css">
        <!-- DataTables Buttons JavaScript -->
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/2.4.2/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.html5.min.js"></script>	
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.print.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.colVis.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>


        <!--Estilo de Plantilla -->
        <link type="text/css" rel="stylesheet" href="css/plantilla.css"  media="screen,projection"/>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <!--Dropzone carga de archivos-->
        <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <link href="css/inicio.css" rel="stylesheet" type="text/css"/>
        
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/estilo.css">
        <script src="js/app.js" async></script>
</head>
<script>

</script>
<body>
    <%@include file="menu.jsp" %>
    <div id="modalValidaCampos" class="modal">
            <div class="modal-content">
                <div class="valign-wrapper">
                    <i class="large material-icons red-text">error</i> <!-- Icono de alerta -->
                    <p class="inline-text" ><h5 id="msgModalValidaCampos"></h5></p> <!-- Mensaje -->
                </div>


            </div>
            <div class="modal-footer">
                <a href="#!" class="modal-close waves-effect waves-green btn-flat">Cerrar</a> <!-- Botón de cierre -->
            </div>
        </div>
    
    <div id="footer">
        <p style="text-align:'center'" class="center white-text blue-grey darken-4">COPYRIGHT © 2024 TECHSTORE S.A. DE C.V. TODOS LOS DERECHOS RESERVADOS &nbsp;&nbsp;&nbsp;&nbsp;<a style="background-color:black" href="https://twitter.com/techstoremx"> TWITTER </a>&nbsp;&nbsp;&nbsp;&nbsp;<a style="background-color:black" href="https://www.facebook.com/upiicsa.ipn.oficial/"> FACEBOOK </a></p>
        
    </div>        
</body>

