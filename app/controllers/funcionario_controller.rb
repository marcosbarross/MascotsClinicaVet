class FuncionariosController < ApplicationController
  def index
    @funcionarios = Funcionario.all
  end

  def show
    @funcionario = Funcionario.find(params[:id])
  end

  def new
    @funcionario = Funcionario.new
  end

  def create
    @funcionario = Funcionario.new(funcionario_params)
    if @funcionario.save
      redirect_to @funcionario
    else
      render :new
    end
  end

  def edit
    @funcionario = Funcionario.find(params[:id])
  end

  def update
    @funcionario = Funcionario.find(params[:id])
    if @funcionario.update(funcionario_params)
      redirect_to @funcionario
    else
      render :edit
    end
  end

  def destroy
    @funcionario = Funcionario.find(params[:id])
    @funcionario.destroy
    redirect_to funcionarios_path
  end

  private

  def funcionario_params
    params.require(:funcionario).permit(:nome, :contato, :cargo, :login, :senha)
  end
end
