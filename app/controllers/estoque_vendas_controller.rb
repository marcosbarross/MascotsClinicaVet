class EstoqueVendasController < ApplicationController
  before_action :set_estoque_venda, only: %i[ show edit update destroy ]

  # GET /estoque_vendas or /estoque_vendas.json
  def index
    @estoque_vendas = EstoqueVenda.all
  end

  # GET /estoque_vendas/1 or /estoque_vendas/1.json
  def show
  end

  # GET /estoque_vendas/new
  def new
    @estoque_venda = EstoqueVenda.new
  end

  # GET /estoque_vendas/1/edit
  def edit
  end

  # POST /estoque_vendas or /estoque_vendas.json
  def create
    @estoque_venda = EstoqueVenda.new(estoque_venda_params)

    respond_to do |format|
      if @estoque_venda.save
        format.html { redirect_to estoque_venda_url(@estoque_venda), notice: "Estoque venda was successfully created." }
        format.json { render :show, status: :created, location: @estoque_venda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @estoque_venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estoque_vendas/1 or /estoque_vendas/1.json
  def update
    respond_to do |format|
      if @estoque_venda.update(estoque_venda_params)
        format.html { redirect_to estoque_venda_url(@estoque_venda), notice: "Estoque venda was successfully updated." }
        format.json { render :show, status: :ok, location: @estoque_venda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @estoque_venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estoque_vendas/1 or /estoque_vendas/1.json
  def destroy
    @estoque_venda.destroy!

    respond_to do |format|
      format.html { redirect_to estoque_vendas_url, notice: "Estoque venda was successfully destroyed." }
      format.json { head :no_content }
    end
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
