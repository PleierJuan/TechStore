<%@page import="beanDTO.UsuarioDTO"%>
<%@page import="datos.UsuarioJDBC"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
    <head>
        <!--favicon-->
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
        <link rel="icon" href="img/favicon.ico" type="image/x-icon">
        <title>TechStore</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <style>
            
        </style>



    </head>

    <body>
        <!-- Modal Structure -->
        <div id="modalValidaLogin" class="modal">
            <div class="modal-content">
                <div class="valign-wrapper">
                    <i class="large material-icons red-text">error</i> <!-- Icono de alerta -->
                    <p class="inline-text" ><h5 id="msgModalValidaLogin"></h5></p> <!-- Mensaje -->
                </div>


            </div>
            <div class="modal-footer">
                <a href="#!" class="modal-close waves-effect waves-green btn-flat">Cerrar</a> <!-- Botón de cierre -->
            </div>
        </div>
        
        <div id="header">
            <img src="img/favicon.png" alt="" class="logoHeader"/>
            <img src='img/techstore.jpg' height="50">
            
        </div>
       
        <div id="footer"></div>