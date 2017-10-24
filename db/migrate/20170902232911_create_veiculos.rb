class CreateVeiculos < ActiveRecord::Migration[5.1]
  def change
    create_table :veiculos do |t|
      t.string :marca
      t.string :modelo
      t.integer :ano
      t.string :km
      t.string :placa
      t.float :precoDiaria

      t.timestamps
    end
  end
end
