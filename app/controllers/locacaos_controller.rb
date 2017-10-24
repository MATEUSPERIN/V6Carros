class LocacaosController < ApplicationController
  before_action :set_locacao, only: [:show, :edit, :update, :destroy]

  require './lib/generate_pdf'

  # GET /locacaos
  # GET /locacaos.json
  def index
    @locacaos = Locacao.all
  end

  # GET /locacaos/1
  # GET /locacaos/1.json
  def show
  end

  def calculaLocacao
    @calcula = calculaLocacao
  end
  # GET /locacaos/new
  def new
    @locacao = Locacao.new
    @clientes = Cliente.all
    @veiculos = Veiculo.all
  end

  # GET /locacaos/1/edit
  def edit
    @locacao = Locacao.new
    @clientes = Cliente.all
    @veiculos = Veiculo.all
  end

  # POST /locacaos
  # POST /locacaos.json
  def create

    @locacao = Locacao.new(locacao_params)
    @clientes = Cliente.all
    @veiculos = Veiculo.all
    respond_to do |format|

      if @locacao.save




        format.html { redirect_to @locacao, notice: 'Locacao was successfully created.' }
        format.json { render :show, status: :created, location: @locacao }
      else
        format.html { render :new }
        format.json { render json: @locacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locacaos/1
  # PATCH/PUT /locacaos/1.json
  def update
    @clientes = Cliente.all
    @veiculos = Veiculo.all
    respond_to do |format|
      if @locacao.update(locacao_params)
        format.html { redirect_to @locacao, notice: 'Locacao was successfully updated.' }
        format.json { render :show, status: :ok, location: @locacao }
      else
        format.html { render :edit }
        format.json { render json: @locacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locacaos/1
  # DELETE /locacaos/1.json
  def destroy
    @locacao.destroy
    respond_to do |format|
      format.html { redirect_to locacaos_url, notice: 'Locacao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def export
    @locacao = Locacao.find(params[:format])

    GeneratePdf::locacao(@locacao.cliente.nome, @locacao.veiculo.modelo,
      @locacao.dataSaida, @locacao.dataEntrada, @locacao.veiculo.precoDiaria,
      @locacao.calculaLocacao)

    redirect_to "/pdf/locacao#{(DateTime.now).strftime('%d-%m-%y_%H-%M-%S')}.pdf"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_locacao
      @locacao = Locacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def locacao_params
      params.require(:locacao).permit(:cliente_id, :veiculo_id, :dataSaida, :dataEntrada)
    end

    def calculo_data
      require 'time'
      puts dataEntrada
    end
end
