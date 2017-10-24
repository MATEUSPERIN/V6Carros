class CreateClientes < ActiveRecord::Migration[5.1]
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :cpfCnpj
      t.string :dataNascimento
      t.string :rua
      t.string :cidade
      t.string :cep
      t.string :uf
      t.string :telefone
      t.string :email
      t.references :motorista, foreign_key: true

      t.timestamps
    end
  end
end
