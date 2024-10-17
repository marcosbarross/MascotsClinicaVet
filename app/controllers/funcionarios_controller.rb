class FuncionariosController < ApplicationController
  # Antes de executar ações específicas, define o funcionário com base no ID fornecido.
  before_action :set_funcionario, only: %i[ show edit update destroy ]

  # GET /funcionarios or /funcionarios.json
  # Exibe uma lista de todos os funcionários
  def index
    @funcionarios = Funcionario.all
  end

  # GET /funcionarios/1 or /funcionarios/1.json
  # Exibe os detalhes de um funcionário específico
  def show
  end

  # GET /funcionarios/new
  # Exibe o formulário para criar um novo funcionário
  def new
    @funcionario = Funcionario.new
  end

  # GET /funcionarios/1/edit
  # Exibe o formulário para editar um funcionário existente
  def edit
  end

  # POST /funcionarios or /funcionarios.json
  # Cria um novo funcionário com os parâmetros fornecidos
  def create
    @funcionario = Funcionario.new(funcionario_params)

    respond_to do |format|
      if @funcionario.save
        format.html { redirect_to funcionario_url(@funcionario), notice: "Funcionário foi criado com sucesso." }
        format.json { render :show, status: :created, location: @funcionario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funcionarios/1 or /funcionarios/1.json
  # Atualiza um funcionário existente com os parâmetros fornecidos
  def update
    respond_to do |format|
      if @funcionario.update(funcionario_params)
        format.html { redirect_to funcionario_url(@funcionario), notice: "Funcionário foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @funcionario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcionarios/1 or /funcionarios/1.json
  # Remove um funcionário específico do banco de dados
  def destroy
    @funcionario.destroy!

    respond_to do |format|
      format.html { redirect_to funcionarios_url, notice: "Funcionário foi destruído com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Usa callbacks para compartilhar configurações ou restrições comuns entre as ações.
    def set_funcionario
      @funcionario = Funcionario.find(params[:id])
    end

    # Permite apenas uma lista de parâmetros confiáveis.
    def funcionario_params
      params.require(:funcionario).permit(:nome, :contato, :cargo, :login, :senha)
    end
end
