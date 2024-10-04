class AnimaisController < ApplicationController
  def index
    @animais = Animal.all
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def new
    @animal = Animal.new
    @tutores = Tutor.all # Para selecionar um tutor
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to @animal
    else
      @tutores = Tutor.all
      render :new
    end
  end

  def edit
    @animal = Animal.find(params[:id])
    @tutores = Tutor.all # Para selecionar um tutor
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update(animal_params)
      redirect_to @animal
    else
      @tutores = Tutor.all
      render :edit
    end
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
    redirect_to animais_path
  end

  private

  def animal_params
    params.require(:animal).permit(:nome, :idade, :especie, :raca, :peso, :tutor_id)
  end
end
