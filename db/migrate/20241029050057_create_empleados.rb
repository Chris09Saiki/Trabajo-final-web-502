class CreateEmpleados < ActiveRecord::Migration[7.2]
  def change
    create_table :empleados do |t|
      t.string :nombre
      t.string :apellido
      t.string :telefono
      t.string :correo
      t.date :fechas_contratacion
      t.string :cargo

      t.timestamps
    end
  end
end
