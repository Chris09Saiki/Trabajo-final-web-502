class DetallePedidosController < ApplicationController
    def show
        @detalle_pedido = DetallePedido.find(params[:id])
        @pedido = @detalle_pedido.pedido
        @cliente = @pedido.cliente
        @empleado = @pedido.empleado
        @producto = @pedido.producto
    end
end
