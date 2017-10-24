json.extract! veiculo, :id, :marca, :modelo, :ano, :km, :placa, :precoDiaria, :created_at, :updated_at
json.url veiculo_url(veiculo, format: :json)
