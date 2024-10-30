class ProveedoresController < ApplicationController
  def index
    @proveedores = Proveedor.all
  end
end
