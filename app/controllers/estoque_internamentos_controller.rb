class EstoqueInternamentosController < ApplicationController
  # Antes de executar ações específicas, define o estoque de internamento com base no ID fornecido.
  before_action :set_estoque_internamento, only: %i[ show edit update destroy ]

  # GET /estoque_internamentos or /estoque_internamentos.json
  # Exibe uma lista de todos os estoques de internamento
  def index
    @estoque_internamentos = EstoqueInternamento.all
    render json: @estoque_internamentos
  end

  # GET /estoque_internamentos/1 or /estoque_internamentos/1.json
  # Exibe os detalhes de um estoque de internamento específico
  def show
    render json: @estoque_internamento
  end

  # POST /estoque_internamentos or /estoque_internamentos.json
  # Cria um novo estoque de internamento com os parâmetros fornecidos
  def create
    @estoque_internamento = EstoqueInternamento.new(estoque_internamento_params)

    if @estoque_internamento.save
      render json: @estoque_internamento, status: :created
    else
      render json: @estoque_internamento.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /estoque_internamentos/1 or /estoque_internamentos/1.json
  # Atualiza um estoque de internamento existente com os parâmetros fornecidos
  def update
    if @estoque_internamento.update(estoque_internamento_params)
      render json: @estoque_internamento, status: :ok
    else
      render json: @estoque_internamento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /estoque_internamentos/1 or /estoque_internamentos/1.json
  # Remove um estoque de internamento específico do banco de dados
  def destroy
    @estoque_internamento.destroy!
    render json: { message: "Estoque de internamento foi destruído com sucesso." }, status: :no_content
  end

  private
    # Usa callbacks para compartilhar configurações ou restrições comuns entre as ações.
    def set_estoque_internamento
      @estoque_internamento = EstoqueInternamento.find(params[:id])
    end

    # Permite apenas uma lista de parâmetros confiáveis.
    def estoque_internamento_params
      params.require(:estoque_internamento).permit(:solicitacao_internamento_id, :medicamento, :quantidade_disponivel, :quantidade_utilizada, :quantidade_minima, :fornecedor)
    end
end
