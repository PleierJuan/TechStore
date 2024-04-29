<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="estilo.css">
    <script src="app.js" async></script>
    <title>Tienda Tech | </title>
</head>
<body>
    <header class="head">
        <div class="logo">
            <a href="#"> Logo </a>
        </div>
        <div class="titulo">
            <h1>TIENDA TechStore</h1>
        </div> 
        <navegacion class="navegacion">
            <a href="#"> Inicio </a>
            <a href="#"> Nosotros </a>
            <a href="#"> Redes </a>
            <a href="#"> Contacto </a>
        </navegacion>              
    </header>
    <!--<navegacion class="navegacion">
        <a href="#"> Inicio </a>
        <a href="#"> Nosotros </a>
        <a href="#"> Redes </a>
        <a href="#"> Contacto </a>
    </navegacion>-->
    <section class="contenedor">
        <!-- Contenedor de elementos -->
        <div class="contenedor-items">
            <div class="item">
                <span class="titulo-item">iPhone</span>
                <img src="img/iphone.jpg" alt="" class="img-item">
                <span class="precio-item">$8.900</span>
                <button class="boton-item">Agregar al Carrito</button>
            </div>
            <div class="item">
                <span class="titulo-item">Audifonos Sony</span>
                <img src="img/audifonos.jpg" alt="" class="img-item">
                <span class="precio-item">$1.100</span>
                <button class="boton-item">Agregar al Carrito</button>
            </div>
            <div class="item">
                <span class="titulo-item">Camara Canon</span>
                <img src="img/camara.jpg" alt="" class="img-item">
                <span class="precio-item">$11.500</span>
                <button class="boton-item">Agregar al Carrito</button>
            </div>
            <div class="item">
                <span class="titulo-item">Monitor</span>
                <img src="img/monitor.jpg" alt="" class="img-item">
                <span class="precio-item">$900</span>
                <button class="boton-item">Agregar al Carrito</button>
            </div>
            <div class="item">
                <span class="titulo-item">Tenis Adidas</span>
                <img src="img/adidas.jpg" alt="" class="img-item">
                <span class="precio-item">$2.200</span>
                <button class="boton-item">Agregar al Carrito</button>
            </div>
            <div class="item">
                <span class="titulo-item">Hoddie Unisex</span>
                <img src="img/hoddie.jpg" alt="" class="img-item">
                <span class="precio-item">$380</span>
                <button class="boton-item">Agregar al Carrito</button>
            </div>
            <div class="item">
                <span class="titulo-item">Bocina Bluetooth</span>
                <img src="img/bocina.jpg" alt="" class="img-item">
                <span class="precio-item">$2.800</span>
                <button class="boton-item">Agregar al Carrito</button>
            </div>
            <div class="item">
                <span class="titulo-item">Tenis Nike</span>
                <img src="img/nike.jpg" alt="" class="img-item">
                <span class="precio-item">$999</span>
                <button class="boton-item">Agregar al Carrito</button>
            </div>
            <div class="item">
                <span class="titulo-item">Lentes de Sol</span>
                <img src="img/lentes.jpg" alt="" class="img-item">
                <span class="precio-item">$420</span>
                <button class="boton-item">Agregar al Carrito</button>
            </div>
            <div class="item">
                <span class="titulo-item">Laptop</span>
                <img src="img/laptop.jpg" alt="" class="img-item">
                <span class="precio-item">$13.400</span>
                <button class="boton-item">Agregar al Carrito</button>
            </div>
            <div class="item">
                <span class="titulo-item">Diario Hoja Blanca</span>
                <img src="img/diario.jpg" alt="" class="img-item">
                <span class="precio-item">$105</span>
                <button class="boton-item">Agregar al Carrito</button>
            </div>
            <div class="item">
                <span class="titulo-item">Repisa</span>
                <img src="img/repisa.jpg" alt="" class="img-item">
                <span class="precio-item">$600</span>
                <button class="boton-item">Agregar al Carrito</button>
            </div>
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
</body>
</html>