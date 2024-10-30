class EmpleadosController < ApplicationController
  def index
    @empleados = Empleado.select(:id, :nombre, :cargo)  # Solo selecciona los campos necesarios
  end

  # Acción para mostrar todos los detalles del empleado seleccionado
  def show
    @empleado = Empleado.find(params[:id])
  end
end
