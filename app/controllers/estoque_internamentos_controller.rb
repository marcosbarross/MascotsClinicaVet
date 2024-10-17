class EstoqueInternamentosController < ApplicationController
  # Antes de executar ações específicas, define o estoque de internamento com base no ID fornecido.
  before_action :set_estoque_internamento, only: %i[ show edit update destroy ]

  # GET /estoque_internamentos or /estoque_internamentos.json
  # Exibe uma lista de todos os estoques de internamento
  def index
    @estoque_internamentos = EstoqueInternamento.all
  end

  # GET /estoque_internamentos/1 or /estoque_internamentos/1.json
  # Exibe os detalhes de um estoque de internamento específico
  def show
  end

  # GET /estoque_internamentos/new
  # Exibe o formulário para criar um novo estoque de internamento
  def new
    @estoque_internamento = EstoqueInternamento.new
  end

  # GET /estoque_internamentos/1/edit
  # Exibe o formulário para editar um estoque de internamento existente
  def edit
  end

  # POST /estoque_internamentos or /estoque_internamentos.json
  # Cria um novo estoque de internamento com os parâmetros fornecidos
  def create
    @estoque_internamento = EstoqueInternamento.new(estoque_internamento_params)

    respond_to do |format|
      if @estoque_internamento.save
        format.html { redirect_to estoque_internamento_url(@estoque_internamento), notice: "Estoque de internamento foi criado com sucesso." }
        format.json { render :show, status: :created, location: @estoque_internamento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @estoque_internamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estoque_internamentos/1 or /estoque_internamentos/1.json
  # Atualiza um estoque de internamento existente com os parâmetros fornecidos
  def update
    respond_to do |format|
      if @estoque_internamento.update(estoque_internamento_params)
        format.html { redirect_to estoque_internamento_url(@estoque_internamento), notice: "Estoque de internamento foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @estoque_internamento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @estoque_internamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estoque_internamentos/1 or /estoque_internamentos/1.json
  # Remove um estoque de internamento específico do banco de dados
  def destroy
    @estoque_internamento.destroy!

    respond_to do |format|
      format.html { redirect_to estoque_internamentos_url, notice: "Estoque de internamento foi destruído com sucesso." }
      format.json { head :no_content }
    end
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
