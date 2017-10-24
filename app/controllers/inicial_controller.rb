class InicialController < ApplicationController
    def relatorio

    end

    def veiculoEmprestado
    end

      def report_sell
    @date_to_search = param_search

    if params[:search] and params[:search] != ''
      @Locacaos = Locacao.where("date(created_at) = ?", param_search)
      @amount = @Locacaos.size
    else
      @Locacaos = Locacao.all.order(:created_at).limit(50)
    end
  end

  def relatorio
    @date_to_search = param_search

    if params[:search] and params[:search] != ''
      @Locacaos = Locacao.where("date(created_at) = ?", param_search)

    else
      @Locacaos = Locacao.all.order(:created_at).limit(50)
    end
  end

  private
  def param_search
    params[:search]
  end

  def set_sell
    @Locacaos = Locacao.all
  end

  def set
    @Locacaos = Locacao.all
  end

  def set_size
    @amount = Locacao.all.size
  end

end
