# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171003013515) do

  create_table "boletos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "cpfCnpj"
    t.string "dataNascimento"
    t.string "rua"
    t.string "cidade"
    t.string "cep"
    t.string "uf"
    t.string "telefone"
    t.string "email"
    t.integer "motorista_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["motorista_id"], name: "index_clientes_on_motorista_id"
  end

  create_table "locacaos", force: :cascade do |t|
    t.integer "cliente_id"
    t.integer "veiculo_id"
    t.date "dataSaida"
    t.date "dataEntrada"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_locacaos_on_cliente_id"
    t.index ["veiculo_id"], name: "index_locacaos_on_veiculo_id"
  end

  create_table "motoristas", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "cnh"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "veiculos", force: :cascade do |t|
    t.string "marca"
    t.string "modelo"
    t.integer "ano"
    t.string "km"
    t.string "placa"
    t.float "precoDiaria"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
