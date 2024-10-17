class ExamesController < ApplicationController
  # Antes de executar ações específicas, define o exame com base no ID fornecido.
  before_action :set_exame, only: %i[ show edit update destroy ]

  # GET /exames or /exames.json
  # Exibe uma lista de todos os exames
  def index
    @exames = Exame.all
    render json: @exames
  end

  # GET /exames/1 or /exames/1.json
  # Exibe os detalhes de um exame específico
  def show
    render json: @exame
  end

  # POST /exames or /exames.json
  # Cria um novo exame com os parâmetros fornecidos
  def create
    @exame = Exame.new(exame_params)

    if @exame.save
      render json: @exame, status: :created
    else
      render json: @exame.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /exames/1 or /exames/1.json
  # Atualiza um exame existente com os parâmetros fornecidos
  def update
    if @exame.update(exame_params)
      render json: @exame, status: :ok
    else
      render json: @exame.errors, status: :unprocessable_entity
    end
  end

  # DELETE /exames/1 or /exames/1.json
  # Remove um exame específico do banco de dados
  def destroy
    @exame.destroy!
    render json: { message: "Exame foi destruído com sucesso." }, status: :no_content
  end

  private
    # Usa callbacks para compartilhar configurações ou restrições comuns entre as ações.
    def set_exame
      @exame = Exame.find(params[:id])
    end

    # Permite apenas uma lista de parâmetros confiáveis.
    def exame_params
      params.require(:exame).permit(:consulta_id, :nome_exame, :status_exame, :resultado)
    end
end
