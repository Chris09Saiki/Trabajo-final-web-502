class CreateProveedors < ActiveRecord::Migration[7.2]
  def change
    create_table :proveedors do |t|
      t.string :nombre_proveedor
      t.string :contacto
      t.string :telefono
      t.string :correo

      t.timestamps
    end
  end
end
