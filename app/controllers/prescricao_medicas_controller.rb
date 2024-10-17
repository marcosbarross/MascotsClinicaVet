class PrescricaoMedicasController < ApplicationController
  # Antes de executar ações específicas, define a prescrição médica com base no ID fornecido.
  before_action :set_prescricao_medica, only: %i[ show edit update destroy ]

  # GET /prescricao_medicas or /prescricao_medicas.json
  # Exibe uma lista de todas as prescrições médicas
  def index
    @prescricao_medicas = PrescricaoMedica.all
  end

  # GET /prescricao_medicas/1 or /prescricao_medicas/1.json
  # Exibe os detalhes de uma prescrição médica específica
  def show
  end

  # GET /prescricao_medicas/new
  # Exibe o formulário para criar uma nova prescrição médica
  def new
    @prescricao_medica = PrescricaoMedica.new
  end

  # GET /prescricao_medicas/1/edit
  # Exibe o formulário para editar uma prescrição médica existente
  def edit
  end

  # POST /prescricao_medicas or /prescricao_medicas.json
  # Cria uma nova prescrição médica com os parâmetros fornecidos
  def create
    @prescricao_medica = PrescricaoMedica.new(prescricao_medica_params)

    respond_to do |format|
      if @prescricao_medica.save
        format.html { redirect_to prescricao_medica_url(@prescricao_medica), notice: "Prescrição médica foi criada com sucesso." }
        format.json { render :show, status: :created, location: @prescricao_medica }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prescricao_medica.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prescricao_medicas/1 or /prescricao_medicas/1.json
  # Atualiza uma prescrição médica existente com os parâmetros fornecidos
  def update
    respond_to do |format|
      if @prescricao_medica.update(prescricao_medica_params)
        format.html { redirect_to prescricao_medica_url(@prescricao_medica), notice: "Prescrição médica foi atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @prescricao_medica }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prescricao_medica.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prescricao_medicas/1 or /prescricao_medicas/1.json
  # Remove uma prescrição médica específica do banco de dados
  def destroy
    @prescricao_medica.destroy!

    respond_to do |format|
      format.html { redirect_to prescricao_medicas_url, notice: "Prescrição médica foi destruída com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Usa callbacks para compartilhar configurações ou restrições comuns entre as ações.
    def set_prescricao_medica
      @prescricao_medica = PrescricaoMedica.find(params[:id])
    end

    # Permite apenas uma lista de parâmetros confiáveis.
    def prescricao_medica_params
      params.require(:prescricao_medica).permit(:consulta_id, :data, :medicamentos_prescritos, :dosagens, :observacao)
    end
end
