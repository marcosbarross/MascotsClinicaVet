class PrescricaoMedicasController < ApplicationController
  def index
    @prescricoes = PrescricaoMedica.all
  end

  def show
    @prescricao = PrescricaoMedica.find(params[:id])
  end

  def new
    @prescricao = PrescricaoMedica.new
    @consultas = Consulta.all # Para selecionar uma consulta
  end

  def create
    @prescricao = PrescricaoMedica.new(prescricao_params)
    if @prescricao.save
      redirect_to @prescricao
    else
      @consultas = Consulta.all
      render :new
    end
  end

  def edit
    @prescricao = PrescricaoMedica.find(params[:id])
    @consultas = Consulta.all
  end

  def update
    @prescricao = PrescricaoMedica.find(params[:id])
    if @prescricao.update(prescricao_params)
      redirect_to @prescricao
    else
      @consultas = Consulta.all
      render :edit
    end
  end

  def destroy
    @prescricao = PrescricaoMedica.find(params[:id])
    @prescricao.destroy
    redirect_to prescricao_medicas_path
  end

  private

  def prescricao_params
    params.require(:prescricao_medica).permit(:consulta_id, :data, :medicamentos_prescritos, :dosagens, :observacao)
  end
end
