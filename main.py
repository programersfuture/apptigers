from data import AppTigers


# main
def main():
    app = AppTigers()  # Crear instancia de la clase AppComidaRapida
    try:
        while True:
            print("\n" + "=" * 50)
            print("\t\tGESTIÓN DE COMIDA RÁPIDA")
            print("=" * 50)
            print("Menú Principal:")
            print("\n1. Gestionar Clientes")
            print("2. Gestionar Productos")
            print("3. Gestionar Pedidos")
            print("4. Gestionar Detalles de Pedidos")
            print("5. Salir")
            print("-" * 50)

            try:
                opcion = int(input("Escoja una opción (1-5): "))
            except ValueError:
                print("❌ Error: Por favor, ingrese un número válido.")
                continue

            if opcion == 1:
                print("\n*** Opciones de Clientes ***")
                print("1. Registrar Cliente")
                print("2. Mostrar Clientes")
                try:
                    sub_opcion = int(input("Escoja una opción (1-2): "))
                except ValueError:
                    print("❌ Error: Por favor, ingrese un número válido.")
                    continue
                if sub_opcion == 1:
                    app.registrarCliente()
                elif sub_opcion == 2:
                    app.mostrarClientes()
                else:
                    print("❌ Opción no válida.")

            elif opcion == 2:
                print("\n*** Opciones de Productos ***")
                print("1. Registrar Producto")
                print("2. Mostrar Productos")
                try:
                    sub_opcion = int(input("Escoja una opción (1-2): "))
                except ValueError:
                    print("❌ Error: Por favor, ingrese un número válido.")
                    continue
                if sub_opcion == 1:
                    app.registrarProducto()
                elif sub_opcion == 2:
                    app.mostrarProductos()
                else:
                    print("❌ Opción no válida.")

            elif opcion == 3:
                print("\n*** Opciones de Pedidos ***")
                print("1. Realizar Pedido")
                print("2. Mostrar Pedidos")
                try:
                    sub_opcion = int(input("Escoja una opción (1-2): "))
                except ValueError:
                    print("❌ Error: Por favor, ingrese un número válido.")
                    continue
                if sub_opcion == 1:
                    app.realizarPedido()
                elif sub_opcion == 2:
                    app.mostrarPedidos()
                else:
                    print("❌ Opción no válida.")

            elif opcion == 4:
                print("\n*** Opciones de Detalles de Pedidos ***")
                print("1. Registrar Detalle de Pedido")
                print("2. Mostrar Detalles de Pedidos")
                try:
                    sub_opcion = int(input("Escoja una opción (1-2): "))
                except ValueError:
                    print("❌ Error: Por favor, ingrese un número válido.")
                    continue
                if sub_opcion == 1:
                    app.registrarDetallePedido()
                elif sub_opcion == 2:
                    app.mostrarDetallesPedidos()
                else:
                    print("❌ Opción no válida.")

            elif opcion == 5:
                print("Saliendo....")
                break

            else:
                print("❌ Opción no válida.")
    except Exception as e:
        print(f"Se ha producido un error: {e}")
    finally:
        if app:
            app.cerrarConexion()

# Agregar bloque para que main sea el punto de entrada 
if __name__ == "__main__":
    main()
