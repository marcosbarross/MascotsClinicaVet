class EstoqueVendasController < ApplicationController
    before_action :set_estoque_venda, only: [:show, :edit, :update, :destroy]
  
    # GET /estoque_vendas
    def index
      @estoque_vendas = EstoqueVenda.all
    end
  
    # GET /estoque_vendas/1
    def show
    end
  
    # GET /estoque_vendas/new
    def new
      @estoque_venda = EstoqueVenda.new
    end
  
    # GET /estoque_vendas/1/edit
    def edit
    end
  
    # POST /estoque_vendas
    def create
      @estoque_venda = EstoqueVenda.new(estoque_venda_params)
  
      if @estoque_venda.save
        redirect_to @estoque_venda, notice: 'Registro de venda foi criado com sucesso.'
      else
        render :new
      end
    end
  
    # PATCH/PUT /estoque_vendas/1
    def update
      if @estoque_venda.update(estoque_venda_params)
        redirect_to @estoque_venda, notice: 'Registro de venda foi atualizado com sucesso.'
      else
        render :edit
      end
    end
  
    # DELETE /estoque_vendas/1
    def destroy
      @estoque_venda.destroy
      redirect_to estoque_vendas_url, notice: 'Registro de venda foi deletado com sucesso.'
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_estoque_venda
        @estoque_venda = EstoqueVenda.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def estoque_venda_params
        params.require(:estoque_venda).permit(:medicamento, :preco, :quantidade_disponivel, :quantidade_venda, :fornecedor)
      end
  end
  