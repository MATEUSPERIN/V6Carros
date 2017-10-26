class Locacao < ApplicationRecord
  belongs_to :cliente
  belongs_to :veiculo

  validate :validaDataPassado
  validate :validaDataEntrada
  validate :validacao
  validate :validacao2
  validate :validacao3
  validates :dataSaida, :dataEntrada, presence: true

  def validaDataPassado
    if (!self.dataSaida.blank?) && (self.dataSaida < Date.today)
      errors.add(:dataSaida, " - A Data da locação é inferior a data de hoje")
    end
  end
  def validaDataEntrada
    if (!self.dataEntrada.blank?) && (self.dataEntrada < Date.today)
      errors.add(:dataEntrada, " - A Data da locação é inferior a data de hoje")
    end
  end

def validacao
  locacaos = Locacao.where('veiculo_id = ? and dataEntrada = ?', self.veiculo.id, self.dataEntrada)

    if not locacaos.blank?
      errors.add(:dataEntrada, " - Este veiculo já está locado para esse dia")
    end
end
def validacao2
  locacaos = Locacao.where('veiculo_id = ? and dataSaida = ?', self.veiculo.id, self.dataSaida)

    if not locacaos.blank?
      errors.add(:dataSaida, " - Este veiculo já está locado para esse dia")
    end
end
def validacao3
  locacaos = Locacao.where('veiculo_id = ?', self.veiculo.id)
  a = (self.dataEntrada - self.dataSaida).to_i
  if a > 0
    if not locacaos.blank?
       errors.add(:dataSaida, " - Este veiculo já está locado para esse dia")
       errors.add(:dataSaida, " - Este veiculo já está locado para esse dia")

    end
  end
  if a < 0
    if not locacaos.blank?
       errors.add(:dataEntrada, " - Data anterior a data de saida do veiculo")
    end
  end
end

  def calculaLocacao
     (self.dataEntrada - self.dataSaida).to_i * self.veiculo.precoDiaria
  end

end
