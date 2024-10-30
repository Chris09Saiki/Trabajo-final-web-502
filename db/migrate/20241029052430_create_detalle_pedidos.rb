class CreateDetallePedidos < ActiveRecord::Migration[7.2]
  def change
    create_table :detalle_pedidos do |t|
      t.references :pedido, null: false, foreign_key: true
      t.references :producto, null: false, foreign_key: true
      t.integer :cantidad
      t.decimal :precio_unitario
      t.decimal :subtotal

      t.timestamps
    end
  end
end
