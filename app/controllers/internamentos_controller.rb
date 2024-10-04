class InternamentosController < ApplicationController
  def index
    @internamentos = Internamento.all
  end

  def show
    @internamento = Internamento.find(params[:id])
  end

  def new
    @internamento = Internamento.new
    @consultas = Consulta.all # Para selecionar uma consulta
  end

  def create
    @internamento = Internamento.new(internamento_params)
    if @internamento.save
      redirect_to @internamento
    else
      @consultas = Consulta.all
      render :new
    end
  end

  def edit
    @internamento = Internamento.find(params[:id])
    @consultas = Consulta.all
  end

  def update
    @internamento = Internamento.find(params[:id])
    if @internamento.update(internamento_params)
      redirect_to @internamento
    else
      @consultas = Consulta.all
      render :edit
    end
  end

  def destroy
    @internamento = Internamento.find(params[:id])
    @internamento.destroy
    redirect_to internamentos_path
  end

  private

  def internamento_params
    params.require(:internamento).permit(:consulta_id, :data_inicio, :data_fim, :medicamento, :quantidade_medicamento, :obs_monitoramento)
  end
end
