
<%@include file="header.jsp"%>
<div class="container">
    <br>
    <h3>
        <ul>
            <li class="collection-item avatar">
                <i class="material-icons circle left large">copyright</i>Productos
            </li>
        </ul>
    </h3>

    <!-- Estructura Modal Insertar -->
    <!-- Modal Trigger -->

    <div class="divider"></div>
    <% if((Boolean)sesion.getAttribute("permiso2")==true){%>
    <a class="btn modal-trigger waves-effect cyan darken-3" href="#modal1" >
        <i class="material-icons left">add</i> Agregar Producto
    </a>
    <%}%>
    <div class="divider"></div>

    <div id="modal1" class="modal">
        <form action="Marcas" method="post">
            <div class="container">
                <div class="modal-content">
                    <ul class="collection">
                        <li class="collection-item avatar">
                            <i class="material-icons left circle medium">copyright</i><h5>Registrar Producto</h5>
                        </li>
                    </ul>
                </div>
                <div class="row">

                    <input type="hidden" name="idMarcas" id="idMarcas" value=""> 
                    <div class="col s12 m12 l12">
                        <label>Producto: </label>
                        <input placeholder="Producto" type="text" name="nomMar" id="nomMar" >
                    </div>
                    <div class="col s12 m12 l12">
                        <label>Descripción: </label>
                        <input placeholder="Descripcion" type="text" name="desc" id="desc" >
                    </div>
                    <div class="col s12 m12 l12">
                        <label>Precio: </label>
                        <input placeholder="Precio" type="number" step='0.01' name="precio" id="precio" >
                    </div>
                    <div class="col s12 m12 l12">
                        <label>Imagen: </label>
                        <input placeholder="Link de Imagen" type="text" name="img" id="img" >
                    </div>
                    <div class="right">
                        <br><br>
                        <button class="btn waves-effect waves-light cyan darken-3" type="submit" name="insertar" value="Insertar" onclick="return validarRegistrarMarca()">
                            GUARDAR <i class="material-icons right">save</i>
                        </button>
                    </div>

                </div>
            </div>
        </form>
    </div>

    <!-- Estructura Modal Editar -->
    <div id="modal2" class="modal">
        <form action="Marcas" method="post">
            <div class="container">
                <div class="modal-content">
                    <ul class="collection">
                        <li class="collection-item avatar">
                            <i class="material-icons left circle medium">create</i><h5>Editar Producto</h5>
                        </li>
                    </ul>
                </div>
                <div class="row">
                    <div hidden class="col s12 m12 l12">
                        <label>Id: </label><input type="text" name="idMarcas" id="idMarcasE" style="color:#787878; background-color: #f0f0f0;" readonly>
                    </div>
                    <div class="col s12 m12 l12">
                        <label>Producto: </label><input placeholder="Producto" type="text" name="nomMar" id="nomMarE"> 
                    </div>
                    <div class="col s12 m12 l12">
                        <label>Descripción: </label>
                        <input placeholder="Descripcion" type="text" name="desc" id="descE" >
                    </div>
                    <div class="col s12 m12 l12">
                        <label>Precio: </label>
                        <input placeholder="Precio" type="number" step='0.01'  name="precio" id="precioE" >
                    </div>
                    <div class="col s12 m12 l12">
                        <label>Imagen: </label>
                        <input placeholder="Link de Imagen" type="text" name="img" id="imgE" >
                    </div>
                    <div class="right">
                        <br><br>
                        <button class="btn waves-effect waves-light cyan darken-3" type="submit" name="insertar" value="Editar" onclick="return validarEdicionMarca()">
                            EDITAR <i class="material-icons right">create</i>
                        </button>
                    </div>

                </div>
            </div>

        </form>
    </div>

    <!-- Estructura Modal Eliminar -->
    <div id="modal3" class="modal">
        <form action="Marcas" method="get">
            <div class="container">
                <div class="modal-content">
                    <ul class="collection">
                        <li class="collection-item avatar">
                            <h4><i class="material-icons left medium" style="color: #E9D502">warning</i>¿ESTAS SEGURO DE QUE QUIERES ELIMINAR? </h4>

                            <h6>Esta acción no se puede deshacer.</h6>
                        </li>
                    </ul>
                </div>
                <div class="row">
                    <div hidden class="col s12 m12 l12">
                        <label>Id: </label><input type="text" name="idMarca" id="idMarcasX" style="color:#787878; background-color: #f0f0f0;" readonly>
                    </div>
                    <div class="col s12 m12 l12">
                        <label>Producto: </label><input placeholder="Marca" type="text" name="nomMar" id="nomMarX" style="color:#787878; background-color: #f0f0f0;" readonly>
                    </div>
                    <div class="right">
                        <br><br>
                        <button class="btn waves-effect waves-light cyan darken-3" type="submit" name="eliminar" value="ELIMINAR" onclick="return validarDesactivaMarca()">
                            Eliminar <i class="material-icons right " style="color: #E9D502">warning</i>
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    
    <%-- <table id="tablaCatalogosMarcas" class="display">
        <thead>
            <tr>
                <td>No. </td>
                <td>Marca </td>
                <% if((Boolean)sesion.getAttribute("permiso3")==false){%>
                <td>Eliminar</td>
                <td>Editar</td>
                <%}%>
            </tr>
        </thead>
        <%
            int numMarca = 0;
            List<MarcasDTO> marcas= new ArrayList<>();
            MarcasJDBC marcaMetodos=new MarcasJDBC();
            marcas = marcaMetodos.consultarMarcas();
            for (MarcasDTO marca: marcas){
        %>
        <tr>
            <td><%= ++numMarca%></td>
            <td><%= marca.getNomMar()%></td>
            <% if((Boolean)sesion.getAttribute("permiso3")==false){%>
            <td>
                <a class="modal-trigger" href="#modal3" onclick="eliminar(<%= marca.getIdMarca()%>, '<%= marca.getNomMar()%>')"><i class="material-icons cyan-text">delete_sweep</i></a>
            </td>
            <td>
                <a class="modal-trigger" href="#modal2" onclick="editar(<%= marca.getIdMarca()%>, '<%= marca.getNomMar()%>')"><i class="material-icons cyan-text">create</i></a>
            </td>
            <%}%>
        </tr>
        <%
            }
        %>
    </table> --%>
    <section class="contenedor">
        <div class="contenedor-items">
    
    <%
            List<MarcasDTO> marcas= new ArrayList<>();
            MarcasJDBC marcaMetodos=new MarcasJDBC();
            marcas = marcaMetodos.consultarMarcas();
            for (MarcasDTO marca: marcas){
        %>
        <div class="item">
                <span class="titulo-item"><%= marca.getNomMar()%></span>
                <b><%= marca.getDesc()%></b>
                <img src="<%= marca.getImagen()%>" class="img-item" width>
                <span style="font-family: Arial, Helvetica, sans-serif;" class="precio-item">$ <%= marca.getPrecio()%></span>
                <% if((Boolean)sesion.getAttribute("permiso2")==true){%>
                <span class="precio-item">
                <a class="modal-trigger" href="#modal3" onclick="eliminar(<%= marca.getIdMarca()%>, '<%= marca.getNomMar()%>')"><i class="material-icons cyan-text">delete_sweep</i></a>
                <a class="modal-trigger" href="#modal2" onclick="editar(<%= marca.getIdMarca()%>, '<%= marca.getNomMar()%>', '<%= marca.getDesc()%>', '<%= marca.getPrecio()%>', '<%= marca.getImagen()%>')"><i class="material-icons cyan-text">create</i></a>
                
                </span>
                <%} else {%>
                <button class="boton-item">Agregar al Carrito</button>
                <%
                    }
                %>
            </div>
        <%
            }
        %>
        </div>
        
        <!-- Carrito de Compras -->
        <div class="carrito" id="carrito">
            <div class="header-carrito">
                <h2>Tu Carrito</h2>
            </div>

            <div class="carrito-items">
                <!-- 
                <div class="carrito-item">
                    <img src="img/boxengasse.png" width="80px" alt="">
                    <div class="carrito-item-detalles">
                        <span class="carrito-item-titulo">Box Engasse</span>
                        <div class="selector-cantidad">
                            <i class="fa-solid fa-minus restar-cantidad"></i>
                            <input type="text" value="1" class="carrito-item-cantidad" disabled>
                            <i class="fa-solid fa-plus sumar-cantidad"></i>
                        </div>
                        <span class="carrito-item-precio">$15.000,00</span>
                    </div>
                   <span class="btn-eliminar">
                        <i class="fa-solid fa-trash"></i>
                   </span>
                </div>
                <div class="carrito-item">
                    <img src="img/skinglam.png" width="80px" alt="">
                    <div class="carrito-item-detalles">
                        <span class="carrito-item-titulo">Skin Glam</span>
                        <div class="selector-cantidad">
                            <i class="fa-solid fa-minus restar-cantidad"></i>
                            <input type="text" value="3" class="carrito-item-cantidad" disabled>
                            <i class="fa-solid fa-plus sumar-cantidad"></i>
                        </div>
                        <span class="carrito-item-precio">$18.000,00</span>
                    </div>
                   <button class="btn-eliminar">
                        <i class="fa-solid fa-trash"></i>
                   </button>
                </div>
                 -->
            </div>
            <div class="carrito-total">
                <div class="fila">
                    <strong>Tu Total</strong>
                    <span class="carrito-precio-total">
                        $120.000,00
                    </span>
                </div>
                <button class="btn-pagar">Pagar <i class="fa-solid fa-bag-shopping"></i> </button>
            </div>
        </div>
        
    </section>
</div>
<%@include file="footer.jsp" %>