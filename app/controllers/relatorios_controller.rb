class RelatoriosController < ApplicationController

  before_action :set_relatorio, only: [:relatorios_sell]
    def index
      relatorios = Relatorio.all
    end

    def new
      relatorios = Relatorio.new
      @inicial = Inicial.all
      @veiculos = Veiculo.all
    end

    def report_sell
      veiculo_a_buscar = "%#{params[:dataSaida]}%"
      @relatorios = Relatorio.where "dataSaida like ?", veiculo_a_buscar
    end
end
