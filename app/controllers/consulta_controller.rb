class ConsultaController < ApplicationController
  # Antes de executar ações específicas, define a consulta com base no ID fornecido.
  before_action :set_consulta, only: %i[ show edit update destroy ]

  # GET /consulta or /consulta.json
  # Exibe uma lista de todas as consultas
  def index
    @consulta = Consulta.all
    render json: @consulta
  end

  # GET /consulta/1 or /consulta/1.json
  # Exibe os detalhes de uma consulta específica
  def show
    render json: @consulta
  end

  # POST /consulta or /consulta.json
  # Cria uma nova consulta com os parâmetros fornecidos
  def create
    @consulta = Consulta.new(consulta_params)

    if @consulta.save
      render json: @consulta, status: :created
    else
      render json: @consulta.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /consulta/1 or /consulta/1.json
  # Atualiza uma consulta existente com os parâmetros fornecidos
  def update
    if @consulta.update(consulta_params)
      render json: @consulta, status: :ok
    else
      render json: @consulta.errors, status: :unprocessable_entity
    end
  end

  # DELETE /consulta/1 or /consulta/1.json
  # Remove uma consulta específica do banco de dados
  def destroy
    @consulta.destroy!
    render json: { message: "Consulta foi destruída com sucesso." }, status: :no_content
  end

  private
    # Usa callbacks para compartilhar configurações ou restrições comuns entre as ações.
    def set_consulta
      @consulta = Consulta.find(params[:id])
    end

    # Permite apenas uma lista de parâmetros confiáveis.
    def consulta_params
      params.require(:consulta).permit(:veterinario_id, :animal_id, :data, :hora, :observacao)
    end
end
