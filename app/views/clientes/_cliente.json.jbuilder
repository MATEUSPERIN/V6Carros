json.extract! cliente, :id, :nome, :cpfCnpj, :dataNascimento, :rua, :cidade, :cep, :uf, :telefone, :email, :motorista_id, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
