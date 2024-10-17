class TutorsController < ApplicationController
  # Define o tutor antes de executar as ações específicas.
  before_action :set_tutor, only: %i[ show update destroy ]

  # GET /tutors
  # Exibe uma lista de todos os tutores
  def index
    @tutors = Tutor.all
    render json: @tutors
  end

  # GET /tutors/1
  # Exibe os detalhes de um tutor específico
  def show
    render json: @tutor
  end

  # POST /tutors
  # Cria um novo tutor com os parâmetros fornecidos
  def create
    @tutor = Tutor.new(tutor_params)

    if @tutor.save
      render json: @tutor, status: :created, location: @tutor
    else
      render json: @tutor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tutors/1
  # Atualiza um tutor existente com os parâmetros fornecidos
  def update
    if @tutor.update(tutor_params)
      render json: @tutor
    else
      render json: @tutor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tutors/1
  # Remove um tutor específico do banco de dados
  def destroy
    @tutor.destroy!

    head :no_content # Resposta sem conteúdo após a exclusão
  end

  private
    # Usa callbacks para compartilhar configurações ou restrições comuns entre as ações.
    def set_tutor
      @tutor = Tutor.find(params[:id])
    end

    # Permite apenas uma lista de parâmetros confiáveis.
    def tutor_params
      params.require(:tutor).permit(:nome, :endereco, :telefone, :email)
    end
end
