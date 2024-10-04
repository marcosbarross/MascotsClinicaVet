class ExamesController < ApplicationController
  def index
    @exames = Exame.all
  end

  def show
    @exame = Exame.find(params[:id])
  end

  def new
    @exame = Exame.new
    @consultas = Consulta.all # Para selecionar uma consulta
  end

  def create
    @exame = Exame.new(exame_params)
    if @exame.save
      redirect_to @exame
    else
      @consultas = Consulta.all
      render :new
    end
  end

  def edit
    @exame = Exame.find(params[:id])
    @consultas = Consulta.all
  end

  def update
    @exame = Exame.find(params[:id])
    if @exame.update(exame_params)
      redirect_to @exame
    else
      @consultas = Consulta.all
      render :edit
    end
  end

  def destroy
    @exame = Exame.find(params[:id])
    @exame.destroy
    redirect_to exames_path
  end

  private

  def exame_params
    params.require(:exame).permit(:consulta_id, :nome_exame, :status_exame, :resultado)
  end
end
