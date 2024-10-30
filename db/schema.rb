# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_10_29_225934) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "telefono"
    t.string "dni"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detalle_pedidos", force: :cascade do |t|
    t.bigint "pedido_id", null: false
    t.decimal "precio_unitario", precision: 10, scale: 2
    t.decimal "subtotal", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pedido_id"], name: "index_detalle_pedidos_on_pedido_id"
  end

  create_table "empleados", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "telefono"
    t.string "correo"
    t.date "fechas_contratacion"
    t.string "cargo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pedidos", force: :cascade do |t|
    t.date "fecha_pedido"
    t.bigint "cliente_id", null: false
    t.bigint "empleado_id", null: false
    t.bigint "producto_id", null: false
    t.integer "cantidad"
    t.decimal "subtotal", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "precio_unitario"
    t.index ["cliente_id"], name: "index_pedidos_on_cliente_id"
    t.index ["empleado_id"], name: "index_pedidos_on_empleado_id"
    t.index ["producto_id"], name: "index_pedidos_on_producto_id"
  end

  create_table "productos", force: :cascade do |t|
    t.string "nombre_producto"
    t.decimal "precio"
    t.integer "stock"
    t.text "descripcion"
    t.bigint "proveedor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proveedor_id"], name: "index_productos_on_proveedor_id"
  end

  create_table "proveedors", force: :cascade do |t|
    t.string "nombre_proveedor"
    t.string "contacto"
    t.string "telefono"
    t.string "correo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "detalle_pedidos", "pedidos"
  add_foreign_key "pedidos", "clientes"
  add_foreign_key "pedidos", "empleados"
  add_foreign_key "pedidos", "productos"
  add_foreign_key "productos", "proveedors"
end
