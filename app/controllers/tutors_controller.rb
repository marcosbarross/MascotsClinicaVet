class TutorsController < ApplicationController
  # Define o tutor antes de executar as ações específicas.
  before_action :set_tutor, only: %i[ show edit update destroy ]

  # GET /tutors ou /tutors.json
  # Exibe uma lista de todos os tutores
  def index
    @tutors = Tutor.all
  end

  # GET /tutors/1 ou /tutors/1.json
  # Exibe os detalhes de um tutor específico
  def show
  end

  # GET /tutors/new
  # Exibe o formulário para criar um novo tutor
  def new
    @tutor = Tutor.new
  end

  # GET /tutors/1/edit
  # Exibe o formulário para editar um tutor existente
  def edit
  end

  # POST /tutors ou /tutors.json
  # Cria um novo tutor com os parâmetros fornecidos
  def create
    @tutor = Tutor.new(tutor_params)

    respond_to do |format|
      if @tutor.save
        format.html { redirect_to tutor_url(@tutor), notice: "Tutor foi criado com sucesso." }
        format.json { render :show, status: :created, location: @tutor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tutor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutors/1 ou /tutors/1.json
  # Atualiza um tutor existente com os parâmetros fornecidos
  def update
    respond_to do |format|
      if @tutor.update(tutor_params)
        format.html { redirect_to tutor_url(@tutor), notice: "Tutor foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @tutor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tutor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutors/1 ou /tutors/1.json
  # Remove um tutor específico do banco de dados
  def destroy
    @tutor.destroy!

    respond_to do |format|
      format.html { redirect_to tutors_url, notice: "Tutor foi excluído com sucesso." }
      format.json { head :no_content }
    end
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
