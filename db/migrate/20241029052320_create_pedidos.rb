class CreatePedidos < ActiveRecord::Migration[7.2]
  def change
    create_table :pedidos do |t|
      t.date :fecha_pedido
      t.string :estado
      t.decimal :total
      t.references :cliente, null: false, foreign_key: true
      t.references :empleado, null: false, foreign_key: true

      t.timestamps
    end
  end
end
