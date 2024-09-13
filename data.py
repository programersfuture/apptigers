import mysql.connector
from tabulate import tabulate

class DatabaseError(Exception):
    """Clase base para otras excepciones"""
    pass

class AppTigers:
    def __init__(self):
        try:
            self.conexion = mysql.connector.connect(
                host='localhost',
                user='root',
                password='',  # Reemplazar por tu contraseña de MySQL
                database='appTigers'
            )
            self.cursor = self.conexion.cursor()
            print("✔ Conexión establecida con la base de datos.")
        except mysql.connector.Error as e:
            raise DatabaseError(f"No se pudo conectar a la base de datos: {e}")

    def cerrarConexion(self):
        if self.conexion.is_connected():
            self.cursor.close()
            self.conexion.close()
            print("✔ Conexión cerrada.")

    # CRUD para Clientes
    def registrarCliente(self):
        nombre = input("Ingrese el nombre del cliente: ")
        telefono = input("Ingrese el teléfono del cliente: ")
        direccion = input("Ingrese la dirección del cliente: ")

        try:
            query = "INSERT INTO Clientes (nombre, telefono, direccion) VALUES (%s, %s, %s)"
            self.cursor.execute(query, (nombre, telefono, direccion))
            self.conexion.commit()
            print("✔ Cliente registrado exitosamente.")
        except mysql.connector.Error as e:
            print(f"❌ Error al registrar cliente: {e}")

    def mostrarClientes(self):
        try:
            query = "SELECT * FROM Clientes"
            self.cursor.execute(query)
            resultados = self.cursor.fetchall()

            table = tabulate(resultados, headers=["ID Cliente", "Nombre", "Teléfono", "Dirección"], tablefmt="grid")
            print("\nClientes Registrados:")
            print(table)
        except mysql.connector.Error as e:
            print(f"❌ Error al mostrar clientes: {e}")

    # CRUD para Productos
    def registrarProducto(self):
        nombre = input("Ingrese el nombre del producto: ")
        precio = float(input("Ingrese el precio del producto: "))

        try:
            query = "INSERT INTO Productos (nombre, precio) VALUES (%s, %s)"
            self.cursor.execute(query, (nombre, precio))
            self.conexion.commit()
            print("✔ Producto registrado exitosamente.")
        except mysql.connector.Error as e:
            print(f"❌ Error al registrar producto: {e}")

   def cerrarConexion(self):
        if self.conexion.is_connected():
            self.cursor.close()
            self.conexion.close()
            print("✔ Conexión cerrada.")

            table = tabulate(resultados, headers=["ID Producto", "Nombre", "Precio"], tablefmt="grid")
            print("\nProductos Disponibles:")
            print(table)
        except mysql.connector.Error as e:
            print(f"❌ Error al mostrar productos: {e}")

    # CRUD para Pedidos
    def realizarPedido(self):
        cliente_id = int(input("Ingrese el ID del cliente: "))
        fecha_pedido = input("Ingrese la fecha del pedido (YYYY-MM-DD): ")

        try:
            query = "INSERT INTO Pedidos (id_cliente, fecha_pedido) VALUES (%s, %s)"
            self.cursor.execute(query, (cliente_id, fecha_pedido))
            self.conexion.commit()
            print("✔ Pedido realizado exitosamente.")
        except mysql.connector.Error as e:
            print(f"❌ Error al realizar pedido: {e}")

    def mostrarPedidos(self):
        try:
            query = "SELECT * FROM Pedidos"
            self.cursor.execute(query)
            resultados = self.cursor.fetchall()

            table = tabulate(resultados, headers=["ID Pedido", "ID Cliente", "Fecha Pedido"], tablefmt="grid")
            print("\nPedidos Realizados:")
            print(table)
        except mysql.connector.Error as e:
            print(f"❌ Error al mostrar pedidos: {e}")

    # CRUD para Detalles de Pedidos
    def registrarDetallePedido(self):
        id_pedido = int(input("Ingrese el ID del pedido: "))
        id_producto = int(input("Ingrese el ID del producto: "))
        cantidad = int(input("Ingrese la cantidad: "))
        subtotal = float(input("Ingrese el subtotal: "))

       try:
            query = "INSERT INTO DetallesPedidos (id_pedido, id_producto, cantidad, subtotal) VALUES (%s, %s, %s, %s)"
            self.cursor.execute(query, (id_pedido, id_producto, cantidad, subtotal))
            self.conexion.commit()
            print("✔ Detalle de pedido registrado exitosamente.")
        except mysql.connector.Error as e:
            print(f"❌ Error al registrar detalle de pedido: {e}")

    def cerrarConexion(self):
        if self.conexion.is_connected():
            self.cursor.close()
            self.conexion.close()
            print("✔ Conexión cerrada.")

         table = tabulate(resultados, headers=["ID Detalle", "ID Pedido", "ID Producto", "Cantidad", "Subtotal"], tablefmt="grid")
            print("\nDetalles de Pedidos:")
            print(table)
        except mysql.connector.Error as e:
            print(f"❌ Error al mostrar detalles de pedidos: {e}")
