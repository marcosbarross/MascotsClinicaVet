class InternamentosController < ApplicationController
  # Antes de executar ações específicas, define o internamento com base no ID fornecido.
  before_action :set_internamento, only: %i[ show update destroy ]

  # GET /internamentos or /internamentos.json
  # Exibe uma lista de todos os internamentos
  def index
    @internamentos = Internamento.all
    render json: @internamentos
  end

  # GET /internamentos/1 or /internamentos/1.json
  # Exibe os detalhes de um internamento específico
  def show
    render json: @internamento
  end

  # POST /internamentos or /internamentos.json
  # Cria um novo internamento com os parâmetros fornecidos
  def create
    @internamento = Internamento.new(internamento_params)

    if @internamento.save
      render json: @internamento, status: :created
    else
      render json: @internamento.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /internamentos/1 or /internamentos/1.json
  # Atualiza um internamento existente com os parâmetros fornecidos
  def update
    if @internamento.update(internamento_params)
      render json: @internamento, status: :ok
    else
      render json: @internamento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /internamentos/1 or /internamentos/1.json
  # Remove um internamento específico do banco de dados
  def destroy
    @internamento.destroy!
    render json: { message: "Internamento foi destruído com sucesso." }, status: :no_content
  end

  private
    # Usa callbacks para compartilhar configurações ou restrições comuns entre as ações.
    def set_internamento
      @internamento = Internamento.find(params[:id])
    end

    # Permite apenas uma lista de parâmetros confiáveis.
    def internamento_params
      params.require(:internamento).permit(:consulta_id, :data_inicio, :data_fim, :medicamento, :quantidade_medicamento, :obs_monitoramento)
    end
end
