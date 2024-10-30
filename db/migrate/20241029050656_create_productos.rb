class CreateProductos < ActiveRecord::Migration[7.2]
  def change
    create_table :productos do |t|
      t.string :nombre_producto
      t.decimal :precio
      t.integer :stock
      t.text :descripcion
      t.references :proveedor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
