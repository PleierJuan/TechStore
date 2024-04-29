<div class="navbar-fixed">

    <!--menu grande-->
    <nav class="blue-grey darken-4">
        <div class="nav-wrapper">
            <ul>
                <li><img src="img/favicon.ico" width="65" height="65">&nbsp;&nbsp;&nbsp;&nbsp;</li>            
                <li><a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a></li>
                <li><img src='img/techstore.jpg' height="65">&nbsp;&nbsp;&nbsp;&nbsp;</li>
                <li><i class="material-icons left">person</i><%=session.getAttribute("nombre") + " " + session.getAttribute("apellidoP") + " " + session.getAttribute("apellidoM")%> </li>
            </ul>
            <ul id="nav-mobile" class="right hide-on-med-and-down">

                <li><a href="inicio.jsp"><i class="material-icons circle left">home</i>Inicio</a></li>
                <%
                        //System.out.println("idUsuario " + session.getAttribute("idUsuario"));
                        int idUsuario = (Integer)session.getAttribute("idUsuario");
                        List<PermisoDTO> permisos = new PermisosJDBC().consultaPermisosUsuario(idUsuario);
                        for(PermisoDTO permiso: permisos){
                %>
                <% if(permiso.getIdPermisoDescripcion()==1){%>
                <li><a href="usuarios.jsp"><i class="material-icons circle left">account_box</i>Usuarios</a></li>
                <% } %>
                <%
                    }
                %>
                
                <li><a href="marcas.jsp"><i class="material-icons circle left">assignment</i>Productos</a></li>
                <li><a href="CerrarSesion"><i class="material-icons circle left">directions_run</i>Salir</a></li>                           
            </ul>

        </div>

    </nav>

</div>

<%--Menu desplegable--%>  
<ul class="sidenav" id="mobile-demo">

    <li ><a href="inicio.jsp"><i class="material-icons circle left">home</i>Inicio</a></li>
    <%
                 
                    for(PermisoDTO permiso: permisos){
    %>
    <% if(permiso.getIdPermisoDescripcion()==1){%>
    <li><a href="usuarios.jsp"><i class="material-icons circle left">account_box</i>Usuarios</a></li>
    <% } %>
    <li><a href="marcas.jsp"><i class="material-icons circle left">assignment</i>Productos</a></li>
    
    <%
            }
    %>
    <li ><a href="CerrarSesion"><i class="material-icons circle left">directions_run</i>Salir</a></li>      
</ul>
