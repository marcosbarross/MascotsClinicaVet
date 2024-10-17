class AnimalsController < ApplicationController
  # Antes de executar ações específicas, define o animal com base no ID fornecido.
  before_action :set_animal, only: %i[ show edit update destroy ]

  # GET /animals or /animals.json
  # Exibe uma lista de todos os animais
  def index
    @animals = Animal.all
    render json: @animals
  end

  # GET /animals/1 or /animals/1.json
  # Exibe os detalhes de um animal específico
  def show
    render json: @animal
  end

  # POST /animals or /animals.json
  # Cria um novo animal com os parâmetros fornecidos
  def create
    @animal = Animal.new(animal_params)

    if @animal.save
      render json: @animal, status: :created
    else
      render json: @animal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /animals/1 or /animals/1.json
  # Atualiza um animal existente com os parâmetros fornecidos
  def update
    if @animal.update(animal_params)
      render json: @animal, status: :ok
    else
      render json: @animal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /animals/1 or /animals/1.json
  # Remove um animal específico do banco de dados
  def destroy
    @animal.destroy!
    render json: { message: "Animal foi removido com sucesso." }, status: :no_content
  end

  private
    # Usa callbacks para compartilhar configurações ou restrições comuns entre as ações.
    def set_animal
      @animal = Animal.find(params[:id])
    end

    # Permite apenas uma lista de parâmetros confiáveis.
    def animal_params
      params.require(:animal).permit(:nome, :idade, :especie, :raca, :peso, :tutor_id)
    end
end
