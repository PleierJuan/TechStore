<%@include file="header.jsp" %>
<script>

</script>
<div id="contenido">
    <!--Modal Permisos-->
    <div id="modalPermisos" class="modal">


        <form action="Usuarios" method="post" id="formPermisosUsuarios">
            <div class="modal-content">
                <div class="modal-content">
                    <ul class="collection">
                        <li class="collection-item avatar">
                            <i class="material-icons left circle medium">do_not_disturb_alt</i><h5><span id="nombrePermisos"></span></h5>
                        </li>
                    </ul>
                </div>

                <input type="hidden" name="idUsuarioPermisos" id="idUsuarioPermisos" value="0"></input>

                <p><label><input type="checkbox" class="filled-in darken-1" name="administrarUsuario" id="administrarUsuario" value="1" ><span><b>Administrar usuarios:</b> Módulo para crear, eliminar, actualizar usuarios, incluyendo sus perfiles y privilegios o responsabilidades.</span></label></p>                    
                <p><label><input type="radio" class="filled-in darken-1" name="inventario" id="administrarInventario" value="2" ><span><b>Administrar inventario y resguardos:</b> Módulo para agregar, eliminar o actualizar los inventarios y resguardos.</span></label></p>
                <p><label><input type="radio" class="filled-in darken-1" name="inventario" id="consultarInventario" value="3" ><span><b>Consultar inventario y resguardo:</b> Módulo para consultar los inventarios y resguardos, sin modificaciones. </span></label></p>
                <p><label><input type="checkbox" class="filled-in darken-1" name="administrarCatalogos" id="administrarCatalogos" value="4" ><span><b>Administrar catalogos:</b> Módulo para administrar los catalogos que existen en el sistema.</span></label></p>
            </div>
            <div class="modal-footer">
                <button class="btn waves-effect waves-light cyan darken-3" type="submit" name="permisos" id="permisos"
                        value="AgregarPrivilegios">Agregar Privilegios </button>            
            </div>
        </form>
    </div>
    <!-- Modal Structure -->
    <div id="editarUsuario" class="modal">
        <form action="Usuarios" method="post" >
            <div class="container">
                <div class="modal-content">
                    <ul class="collection">
                        <li class="collection-item avatar">
                            <i class="material-icons left circle medium">mode_edit</i><h5>Editar usuario</h5>
                        </li>
                    </ul>
                </div>
                <div class="modal-content">

                    <p><input type="hidden" id="idUsuario" name="idUsuario" value="0" ></p>
                    <div class="input-field col l12 m6 s12">
                        <input placeholder="Nombre" id="nombreE" name="nombreE" type="text" class="validate">
                        <label for="first_name">Nombre</label>
                    </div>
                    <div class="input-field col l12 m6 s12">
                        <input placeholder="Apellido Paterno" id="apellidoPE" name="apellidoPE" type="text" class="validate">
                        <label for="first_name">Apellido Paterno</label>
                    </div>
                    <div class="input-field col l12 m6 s12">
                        <input placeholder="Apellido Materno" id="apellidoME" name="apellidoME" type="text" class="validate">
                        <label for="first_name">Apellido Materno</label>
                    </div>
                    <div class="input-field col l12 m6 s12">
                        <input placeholder="Nombre Usuario" id="nomUsuarioE" name="nomUsuarioE" type="text" onkeyup="buscarUsuario(this.value);" class="validate">
                        <label for="first_name">Nombre Usuario</label>
                        <pan id="validaUsuarioE"></pan>
                    </div>
                    <div class="input-field col l12 m6 s12">
                        <input placeholder="Contraseña" id="contrasenaE" name="contrasenaE" type="text" class="validate">
                        <label for="first_name">Contraseña</label>
                    </div>
                    <div class="input-field col l12 m6 s12">
                        <input placeholder="Confirmar Contrasena" id="valContrasenaE" name="valContrasenaE" type="text" class="validate">
                        <label for="first_name">Confirmar Contraseña</label>
                    </div>
                    <div class="input-field col l12 m6 s12">
                        <input placeholder="Correo" id="correoE" name="correoE" type="text" class="validate">
                        <label for="first_name">Correo electrónico</label>
                    </div>
                </div>
                <div class="modal-footer">

                    <button class="btn waves-effect waves-light cyan darken-3" type="submit" name="editarUsuario" id="editarUsuario" onclick="return validarEdicionUsuario()">Editar
                        <i class="material-icons right">edit</i>
                    </button>

                </div>
            </div>
        </form>
    </div>
    <br>
    <div class="container">
        <h3>
            <ul>
                <li class="collection-item avatar">
                    <i class="material-icons circle left large">people</i>Usuarios
                </li>
            </ul>
        </h3>
        <div class="divider"></div>
        <button data-target="agregarUsuario" class="btn modal-trigger cyan darken-3">Agregar Usuario <i class="material-icons left">add</i></button>
        <br><br>
        <div class="divider"></div>
    </div>
    <div id="agregarUsuario" class="modal">

        <form method="post" action="Usuarios">
            <div class="container">
                <div class="modal-content">
                    <ul class="collection">
                        <li class="collection-item avatar">
                            <i class="material-icons left circle medium">person_add</i><h5>Registro de usuario</h5>
                        </li>
                    </ul>
                </div>               
                <div class="row">
                    <div class="input-field col l12 m6 s12">
                        <input placeholder="Nombre" id="nombre" name="nombre" type="text" class="validate">
                        <label for="first_name">Nombre</label>
                    </div>
                    <div class="input-field col l12 m6 s12">
                        <input placeholder="Apellido Paterno" id="apellidoP" name="apellidoP" type="text" class="validate">
                        <label for="first_name">Apellido Paterno</label>
                    </div>
                    <div class="input-field col l12 m6 s12">
                        <input placeholder="Apellido Materno" id="apellidoM" name="apellidoM" type="text" class="validate">
                        <label for="first_name">Apellido Materno</label>
                    </div>
                    <div class="input-field col l12 m6 s12">
                        <input placeholder="Nombre del usuario" id="nomUsuario" name="nomUsuario" type="text" onkeyup="buscarUsuario(this.value);" class="validate">
                        <label for="first_name">Nombre del usuario</label>
                        <pan id="validaUsuario"></pan>
                    </div>
                    <div class="input-field col l12 m6 s12">
                        <input placeholder="Contrasena" id="contrasena" name="contrasena" type="text" class="validate">
                        <label for="first_name">Contraseña</label>
                    </div>
                    <div class="input-field col l12 m6 s12">
                        <input placeholder="Confirmar Contrasena" id="valContrasena" name="valContrasena" type="text" class="validate">
                        <label for="first_name">Confirmar Contraseña</label>
                    </div>
                    <div class="input-field col l12 m6 s12">
                        <input placeholder="Correo Electronico" id="correo" name="correo" type="email" class="validate">
                        <label for="first_name">Correo Electrónico</label>
                        <span class="helper-text" data-error="Ingresa un correo válido" data-success="Correo válido"></span>
                    </div>
                    <div class="modal-footer">
                        <button class="btn waves-effect waves-light cyan darken-3" type="submit" name="gaurdarUsuario" id="gaurdarUsuario" onclick="return validarUsuario();">Guardar
                            <i class="material-icons right">save</i>
                        </button>


                    </div>
                </div>
            </div>
        </form> 
    </div>
    <%   
        int noUsuario = 0;
        List<UsuarioDTO> usuarioList = new ArrayList<>();
        // List<UsuarioDTO> usuarios = new ArrayList<>();
        UsuarioJDBC usuarioMetodos = new UsuarioJDBC();
        usuarioList = usuarioMetodos.consultaUsuarios();
    %>
    <div class="container">
        <input type="hidden" name="itemsPerPage" id="itemsPerPage" value="5">
        <input type="hidden" name="totalItems" id="totalItems" value="<%= usuarioList.size()%>">
        <table class="display "id="tablaUsuarios" >
            <thead>
                <tr>
                    <td>No.</td>
                    <td>Nombre</td>
                    <td>Apellido Paterno</td>
                    <td>Apellido Materno</td>
                    <td>Nombre Usuario</td>
                    <td>Correo</td>
                    
                    <td>Permisos</td>
                    <td>Eliminar</td>
                    <td>Editar</td>
                </tr>
            </thead>
            <tbody >
                <% for(UsuarioDTO usuario: usuarioList){ %>
                <tr>
                    <td><%= ++noUsuario%></td>
                    <td><%= usuario.getNombre()%></td>
                    <td><%= usuario.getApellidoP() %></td>
                    <td><%= usuario.getApellidoM()%></td>
                    <td><%= usuario.getNomUsuario()%></td>
                    <td><%= usuario.getCorreo()%></td>
                    <td><a  class=" modal-trigger" href="#modalPermisos" onclick="abrirModalPermisos(<%= usuario.getIdUsuario() %>,'<%= usuario.getNombre() + " " + usuario.getApellidoP() + " " +  usuario.getApellidoM()%>');cargarPermisos(<%= usuario.getIdUsuario() %>)"><i class="material-icons cyan-text">do_not_disturb_alt</i></a></td>
                    <td><a  href="#" onclick="confirmSubmit(<%=usuario.getIdUsuario()%>)" ><i class="material-icons cyan-text">delete_sweep</i></a></td>
                    <td><a  class=" modal-trigger" href="#editarUsuario" onclick="obtenerIdUsuario(<%= usuario.getIdUsuario() %>, '<%= usuario.getNombre() %>', '<%= usuario.getApellidoP() %>', '<%= usuario.getApellidoM() %>', '<%= usuario.getNomUsuario() %>', '<%= usuario.getCorreo() %>')"><i class="material-icons cyan-text">create</i></a></td>                    
                </tr>
                <%}%>
            </tbody>
            <tfoot>
                <tr>
                    <td>No.</td>
                    <td>Nombre</td>
                    <td>Apellido Paterno</td>
                    <td>Apellido Materno</td>
                    <td>Nombre Usuario</td>
                    <td>Correo</td>
                    
                    <td>Permisos</td>
                    <td>Eliminar</td>
                    <td>Editar</td>
                </tr>
            </tfoot>
        </table>

    </div>



</div>
<%@include file="footer.jsp" %>