class Cliente < ApplicationRecord
  belongs_to :motorista
  validates :nome, :cpfCnpj, :dataNascimento, :rua, :cidade, :cep, :uf, :telefone, :email, presence: true
  validates :cpfCnpj, uniqueness: true
  has_many :locacaos, dependent: :destroy

end
