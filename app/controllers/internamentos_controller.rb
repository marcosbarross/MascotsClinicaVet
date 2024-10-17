class InternamentosController < ApplicationController
  # Antes de executar ações específicas, define o internamento com base no ID fornecido.
  before_action :set_internamento, only: %i[ show edit update destroy ]

  # GET /internamentos or /internamentos.json
  # Exibe uma lista de todos os internamentos
  def index
    @internamentos = Internamento.all
  end

  # GET /internamentos/1 or /internamentos/1.json
  # Exibe os detalhes de um internamento específico
  def show
  end

  # GET /internamentos/new
  # Exibe o formulário para criar um novo internamento
  def new
    @internamento = Internamento.new
  end

  # GET /internamentos/1/edit
  # Exibe o formulário para editar um internamento existente
  def edit
  end

  # POST /internamentos or /internamentos.json
  # Cria um novo internamento com os parâmetros fornecidos
  def create
    @internamento = Internamento.new(internamento_params)

    respond_to do |format|
      if @internamento.save
        format.html { redirect_to internamento_url(@internamento), notice: "Internamento foi criado com sucesso." }
        format.json { render :show, status: :created, location: @internamento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @internamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /internamentos/1 or /internamentos/1.json
  # Atualiza um internamento existente com os parâmetros fornecidos
  def update
    respond_to do |format|
      if @internamento.update(internamento_params)
        format.html { redirect_to internamento_url(@internamento), notice: "Internamento foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @internamento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @internamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /internamentos/1 or /internamentos/1.json
  # Remove um internamento específico do banco de dados
  def destroy
    @internamento.destroy!

    respond_to do |format|
      format.html { redirect_to internamentos_url, notice: "Internamento foi destruído com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Usa callbacks para compartilhar configurações ou restrições comuns entre as ações.
    def set_internamento
      @internamento = Internamento.find(params[:id])
    end

    # Permite apenas uma lista de parâmetros confiáveis.
    def internamento_params
      params.require(:internamento).permit(:consulta_id, :data_inicio, :data_fim, :medicamento, :quantidade_medicamento, :obs_monitoramento)
    end
end
