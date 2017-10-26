class InicialController < ApplicationController

    def relatorio
      @veiculo_a_buscar = param_search

      if params[:search] and params[:search] != ''
        veiculo_a_buscar = "%#{params[:dataSaida]}%"
        @inicial = Inicial.where "dataSaida like ?", veiculo_a_buscar
        @amount = @veiculos.size
      else
        @locacaos = Locacao.all.order(:created_at).limit(50)
      end
    end

    private
    def param_search
      params[:search]
    end

    def set_veiculo
      @locacaos = Locacao.all
    end

    def set_size
      @amount = Locacao.all.size
    end
end
