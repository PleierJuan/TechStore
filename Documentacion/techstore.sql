-- phpMyAdmin SQL Dump
-- version 3.4.9
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 07-05-2024 a las 00:03:51
-- Versión del servidor: 5.5.20
-- Versión de PHP: 5.3.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `techstore`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE IF NOT EXISTS `marcas` (
  `id_marca` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text,
  `descripcion` varchar(450) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `imagen` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id_marca`, `nombre`, `descripcion`, `precio`, `imagen`) VALUES
(1, 'iPhone 14', '128GB, 12MP, iOS 16', 13489, 'https://m.media-amazon.com/images/I/611mRs-imxL._AC_UF894,1000_QL80_.jpg'),
(2, 'GeForce RTX 3060', 'NVIDIA 12G OC, 12GB 192-bit GDDR6, PCI Express 4.0', 5639, 'https://m.media-amazon.com/images/I/71tduSp8ooL._AC_UF894,1000_QL80_.jpg'),
(3, 'Mouse Logitech G502 Hero', 'Mouse Gamer Ergonómico Logitech Óptico, Alámbrico, USB, 16.000DPI', 919, 'https://www.cyberpuerta.mx/img/product/M/CP-LOGITECH-910-005550-1.jpg'),
(4, 'Laptop Dell Inspiron 3520', '5.6" Full HD, Intel Core i5-1235U 3.30GHz, 16GB, 512GB SSD', 10259, 'https://www.cyberpuerta.mx/img/product/M/CP-DELL-Y0DCG-f12e04.jpg'),
(5, 'Gabinete Corsair SPEC-05', 'Ventana LED Rojo, Midi-Tower, ATX, USB 3.0, con Fuente de 550W, 1 Ventilador Instalado', 1379, 'https://coregaming.com.mx/assets/uploads/sw_00_50.jpg?1615526296'),
(6, 'JBL Charge Essential 2', 'Altavoz portátil resistente al agua con batería integrada', 2449, 'https://www.jbl.com.mx/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw118a4fca/1_JBL_CHARGE_ESSENTIAL_2_HERO_31487_x1.png?sw=537&sfrm=png'),
(7, 'Nintendo Consola Switch', '32GB Version 1.1 - Standard Edition', 4645, 'https://assets.nintendo.com/image/upload/f_auto/q_auto/dpr_1.5/c_scale,w_300/ncom/en_US/switch/refresh/switchindock'),
(8, '65" Crystal UHD 4K CU7000', 'Television Inteligente Samsung SmartThings', 10200, 'https://images.samsung.com/is/image/samsung/p6pim/latin/un65cu7000pxpa/gallery/latin-uhd-4k-tv-un65cu7000pxpa-front-black-536876551?$650_519_PNG$'),
(9, 'ELGATO HD60 X', 'Streaming o graba contenido de alta resolución para públicos de cualquier plataforma 4K60 HDR10', 6280, 'https://www.elgato.com/_next/image?url=https%3A%2F%2Fres.cloudinary.com%2Felgato-pwa%2Fimage%2Fupload%2Fv1678958535%2FProducts%2F10GBE9901%2Fabove-the-fold%2Fdesktop%2Fhd60-x-01_amfdni.jpg&w=1920&q=85'),
(10, 'Amongos', 'Peluche Among Us Impostor Sonic Hedgehog Erizo Nuckles Mini', 123.45, 'https://http2.mlstatic.com/D_NQ_NP_705886-MLM52221062590_102022-O.webp'),
(11, 'Bose SoundSport', ' Auriculares deportivos inalámbricos', 3732, 'https://http2.mlstatic.com/D_NQ_NP_840123-MLA40851507066_022020-O.webp'),
(12, 'Google Chromecast 3ra Gen', 'Transmite desde android y iPhone Resolución estándar completa de 1080 p', 1090, 'https://resources.claroshop.com/medios-plazavip/mkt/63053218e3e97_img_20220823_150055_-600_x_600_p-xel-jpg.jpg'),
(13, 'Mevo Inicio', 'Transmisión en vivo de forma inalámbrica en 1080p HD y control remoto', 6000.1, 'https://m.media-amazon.com/images/I/61TkjiMyxyL.jpg'),
(14, 'HyperX SoloCast', 'Micrófono Condensador USB Patrón Polar cardioide', 1069, 'https://m.media-amazon.com/images/I/616Iboh1sJL._AC_SL1500_.jpg'),
(17, 'Prueba', 'Producto de prueba', 100, 'https://dmn-dallas-news-prod.cdn.arcpublishing.com/resizer/yf16mgkTjPYKQykaOA7NCTJ6vls=/1660x934/smart/filters:no_upscale()/cloudfront-us-east-1.images.arcpublishing.com/dmn/A5TCT26E7VFVHBLPTHDPNDHHIM.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos_descripcion`
--

CREATE TABLE IF NOT EXISTS `permisos_descripcion` (
  `id_permiso_descripcion` int(11) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_permiso_descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `permisos_descripcion`
--

INSERT INTO `permisos_descripcion` (`id_permiso_descripcion`, `descripcion`) VALUES
(1, 'administrar usuarios'),
(2, 'administrar contratos'),
(3, 'consultar contratos'),
(4, 'administrar catalogos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos_usuario`
--

CREATE TABLE IF NOT EXISTS `permisos_usuario` (
  `id_permiso_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuarios` int(11) DEFAULT NULL,
  `id_permiso_descripcion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_permiso_usuario`),
  KEY `FK_permisos_descripcion_idx` (`id_permiso_descripcion`),
  KEY `FK_usuarios_idx` (`id_usuarios`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=346 ;

--
-- Volcado de datos para la tabla `permisos_usuario`
--

INSERT INTO `permisos_usuario` (`id_permiso_usuario`, `id_usuarios`, `id_permiso_descripcion`) VALUES
(114, 66, 1),
(115, 66, 3),
(116, 66, 4),
(151, 58, 1),
(152, 58, 2),
(153, 58, 4),
(170, 77, 1),
(171, 77, 2),
(172, 77, 4),
(325, 11, 1),
(326, 11, 2),
(327, 11, 4),
(331, 96, 1),
(332, 96, 2),
(333, 96, 4),
(337, 90, 1),
(338, 90, 2),
(339, 90, 4),
(340, 101, 3),
(342, 102, 3),
(343, 103, 1),
(344, 103, 2),
(345, 103, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuarios` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text,
  `apellido_paterno` text,
  `apellido_materno` text,
  `usuario` text,
  `contrasena` text,
  `correo` text,
  `fk_resguardatario` int(11) DEFAULT NULL,
  `salt` text,
  `activo` int(11) DEFAULT '1',
  PRIMARY KEY (`id_usuarios`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=105 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuarios`, `nombre`, `apellido_paterno`, `apellido_materno`, `usuario`, `contrasena`, `correo`, `fk_resguardatario`, `salt`, `activo`) VALUES
(1, 'ERROR', '', '', '', '', '', 0, '', 0),
(11, 'Emilio René', 'Rodríguez', 'García', 'rene', 'HQSGGTk24Cqq6EcpHWUdTg==:MGGAf2vAt9B29gq8EVmjdQ==', 'rene@gmail.com', 0, 'SecureRandom', 1),
(54, 'prueba', 'prueba', 'prueba', 'prueba', 'Z1hdi38GOUibi2yrwn6fTg==:V+WJnJIkp+Vd3bjEoU3+JQ==', 'prueba@correo.com', 0, 'SecureRandom', 0),
(58, 'Mariana', 'Hernandez', 'Ledesma', 'Mari', 'xINCGhCEUx1U3GRdWNabjw==:mUolupVc0cU57A6f7hPPIg==', 'mari@gmail.com', 0, 'SecureRandom', 1),
(66, 'Ernesto ', 'Zarate', 'Curiel', 'ernesto', 'qRKMoSZVnE48iWSL7jiBJQ==:dIZX/nedRliXqCCu/XTLhg==', 'ernesto.curiel@canal22.org.mx', 0, 'SecureRandom', 1),
(72, 'Irma Viridiana', 'Valdez', 'Guerrero', 'viridiana', 'eFD9beQ98eYX4Aj95WhtTw==:B3Neq4IIBoeJlhhL2J4OFQ==', 'irma.guerrero@canal22.org.mx', 0, 'SecureRandom', 1),
(77, 'Pablo', 'Lopez', 'Granados', 'pablo', 'EfwU5OR6UxoYTYqUKeNBlQ==:xTtw8InQDe8SaDzvljnxzw==', 'pablo.granados@canal22.org.mx', 0, 'SecureRandom', 1),
(83, 'Usuario 44', 'para', 'Log', 'Log 4', 'zhZZwgZpMmuKdXOtlrSF/Q==:Ad6IxX6j7Ay5T04p8N4aWA==', 'log@log.com', 0, 'SecureRandom', 0),
(86, 'Usuario 97', 'Usuario 97', 'Usuario 97', 'Usuario_97', 'rIQ99Kar+gB23mlL/QIvgA==:6ok0JRJDtG1m+hxk4YKKDg==', 'usuario@gmail.com', 0, 'SecureRandom', 0),
(87, 'UsuarioPrueba', 'UsuarioPrueba', 'UsuarioPrueba', 'UsuarioPrueba', '5WigO4Pz16o+Lf1sA8qX8A==:k6XWjKufzpbtp5WL2QEF2Q==', 'usuario@gmail.com', 0, 'SecureRandom', 0),
(88, 'Creacion de', 'Usuario', 'con usuario eliminado', 'eliminado', 'CxYwl/Vxz9TzYXRncI3jlA==:k8+4Lt8q6/vF5PLhgY8Gvw==', 'usuario@gmail.com', 0, 'SecureRandom', 0),
(89, 'eliminado', 'eliminado', 'eliminado', 'eliminado', '4Qop+zmYWKzl1OGh8xcunA==:bC5IHX1r4SUqdHEyMmRW1A==', 'eliminado@correo.algo', 0, 'SecureRandom', 0),
(90, 'Nombre', 'A.Paterno', 'A.Materno', 'Usuario', 'fj0DiDqB5uluvWRbn6dSlg==:1+MAgx3NIayoSkpyoG7CZQ==', 'usuario@correo.com', 0, 'SecureRandom', 1),
(91, 'prueba', '', '', '', 'p9mzhpyuZy/aFrGB/xa+TQ==:wEl7lPh68g+xZRwNNVKkNg==', '', 0, 'SecureRandom', 0),
(92, 'Nombre', 'A.Paterno', 'A.Materno', 'Usuario', '9zZR0jtJsFnhqaEgR+AxFA==:bxbTT8eXUPqTj6HuJr1MQQ==', 'usuario@usuario.com', 0, 'SecureRandom', 0),
(93, '', '', '', '', 'nQvFBMOXk+rU8BvXGMj7uA==:NTN3z8NPKq6/NjpC1q4PLA==', '', 0, 'SecureRandom', 0),
(94, '', '', '', '', 'zIzG3U71//1rN1rNE739YA==:LBm9vn0RAnXjLMu96db+Zw==', '', 0, 'SecureRandom', 0),
(95, '', '', '', '', 'sBfI1+ErrCGIJ39iF4ehVw==:s4X+genwklAF1SwG4tljmA==', '', 0, 'SecureRandom', 0),
(96, 'Juan de Dios', 'Zúñiga', 'Larios', 'juano', 'OAbVlPS2Ev84lIz/edTRbA==:jHMSbsLlgN3zqZnJWhEZew==', 'juanzunigalarios@hotmail.com', 0, 'SecureRandom', 1),
(98, 'prueba logs', 'prueba logs', 'prueba logs', 'prueba logs', 'a7xfDVmiE2njkTIvcYyiWw==:UK9IisoauOfpwcOCJXapvQ==', 'prueba@logs.com', 0, 'SecureRandom', 0),
(99, 'prueba logs 2', 'prueba logs 2', 'prueba logs 2', 'prueba logs 2', 'TyplYH8+YB39GLXW2uarNw==:7d3DBh8VbOM5K7Z7jSGqYA==', 'prueba@logs2.com', 0, 'SecureRandom', 0),
(100, 'wrgwrg2', 'grhu6uyry', 'b435g', 'f2grhw', 'iR29SU5Ow3STjmvSdKqH1A==:hghZuZXAtd36Glt2UFdMVQ==', 'johnny@lechuga.eu', 0, 'SecureRandom', 0),
(101, 'Nombre', 'A.Paterno', 'A.Materno', 'UsuarioSinPermiso', '78HaIuhBY0SMQDYRPUDyIQ==:pLrqfknOOHgpbI3aN/MA6A==', 'usuario@correo.com', 0, 'SecureRandom', 1),
(102, 'Prueba edicion', 'prueba', 'prueba', 'prueba', 'esulLgXeboIhv3b50tO8Rg==:L0CFKZNaMfiHplIuIu1tVQ==', 'usuario@correo.com', 0, 'SecureRandom', 1),
(103, 'Admin', 'a', 'b', 'admin', 'H3W25XdLxh5Ay790EQvT+w==:f/xHfK0jISA20+F8Q9nU7Q==', 'admin@min.com', NULL, 'SecureRandom', 1),
(104, 'Pepe', 'Pecas', '*', 'pepepecas', 'bMs7xmFzPXyAbegVEHtH9Q==:5WTlcsCbklYHjy+FHFkzVg==', 'pepepicapapas12@hotmail.com', NULL, 'SecureRandom', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `permisos_usuario`
--
ALTER TABLE `permisos_usuario`
  ADD CONSTRAINT `FK_permisos_descripcion` FOREIGN KEY (`id_permiso_descripcion`) REFERENCES `permisos_descripcion` (`id_permiso_descripcion`),
  ADD CONSTRAINT `FK_usuarios` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
