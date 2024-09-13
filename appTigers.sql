-- Crear la base de datos
CREATE DATABASE appTigers;

-- Usar la base de datos
USE appTigers;

-- Crear tabla de Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    direccion VARCHAR(255)
);

-- Crear tabla de Productos
CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);

-- Crear tabla de Pedidos
CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Crear tabla de DetallesPedidos
CREATE TABLE DetallesPedidos (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_producto INT,
    cantidad INT NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- Inserta datos en la tabla Clientes
INSERT INTO Clientes (nombre, telefono, direccion) VALUES
('Juan Pérez', '123456789', 'Av. Principal 123, Ciudad'),
('Ana Gómez', '987654321', 'Calle Secundaria 456, Ciudad'),
('Carlos López', '456789123', 'Av. Tercera 789, Ciudad'),
('María Martínez', '321654987', 'Calle Cuarta 101, Ciudad'),
('Laura Sánchez', '654123789', 'Av. Quinta 202, Ciudad');

-- Inserta datos en la tabla Productos
INSERT INTO Productos (nombre, precio) VALUES
('Hamburguesa Clásica', 5.00),
('Papas Fritas', 2.50),
('Refresco', 1.50),
('Ensalada', 3.00),
('Pizza', 8.00);

-- Inserta datos en la tabla Pedidos
INSERT INTO Pedidos (id_cliente, fecha_pedido) VALUES
(1, '2024-09-15'),
(2, '2024-09-16'),
(3, '2024-09-17'),
(4, '2024-09-18'),
(5, '2024-09-19');

-- Inserta datos en la tabla DetallesPedidos
INSERT INTO DetallesPedidos (id_pedido, id_producto, cantidad, subtotal) VALUES
(1, 1, 2, 10.00),   -- Hamburguesa Clásica x2
(1, 2, 1, 2.50),    -- Papas Fritas x1
(2, 3, 1, 1.50),    -- Refresco x1
(3, 1, 1, 5.00),    -- Hamburguesa Clásica x1
(3, 4, 1, 3.00),    -- Ensalada x1
(4, 2, 2, 5.00),    -- Papas Fritas x2
(4, 5, 1, 8.00),    -- Pizza x1
(5, 3, 2, 3.00);    -- Refresco x2
