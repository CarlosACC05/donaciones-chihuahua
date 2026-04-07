-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 07, 2026 at 01:17 AM
-- Server version: 8.0.45-0ubuntu0.24.04.1
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `donaciones`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`) VALUES
(1, 'Donaciones Económicas'),
(2, 'Ropa'),
(3, 'Alimentos y Despensas'),
(4, 'Juguetes'),
(5, 'Materiales para reciclar'),
(6, 'Medicamentos'),
(7, 'Otros');

-- --------------------------------------------------------

--
-- Table structure for table `centros`
--

CREATE TABLE `centros` (
  `id_centro` int NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `pagina_web` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `centros`
--

INSERT INTO `centros` (`id_centro`, `nombre`, `descripcion`, `direccion`, `telefono`, `email`, `pagina_web`) VALUES
(1, 'AMANC CHIHUAHUA', 'AMANC Chihuahua (Asociación Mexicana de Ayuda a Niños con Cáncer), activa desde 2001, brinda acompañamiento integral a niños, niñas y adolescentes con cáncer (0 a 20 años) y a sus familias en el estado. Ofrece alojamiento, apoyo alimenticio, medicamentos y soporte emocional para asegurar la continuidad del tratamiento y mejorar su calidad de vida.', 'v. Francisco Zarzo No. 2836, Col. Zarco, Chihuahua, Chih. C.P. 31020', '6144267400', 'chihuahua@amanc.org', 'https://www.amanc.org/chihuahua/'),
(2, 'Casa de la esperanza', 'Casa de la Esperanza, fundada en 1995, es un orfanato Cristiano que ha sido transformado de una casa en ruinas en una “casa de esperanza” impecable y hermosa.', 'Agricultura 208, Colonia Anáhuac, Cuauhtémoc, Chihuahua, México', '6149876543', 'info@casaesperanza.org', 'https://ahouseofhope.com/casa-mexico/'),
(3, 'Cruz Roja Mexicana', 'La Cruz Roja Mexicana es una institución humanitaria, privada, no lucrativa y voluntaria, fundada el 21 de febrero de 1910. Su misión es prevenir y aliviar el sufrimiento humano, salvaguardando la salud y vida de personas en situación de riesgo o desastre, operando bajo los principios de imparcialidad y neutralidad.', 'Av. Prol. Teófilo Borunda 2400, Jardines del Santuario, 31206 Chihuahua, Chih., México', ' 614 411 1558', 'contacto@cruzrojamexicana.org.mx', 'https://www.cruzrojachihuahua.org'),
(4, 'Cáritas de Chihuahua I.B.P.', 'Es una organización de la Iglesia Católica fundada en 1983 que apoya a personas en situación vulnerable en Chihuahua. Brinda servicios de salud (médicos, dentales, psicológicos), banco de alimentos, donación de ropa/muebles y apoyo a grupos vulnerables, promoviendo la justicia social sin distinción de creencias.', 'C. José María Morelos 405, Zona Centro, 31000 Chihuahua, Chih., México', '6144153990', 'caritasdechihuahua@gmail.com', 'caritasdechihuahua.org'),
(5, 'Ejercito De Salvación', 'Es una organización cristiana internacional y benéfica. Proporciona ayuda social, incluyendo el funcionamiento de casas hogar para niños, apoyo a personas necesitadas, refugio y asistencia comunitaria en la ciudad de Chihuahua.', 'C. Tamborel 601, Santa Rosa, 31050 Chihuahua, Chih., México', '6144204002', 'elsa.sosa@mex.salvationarmy.org', 'https://www.facebook.com/p/Ej%C3%A9rcito-de-Salvaci%C3%B3n-Chihuahua-100067612125157/'),
(6, 'Instituto Down de Chihuahua AC', 'Institución profesional especializada en proporcionar el soporte integral para personas con síndrome de Down.', 'Av. Mirador 4307, Campestre I Etapa, Campestre Residencial, 31123 Chihuahua, Chih., México', '6144160521', 'instituto@downchihuahua.org', 'https://downchihuahua.org/'),
(7, 'CRIT Chihuahua Fundación Teletón México A.C.', 'Fundación Teletón es una organización sin fines de lucro dedicada a brindar atención integral y de calidad a personas con discapacidad, cáncer y autismo, para promover el desarrollo de su máximo potencial, así como su inclusión en la sociedad.', 'Juan Pablo II 4101, Zona Industrial, Robinson, 31074 Chihuahua, Chih., México', '6144295354', NULL, 'https://www.facebook.com/CRITChihuahua?locale=es_LA'),
(8, 'Banco de Alimentos Regional de Cáritas de Chihuahua', 'Es un programa de Cáritas de Chihuahua, I.B.P. y miembro de BAMX, cuyo objetivo principal es combatir la pobreza alimentaria y desnutrición en la región. Rescata, almacena y distribuye alimentos a comunidades y familias vulnerables, mejorando la nutrición y reduciendo el desperdicio.', 'Sierra del Cuervo, Primero de Mayo, 31074 Chihuahua, Chih., México', '6144352759', 'bancocaritaschihuahua@gmail.com', 'https://www.facebook.com/bancodealimentosregionaldecaritaschihuahua/?locale=es_LA'),
(9, 'VOLUNTARIAS VICENTINAS CHIHUAHUA', 'Forma parte de la Asociación Internacional de Caridades, la más antigua Asociación laical femenina en la historia del Voluntariado y la Iglesia, fundada en 1617 por San Vicente de Paúl en Châtillon les Dombes (Francia) con el objetivo de luchar contra la pobreza y otorgar a las mujeres un papel reconocido en la sociedad.', 'Calle Nicolás Bravo 910, Bolívar, Zona Centro, 31000 Chihuahua, Chih., México', '6144105218', 'voluntariasvicentinas6@hotmail.com', 'https://voluntariasvicentinas.weebly.com/'),
(10, 'Casa Hogar de Niñas de Chihuahua, A.C. ', 'Es una asociación civil sin fines de lucro con un siglo de labor (fundada formalmente en 1993) dedicada a brindar protección, hogar, alimentación, educación integral y atención médica/psicológica a niñas en situación de vulnerabilidad, pobreza extrema o desintegración familiar en Chihuahua.', 'Av. Venustiano Carranza 1814, Bolívar, Zona Centro, 31000 Chihuahua, Chih., México', '6144105325', 'casahogarchihuahua@hotmail.com', 'https://ayudaresvivir.org/institucion/casa-hogar-de-ninas-de-chihuahua-ac.html'),
(11, 'Granja Hogar', 'Granja Hogar ofrece un mundo de posibilidades para que niñas, niños y adolescentes puedan, a través de una comunidad educativa, vivir un ambiente que, favorece sus procesos de crecimiento, por medio de espacios cálidos y formativos, calidad en los servicios y una formación integral.', 'Juan de Dios Martin Barba Antes 6542, Nombre de Dios, 31150 Chihuahua, Chih., México', '614 424 0091', NULL, 'https://www.granjahogar.org.mx/');

-- --------------------------------------------------------

--
-- Table structure for table `centro_categoria`
--

CREATE TABLE `centro_categoria` (
  `id` int NOT NULL,
  `id_centro` int DEFAULT NULL,
  `id_categoria` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `centro_categoria`
--

INSERT INTO `centro_categoria` (`id`, `id_centro`, `id_categoria`) VALUES
(1, 1, 1),
(2, 1, 6),
(3, 2, 2),
(4, 2, 4),
(5, 3, 1),
(6, 4, 3),
(7, 4, 6),
(8, 5, 2),
(9, 5, 1),
(10, 6, 1),
(11, 7, 1),
(12, 8, 3),
(13, 9, 1),
(14, 9, 2),
(15, 9, 7),
(16, 9, 6),
(17, 10, 1),
(18, 10, 2),
(19, 10, 7),
(20, 11, 1),
(21, 11, 2),
(22, 11, 4),
(23, 11, 7),
(24, 11, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indexes for table `centros`
--
ALTER TABLE `centros`
  ADD PRIMARY KEY (`id_centro`);

--
-- Indexes for table `centro_categoria`
--
ALTER TABLE `centro_categoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_centro` (`id_centro`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `centros`
--
ALTER TABLE `centros`
  MODIFY `id_centro` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `centro_categoria`
--
ALTER TABLE `centro_categoria`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `centro_categoria`
--
ALTER TABLE `centro_categoria`
  ADD CONSTRAINT `centro_categoria_ibfk_1` FOREIGN KEY (`id_centro`) REFERENCES `centros` (`id_centro`),
  ADD CONSTRAINT `centro_categoria_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
