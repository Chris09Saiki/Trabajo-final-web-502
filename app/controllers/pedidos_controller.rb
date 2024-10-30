class PedidosController < ApplicationController
  def new
    @pedido = Pedido.new  # inicializa una nueva instancia de Pedido
    @productos = Producto.all #carga todos los productos disponibles en la variable de instancia @productos
  end

  def create   #Crea nuevo pedido
    @pedido = Pedido.new(pedido_params)
    @producto = Producto.find(@pedido.producto_id)   #Busca el producto y sus datos por Id
    @pedido.precio_unitario = @producto.precio     #Muestra el precio del producto seleccionado
    @pedido.subtotal = @pedido.cantidad * @pedido.precio_unitario

    if @pedido.save
      
      @detalle_pedido = DetallePedido.create(  #Crea un nuevo pedido en la tabla 
        pedido_id: @pedido.id,
        precio_unitario: @pedido.precio_unitario,
        subtotal: @pedido.subtotal
      )
      redirect_to @pedido
    else
      @productos = Producto.all
      render :new
    end
  end

  def show
    @pedido = Pedido.find(params[:id])
    # Cargar el detalle del pedido relacionado
    @detalle_pedido = DetallePedido.find_by(pedido_id: @pedido.id)

    # Cargar registros asociados
    @cliente = Cliente.find(@pedido.cliente_id)
    @empleado = Empleado.find(@pedido.empleado_id)
    @producto = Producto.find(@pedido.producto_id)
  end

  private

  def pedido_params
    params.require(:pedido).permit(:fecha_pedido, :cliente_id, :empleado_id, :producto_id, :cantidad)
    #los parámetros permitidos se utilicen al crear o actualizar un pedido. 
  end
end
