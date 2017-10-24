class Motorista < ApplicationRecord
    has_many :cliente
  validates :nome, :cpf, :cnh, presence: true

end
