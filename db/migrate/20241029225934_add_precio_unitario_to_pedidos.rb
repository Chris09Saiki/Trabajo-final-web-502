class AddPrecioUnitarioToPedidos < ActiveRecord::Migration[7.2]
  def change
    add_column :pedidos, :precio_unitario, :decimal
  end
end
