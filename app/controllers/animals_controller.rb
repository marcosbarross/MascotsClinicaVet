class AnimalsController < ApplicationController
  # Antes de executar ações específicas, define o animal com base no ID fornecido.
  before_action :set_animal, only: %i[ show edit update destroy ]

  # GET /animals or /animals.json
  # Exibe uma lista de todos os animais
  def index
    @animals = Animal.all
  end

  # GET /animals/1 or /animals/1.json
  # Exibe os detalhes de um animal específico
  def show
  end

  # GET /animals/new
  # Exibe o formulário para criar um novo animal
  def new
    @animal = Animal.new
  end

  # GET /animals/1/edit
  # Exibe o formulário para editar um animal existente
  def edit
  end

  # POST /animals or /animals.json
  # Cria um novo animal com os parâmetros fornecidos
  def create
    @animal = Animal.new(animal_params)

    respond_to do |format|
      if @animal.save
        format.html { redirect_to animal_url(@animal), notice: "Animal foi criado com sucesso." }
        format.json { render :show, status: :created, location: @animal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animals/1 or /animals/1.json
  # Atualiza um animal existente com os parâmetros fornecidos
  def update
    respond_to do |format|
      if @animal.update(animal_params)
        format.html { redirect_to animal_url(@animal), notice: "Animal foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @animal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animals/1 or /animals/1.json
  # Remove um animal específico do banco de dados
  def destroy
    @animal.destroy!

    respond_to do |format|
      format.html { redirect_to animals_url, notice: "Animal foi removido com sucesso." }
      format.json { head :no_content }
    end
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
