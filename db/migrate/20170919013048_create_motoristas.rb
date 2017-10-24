class CreateMotoristas < ActiveRecord::Migration[5.1]
  def change
    create_table :motoristas do |t|
      t.string :nome
      t.string :cpf
      t.string :cnh

      t.timestamps
    end
  end
end
