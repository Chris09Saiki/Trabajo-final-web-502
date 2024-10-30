class ClientesController < ApplicationController
  def index
    @clientes = Cliente.all   #Mostrar todos los clientes
  end

  def show    #Detalles de un cliente
    @cliente = Cliente.find(params[:id])   #Busca mediante id del cliente
  end

  def new    #Creación de nuevo cliente
    @cliente = Cliente.new
  end

  def create   #Crea y guarda nuevo cliente
    @cliente = Cliente.new(cliente_params)
    if @cliente.save
      redirect_to clientes_path  #redirige a la página de clientes
    else
      render :new  #si falla vuelve al mismo forulario de creacion
    end
  end

  def edit
    @cliente = Cliente.find(params[:id])   # Encuentra el cliente usando :id para su edición
  end

  def update
    @cliente = Cliente.find(params[:id])  # Encuentra el cliente usando :id y lo asigna a @cliente
    if @cliente.update(cliente_params)  # Intenta actualizar el cliente con los nuevos datos del formulario
      redirect_to @cliente   # Redirige al cliente específico si la actualización es exitosa
    else
      render :edit   # Si la actualización falla, vuelve al formulario de edición
    end
  end

 

  private

  def cliente_params   # Método privado para definir los parámetros permitidos para Cliente

    # Requiere que los datos del formulario contengan un objeto :cliente y permite los campos especificados
    params.require(:cliente).permit(:nombre, :apellido, :telefono, :dni, :email) 
  end
end
