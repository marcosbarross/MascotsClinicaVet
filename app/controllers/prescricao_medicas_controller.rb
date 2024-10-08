class PrescricaoMedicasController < ApplicationController
  before_action :set_prescricao_medica, only: %i[ show edit update destroy ]

  # GET /prescricao_medicas or /prescricao_medicas.json
  def index
    @prescricao_medicas = PrescricaoMedica.all
  end

  # GET /prescricao_medicas/1 or /prescricao_medicas/1.json
  def show
  end

  # GET /prescricao_medicas/new
  def new
    @prescricao_medica = PrescricaoMedica.new
  end

  # GET /prescricao_medicas/1/edit
  def edit
  end

  # POST /prescricao_medicas or /prescricao_medicas.json
  def create
    @prescricao_medica = PrescricaoMedica.new(prescricao_medica_params)

    respond_to do |format|
      if @prescricao_medica.save
        format.html { redirect_to prescricao_medica_url(@prescricao_medica), notice: "Prescricao medica was successfully created." }
        format.json { render :show, status: :created, location: @prescricao_medica }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prescricao_medica.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prescricao_medicas/1 or /prescricao_medicas/1.json
  def update
    respond_to do |format|
      if @prescricao_medica.update(prescricao_medica_params)
        format.html { redirect_to prescricao_medica_url(@prescricao_medica), notice: "Prescricao medica was successfully updated." }
        format.json { render :show, status: :ok, location: @prescricao_medica }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prescricao_medica.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prescricao_medicas/1 or /prescricao_medicas/1.json
  def destroy
    @prescricao_medica.destroy!

    respond_to do |format|
      format.html { redirect_to prescricao_medicas_url, notice: "Prescricao medica was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prescricao_medica
      @prescricao_medica = PrescricaoMedica.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prescricao_medica_params
      params.require(:prescricao_medica).permit(:consulta_id, :data, :medicamentos_prescritos, :dosagens, :observacao)
    end
end
