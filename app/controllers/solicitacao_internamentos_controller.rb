class SolicitacaoInternamentosController < ApplicationController
  # Define a solicitação de internamento antes de executar as ações específicas.
  before_action :set_solicitacao_internamento, only: %i[ show update destroy ]

  # GET /solicitacao_internamentos
  # Exibe uma lista de todas as solicitações de internamento
  def index
    @solicitacao_internamentos = SolicitacaoInternamento.all

    render json: @solicitacao_internamentos
  end

  # GET /solicitacao_internamentos/1
  # Exibe os detalhes de uma solicitação de internamento específica
  def show
    render json: @solicitacao_internamento
  end

  # POST /solicitacao_internamentos
  # Cria uma nova solicitação de internamento com os parâmetros fornecidos
  def create
    @solicitacao_internamento = SolicitacaoInternamento.new(solicitacao_internamento_params)

    if @solicitacao_internamento.save
      render json: @solicitacao_internamento, status: :created, location: @solicitacao_internamento
    else
      render json: @solicitacao_internamento.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /solicitacao_internamentos/1
  # Atualiza uma solicitação de internamento existente com os parâmetros fornecidos
  def update
    if @solicitacao_internamento.update(solicitacao_internamento_params)
      render json: @solicitacao_internamento
    else
      render json: @solicitacao_internamento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /solicitacao_internamentos/1
  # Remove uma solicitação de internamento específica do banco de dados
  def destroy
    @solicitacao_internamento.destroy!

    head :no_content # Resposta sem conteúdo após a exclusão
  end

  private
    # Usa callbacks para compartilhar configurações ou restrições comuns entre as ações.
    def set_solicitacao_internamento
      @solicitacao_internamento = SolicitacaoInternamento.find(params[:id])
    end

    # Permite apenas uma lista de parâmetros confiáveis.
    def solicitacao_internamento_params
      params.require(:solicitacao_internamento).permit(:consulta_id, :data_solicitacao, :observacao)
    end
end
