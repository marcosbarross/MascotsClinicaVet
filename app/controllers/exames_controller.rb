class ExamesController < ApplicationController
  # Antes de executar ações específicas, define o exame com base no ID fornecido.
  before_action :set_exame, only: %i[ show edit update destroy ]

  # GET /exames or /exames.json
  # Exibe uma lista de todos os exames
  def index
    @exames = Exame.all
  end

  # GET /exames/1 or /exames/1.json
  # Exibe os detalhes de um exame específico
  def show
  end

  # GET /exames/new
  # Exibe o formulário para criar um novo exame
  def new
    @exame = Exame.new
  end

  # GET /exames/1/edit
  # Exibe o formulário para editar um exame existente
  def edit
  end

  # POST /exames or /exames.json
  # Cria um novo exame com os parâmetros fornecidos
  def create
    @exame = Exame.new(exame_params)

    respond_to do |format|
      if @exame.save
        format.html { redirect_to exame_url(@exame), notice: "Exame foi criado com sucesso." }
        format.json { render :show, status: :created, location: @exame }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exames/1 or /exames/1.json
  # Atualiza um exame existente com os parâmetros fornecidos
  def update
    respond_to do |format|
      if @exame.update(exame_params)
        format.html { redirect_to exame_url(@exame), notice: "Exame foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @exame }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exames/1 or /exames/1.json
  # Remove um exame específico do banco de dados
  def destroy
    @exame.destroy!

    respond_to do |format|
      format.html { redirect_to exames_url, notice: "Exame foi destruído com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Usa callbacks para compartilhar configurações ou restrições comuns entre as ações.
    def set_exame
      @exame = Exame.find(params[:id])
    end

    # Permite apenas uma lista de parâmetros confiáveis.
    def exame_params
      params.require(:exame).permit(:consulta_id, :nome_exame, :status_exame, :resultado)
    end
end
