class ConsultaController < ApplicationController
  # Antes de executar ações específicas, define a consulta com base no ID fornecido.
  before_action :set_consultum, only: %i[ show edit update destroy ]

  # GET /consulta or /consulta.json
  # Exibe uma lista de todas as consultas
  def index
    @consulta = Consultum.all
  end

  # GET /consulta/1 or /consulta/1.json
  # Exibe os detalhes de uma consulta específica
  def show
  end

  # GET /consulta/new
  # Exibe o formulário para criar uma nova consulta
  def new
    @consultum = Consultum.new
  end

  # GET /consulta/1/edit
  # Exibe o formulário para editar uma consulta existente
  def edit
  end

  # POST /consulta or /consulta.json
  # Cria uma nova consulta com os parâmetros fornecidos
  def create
    @consultum = Consultum.new(consultum_params)

    respond_to do |format|
      if @consultum.save
        format.html { redirect_to consultum_url(@consultum), notice: "Consulta foi criada com sucesso." }
        format.json { render :show, status: :created, location: @consultum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @consultum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consulta/1 or /consulta/1.json
  # Atualiza uma consulta existente com os parâmetros fornecidos
  def update
    respond_to do |format|
      if @consultum.update(consultum_params)
        format.html { redirect_to consultum_url(@consultum), notice: "Consulta foi atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @consultum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @consultum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consulta/1 or /consulta/1.json
  # Remove uma consulta específica do banco de dados
  def destroy
    @consultum.destroy!

    respond_to do |format|
      format.html { redirect_to consulta_url, notice: "Consulta foi destruída com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Usa callbacks para compartilhar configurações ou restrições comuns entre as ações.
    def set_consultum
      @consultum = Consultum.find(params[:id])
    end

    # Permite apenas uma lista de parâmetros confiáveis.
    def consultum_params
      params.require(:consultum).permit(:veterinario, :animal_id, :data, :hora, :observacao)
    end
end
