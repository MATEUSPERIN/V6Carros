json.extract! locacao, :id, :cliente_id, :veiculo, :dataSaida, :dataEntrada, :created_at, :updated_at
json.url locacao_url(locacao, format: :json)
