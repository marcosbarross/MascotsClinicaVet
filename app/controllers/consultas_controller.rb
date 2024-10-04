class ConsultasController < ApplicationController
  def index
    @consultas = Consulta.all
  end

  def show
    @consulta = Consulta.find(params[:id])
  end

  def new
    @consulta = Consulta.new
    @veterinarios = Funcionario.where(cargo: 'Vet') # Supondo que veterinários têm o cargo 'Vet'
    @animais = Animal.all # Para selecionar um animal
  end

  def create
    @consulta = Consulta.new(consulta_params)
    if @consulta.save
      redirect_to @consulta
    else
      @veterinarios = Funcionario.where(cargo: 'Vet')
      @animais = Animal.all
      render :new
    end
  end

  def edit
    @consulta = Consulta.find(params[:id])
    @veterinarios = Funcionario.where(cargo: 'Vet')
    @animais = Animal.all
  end

  def update
    @consulta = Consulta.find(params[:id])
    if @consulta.update(consulta_params)
      redirect_to @consulta
    else
      @veterinarios = Funcionario.where(cargo: 'Vet')
      @animais = Animal.all
      render :edit
    end
  end

  def destroy
    @consulta = Consulta.find(params[:id])
    @consulta.destroy
    redirect_to consultas_path
  end

  private

  def consulta_params
    params.require(:consulta).permit(:data, :hora, :observacao, :veterinario_id, :animal_id)
  end
end
