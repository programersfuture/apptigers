CREATE DATABASE IF NOT EXISTS Apptigers;
USE Apptigers;

CREATE TABLE IF NOT EXISTS Usuarios (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    contraseña VARCHAR(255) NOT NULL
);

INSERT INTO Usuarios (nombre, correo, telefono, contraseña) VALUES
('Ana Pérez', 'ana@gmail.com', '0834567890', 'password123'),
('Carlos Gómez', 'carlos@gmail.com', '0987654321', 'password456'),
('María López', 'maria@gmail.com', '0912345678', 'password789'),
('Juan Martínez', 'juan@gmail.com', '0876543210', 'password101'),
('Laura Ramírez', 'laura@gmail.com', '0981122334', 'password202'),
('Emma Watson', 'emmawt@gmail.com', '0876543210', 'password201'),
('Robert V. Avila', 'robert@gmail.com', '0876543210', 'password504');


CREATE TABLE IF NOT EXISTS Restaurantes (
    idRestaurante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    categoria VARCHAR(50),
    telefono VARCHAR(15)
);


INSERT INTO Restaurantes (nombre, direccion, categoria, telefono) VALUES
('Pizzería Italiana', 'Calle Urdesa 123', 'Pizza', '123456789'),
('Hamburguesas Delicia', 'Av.9 Octubre', 'Hamburguesas', '987654321'),
('El Rinconcito Quiteño', 'Av. Amazonas 123, Quito', 'Comida Ecuatoriana', '0951234567'),
('Sabor Cuencano', 'Calle Larga 789, Cuenca', 'Comida Tradicional', '0961234567'),
('La Hueca de Doña Ana', 'Calle 9 de Octubre, Guayaquil', 'Cazuela y Encebollado', '0976543210'),
('Picantería La Guayaca', 'Malecón 2000, Guayaquil', 'Comida Típica', '0987654321'),
('Cevichería El Manaba', 'Calle Los Ríos 456, Manta', 'Mariscos', '0934567890');


CREATE TABLE IF NOT EXISTS Menus (
    idMenu INT AUTO_INCREMENT PRIMARY KEY,
    idRestaurante INT,
    nombreProducto VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (idRestaurante) REFERENCES Restaurantes(idRestaurante)
);

INSERT INTO Menus (idRestaurante, nombreProducto, descripcion, precio) VALUES
(1, 'Pizza Margherita', 'Clásica pizza con tomate, mozzarella y albahaca.', 2.50),
(1, 'Pizza Pepperoni', 'Pizza con pepperoni y extra queso.', 1.75),
(2, 'Hamburguesa Clásica', 'Hamburguesa con carne, queso y vegetales.', 1.00),
(2, 'Hamburguesa BBQ', 'Hamburguesa con salsa BBQ, cebolla caramelizada y bacon.', 2.50),
(3, 'Hornado Quiteño', 'Cerdo asado al horno con mote y llapingachos.', 1.00),
(3, 'Locro de Papa', 'Sopa de papa con queso, aguacate y maíz tostado.', 1.50),
(4, 'Mote Pillo', 'Mote con huevos revueltos y cebolla, típico de la Sierra.', 2.50),
(4, 'Fritada con Mote', 'Cerdo frito servido con mote, plátano y maíz tostado.', 3.00),
(5, 'Cazuela de Mariscos', 'Estofado de mariscos con maní, verde y especias.', 4.00),
(5, 'Encebollado', 'Sopa de pescado con yuca y cebolla encurtida, típico del desayuno.', 2.00),
(6, 'Seco de Pollo', 'Pollo guisado con arroz, aguacate y maduro frito.', 1.50),
(6, 'Guatita', 'Estofado de mondongo con maní, servido con arroz.', 1.75),
(7, 'Ceviche de Camarón', 'Camarones marinados con limón, cebolla y cilantro.', 1.50),
(7, 'Arroz con Menestra y Carne', 'Arroz, menestra de lentejas y carne asada.', 2.00);

CREATE TABLE IF NOT EXISTS Pedidos (
    idPedido INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT,
    idRestaurante INT,
    estadoPedido ENUM('Confirmado', 'Preparación', 'En camino', 'Entregado') DEFAULT 'Confirmado',
    fechaPedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES Usuarios(idUsuario),
    FOREIGN KEY (idRestaurante) REFERENCES Restaurantes(idRestaurante)
);

INSERT INTO Pedidos (idUsuario, idRestaurante, estadoPedido, total) VALUES
(1, 1, 'Confirmado', 5.25),
(2, 2, 'Preparación', 3.50),
(3, 3, 'En camino', 2.50),
(4, 4, 'Entregado', 5.50),
(5, 5, 'Confirmado', 6.00);

CREATE TABLE IF NOT EXISTS DetallesPedido (
    idDetalle INT AUTO_INCREMENT PRIMARY KEY,
    idPedido INT,
    idMenu INT,
    cantidad INT NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (idPedido) REFERENCES Pedidos(idPedido),
    FOREIGN KEY (idMenu) REFERENCES Menus(idMenu)
);

INSERT INTO DetallesPedido (idPedido, idMenu, cantidad, subtotal) VALUES
(1, 1, 1, 2.50),
(1, 2, 1, 1.75),
(2, 3, 1, 1.00),
(2, 4, 1, 2.50),
(3, 5, 1, 1.00),
(3, 6, 1, 1.50),
(4, 7, 1, 2.50),
(4, 8, 1, 3.00),
(5, 9, 1, 4.00),
(5, 10, 1, 2.00);

CREATE TABLE IF NOT EXISTS Valoraciones (
    idValoracion INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT,
    idRestaurante INT,
    puntuacion INT CHECK (puntuacion BETWEEN 1 AND 5),
    comentario TEXT,
    fechaValoracion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idUsuario) REFERENCES Usuarios(idUsuario),
    FOREIGN KEY (idRestaurante) REFERENCES Restaurantes(idRestaurante)
);

INSERT INTO Valoraciones (idUsuario, idRestaurante, puntuacion, comentario) VALUES
(1, 1, 5, 'Excelente pizza, la mejor de la ciudad.'),
(2, 2, 4, 'Muy buenas hamburguesas, aunque un poco caras.'),
(3, 3, 3, 'El hornado estuvo bien, pero el servicio fue lento.'),
(4, 4, 4, 'La fritada estaba deliciosa, volveré a probar el mote.'),
(5, 5, 5, 'La cazuela de mariscos estuvo increíble.'),
(6, 6, 4, 'El seco de pollo estuvo bueno, pero el arroz estaba un poco seco.'),
(7, 7, 5, 'Ceviche de camarón fresco y sabroso, lo recomendaré a mis amigos.');
