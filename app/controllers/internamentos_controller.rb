class InternamentosController < ApplicationController
  before_action :set_internamento, only: %i[ show edit update destroy ]

  # GET /internamentos or /internamentos.json
  def index
    @internamentos = Internamento.all
  end

  # GET /internamentos/1 or /internamentos/1.json
  def show
  end

  # GET /internamentos/new
  def new
    @internamento = Internamento.new
  end

  # GET /internamentos/1/edit
  def edit
  end

  # POST /internamentos or /internamentos.json
  def create
    @internamento = Internamento.new(internamento_params)

    respond_to do |format|
      if @internamento.save
        format.html { redirect_to internamento_url(@internamento), notice: "Internamento was successfully created." }
        format.json { render :show, status: :created, location: @internamento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @internamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /internamentos/1 or /internamentos/1.json
  def update
    respond_to do |format|
      if @internamento.update(internamento_params)
        format.html { redirect_to internamento_url(@internamento), notice: "Internamento was successfully updated." }
        format.json { render :show, status: :ok, location: @internamento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @internamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /internamentos/1 or /internamentos/1.json
  def destroy
    @internamento.destroy!

    respond_to do |format|
      format.html { redirect_to internamentos_url, notice: "Internamento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internamento
      @internamento = Internamento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def internamento_params
      params.require(:internamento).permit(:consulta_id, :data_inicio, :data_fim, :medicamento, :quantidade_medicamento, :obs_monitoramento)
    end
end
