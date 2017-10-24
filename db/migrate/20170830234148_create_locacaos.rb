class CreateLocacaos < ActiveRecord::Migration[5.1]
  def change
    create_table :locacaos do |t|
      t.references :cliente, foreign_key: true
      t.references :veiculo, foreign_key: true
      t.date :dataSaida
      t.date :dataEntrada

      t.timestamps
    end
  end
end
