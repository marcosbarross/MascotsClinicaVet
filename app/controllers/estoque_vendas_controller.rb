class EstoqueVendasController < ApplicationController
  # Antes de executar ações específicas, define o estoque de venda com base no ID fornecido.
  before_action :set_estoque_venda, only: %i[ show edit update destroy ]

  # GET /estoque_vendas or /estoque_vendas.json
  # Exibe uma lista de todos os estoques de venda
  def index
    @estoque_vendas = EstoqueVenda.all
  end

  # GET /estoque_vendas/1 or /estoque_vendas/1.json
  # Exibe os detalhes de um estoque de venda específico
  def show
  end

  # GET /estoque_vendas/new
  # Exibe o formulário para criar um novo estoque de venda
  def new
    @estoque_venda = EstoqueVenda.new
  end

  # GET /estoque_vendas/1/edit
  # Exibe o formulário para editar um estoque de venda existente
  def edit
  end

  # POST /estoque_vendas or /estoque_vendas.json
  # Cria um novo estoque de venda com os parâmetros fornecidos
  def create
    @estoque_venda = EstoqueVenda.new(estoque_venda_params)

    respond_to do |format|
      if @estoque_venda.save
        format.html { redirect_to estoque_venda_url(@estoque_venda), notice: "Estoque de venda foi criado com sucesso." }
        format.json { render :show, status: :created, location: @estoque_venda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @estoque_venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estoque_vendas/1 or /estoque_vendas/1.json
  # Atualiza um estoque de venda existente com os parâmetros fornecidos
  def update
    respond_to do |format|
      if @estoque_venda.update(estoque_venda_params)
        format.html { redirect_to estoque_venda_url(@estoque_venda), notice: "Estoque de venda foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @estoque_venda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @estoque_venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estoque_vendas/1 or /estoque_vendas/1.json
  # Remove um estoque de venda específico do banco de dados
  def destroy
    @estoque_venda.destroy!

    respond_to do |format|
      format.html { redirect_to estoque_vendas_url, notice: "Estoque de venda foi destruído com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Usa callbacks para compartilhar configurações ou restrições comuns entre as ações.
    def set_estoque_venda
      @estoque_venda = EstoqueVenda.find(params[:id])
    end

    # Permite apenas uma lista de parâmetros confiáveis.
    def estoque_venda_params
      params.require(:estoque_venda).permit(:medicamento, :preco, :quantidade_disponivel, :quantidade_venda, :fornecedor)
    end
end
