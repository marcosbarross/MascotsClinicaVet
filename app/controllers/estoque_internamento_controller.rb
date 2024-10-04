class EstoqueInternamentosController < ApplicationController
  def index
    @estoques = EstoqueInternamento.all
  end

  def show
    @estoque = EstoqueInternamento.find(params[:id])
  end

  def new
    @estoque = EstoqueInternamento.new
    @internamentos = Internamento.all # Para selecionar uma solicitação de internamento
  end

  def create
    @estoque = EstoqueInternamento.new(estoque_params)
    if @estoque.save
      redirect_to @estoque
    else
      @internamentos = Internamento.all
      render :new
    end
  end

  def edit
    @estoque = EstoqueInternamento.find(params[:id])
    @internamentos = Internamento.all
  end

  def update
    @estoque = EstoqueInternamento.find(params[:id])
    if @estoque.update(estoque_params)
      redirect_to @estoque
    else
      @internamentos = Internamento.all
      render :edit
    end
  end

  def destroy
    @estoque = EstoqueInternamento.find(params[:id])
    @estoque.destroy
    redirect_to estoque_internamentos_path
  end

  private

  def estoque_params
    params.require(:estoque_internamento).permit(:solicitacao_internamento_id, :medicamento, :quantidade_disponivel, :quantidade_utilizada, :quantidade_minima, :fornecedor)
  end
end
