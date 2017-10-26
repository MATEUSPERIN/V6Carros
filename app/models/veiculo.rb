class Veiculo < ApplicationRecord
  has_many :inicial
  has_many :relatorios
  validates :marca, :modelo, :ano, :km, :placa, :precoDiaria, presence: true
  validates :placa, uniqueness: true
  has_many :locacaos, dependent: :destroy
end
