class PrescricaoMedicasController < ApplicationController
  # Antes de executar ações específicas, define a prescrição médica com base no ID fornecido.
  before_action :set_prescricao_medica, only: %i[ show update destroy ]

  # GET /prescricao_medicas or /prescricao_medicas.json
  # Exibe uma lista de todas as prescrições médicas
  def index
    @prescricao_medicas = PrescricaoMedica.all
    render json: @prescricao_medicas
  end

  # GET /prescricao_medicas/1 or /prescricao_medicas/1.json
  # Exibe os detalhes de uma prescrição médica específica
  def show
    render json: @prescricao_medica
  end

  # POST /prescricao_medicas or /prescricao_medicas.json
  # Cria uma nova prescrição médica com os parâmetros fornecidos
  def create
    @prescricao_medica = PrescricaoMedica.new(prescricao_medica_params)

    if @prescricao_medica.save
      render json: @prescricao_medica, status: :created
    else
      render json: @prescricao_medica.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /prescricao_medicas/1 or /prescricao_medicas/1.json
  # Atualiza uma prescrição médica existente com os parâmetros fornecidos
  def update
    if @prescricao_medica.update(prescricao_medica_params)
      render json: @prescricao_medica, status: :ok
    else
      render json: @prescricao_medica.errors, status: :unprocessable_entity
    end
  end

  # DELETE /prescricao_medicas/1 or /prescricao_medicas/1.json
  # Remove uma prescrição médica específica do banco de dados
  def destroy
    @prescricao_medica.destroy!
    render json: { message: "Prescrição médica foi destruída com sucesso." }, status: :no_content
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
