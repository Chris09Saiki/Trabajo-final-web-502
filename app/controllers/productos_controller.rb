class ProductosController < ApplicationController
  def index   #Mostrar lista de productos
    @productos = Producto.select(:id, :nombre_producto, :precio)
  end

  # Acción para mostrar todos los detalles del producto seleccionado
  def show
    @producto = Producto.find(params[:id])  #Busca mediante su id
  end
end
