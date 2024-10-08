class EstoqueInternamentosController < ApplicationController
  before_action :set_estoque_internamento, only: %i[ show edit update destroy ]

  # GET /estoque_internamentos or /estoque_internamentos.json
  def index
    @estoque_internamentos = EstoqueInternamento.all
  end

  # GET /estoque_internamentos/1 or /estoque_internamentos/1.json
  def show
  end

  # GET /estoque_internamentos/new
  def new
    @estoque_internamento = EstoqueInternamento.new
  end

  # GET /estoque_internamentos/1/edit
  def edit
  end

  # POST /estoque_internamentos or /estoque_internamentos.json
  def create
    @estoque_internamento = EstoqueInternamento.new(estoque_internamento_params)

    respond_to do |format|
      if @estoque_internamento.save
        format.html { redirect_to estoque_internamento_url(@estoque_internamento), notice: "Estoque internamento was successfully created." }
        format.json { render :show, status: :created, location: @estoque_internamento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @estoque_internamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estoque_internamentos/1 or /estoque_internamentos/1.json
  def update
    respond_to do |format|
      if @estoque_internamento.update(estoque_internamento_params)
        format.html { redirect_to estoque_internamento_url(@estoque_internamento), notice: "Estoque internamento was successfully updated." }
        format.json { render :show, status: :ok, location: @estoque_internamento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @estoque_internamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estoque_internamentos/1 or /estoque_internamentos/1.json
  def destroy
    @estoque_internamento.destroy!

    respond_to do |format|
      format.html { redirect_to estoque_internamentos_url, notice: "Estoque internamento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estoque_internamento
      @estoque_internamento = EstoqueInternamento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def estoque_internamento_params
      params.require(:estoque_internamento).permit(:solicitacao_internamento_id, :medicamento, :quantidade_disponivel, :quantidade_utilizada, :quantidade_minima, :fornecedor)
    end
end
