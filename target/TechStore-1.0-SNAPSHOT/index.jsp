<%@include file="headerLogin.jsp" %>
<%//VERIFICA SI EXISTE UN ERROR EN EL INICIO DE SESION
    if (request.getParameter("error") != null) {
%>
<br>
<br>
<br>
<div class="container">
    <div class="alert card red lighten-4 red-text text-darken-4">
        <div class="card-content">
            <p><i class="material-icons">report</i><span><%= request.getParameter("error")%></span></p>
        </div>
    </div>
</div>
<%
    }
%>
<br>
<br>
<br>
<P></P><!-- comment -->
<P></P>
<div id="contenido">
    <div class="container">
        <div class="row">
            <div class="col s6 offset-s3 z-depth-6 card-panel">
                <form action="Login" method="post">
                    <br><br>
                    <div class="row" style="margin-bottom: 1vh;">                
                        <p style="font-size:20px" class="center"><b>Bienvenidos a Techstore<br/></p>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">perm_identity</i>
                            <input class="validate" type="text" name="usuario" id="usuario"><label data-error="wrong" data-success="right">Usuario</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">lock_outline</i>
                            <label>Contraseña</label><input type="password" name="contrasena" id="contrasena">
                        </div>
                    </div>

                    <div class="row">
                        <div class="input-field col s12">
                            <button href="#" class="btn waves-effect waves-light col s6 offset-s3 blue-grey darken-4" type="submit"
                                    value="InicioSesion" name="inicioSesion" onclick="return validarLogin();">Iniciar sesion</button>
                        </div>
                    </div>
                </form>
            </div>
        </div> 
    </div>
</div>
<%@include file="footer.jsp" %>