class FuncionariosController < ApplicationController
  # Antes de executar ações específicas, define o funcionário com base no ID fornecido.
  before_action :set_funcionario, only: %i[ show edit update destroy ]

  # GET /funcionarios or /funcionarios.json
  # Exibe uma lista de todos os funcionários
  def index
    @funcionarios = Funcionario.all
    render json: @funcionarios
  end

  # GET /funcionarios/1 or /funcionarios/1.json
  # Exibe os detalhes de um funcionário específico
  def show
    render json: @funcionario
  end

  # POST /funcionarios or /funcionarios.json
  # Cria um novo funcionário com os parâmetros fornecidos
  def create
    @funcionario = Funcionario.new(funcionario_params)

    if @funcionario.save
      render json: @funcionario, status: :created
    else
      render json: @funcionario.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /funcionarios/1 or /funcionarios/1.json
  # Atualiza um funcionário existente com os parâmetros fornecidos
  def update
    if @funcionario.update(funcionario_params)
      render json: @funcionario, status: :ok
    else
      render json: @funcionario.errors, status: :unprocessable_entity
    end
  end

  # DELETE /funcionarios/1 or /funcionarios/1.json
  # Remove um funcionário específico do banco de dados
  def destroy
    @funcionario.destroy!
    render json: { message: "Funcionário foi destruído com sucesso." }, status: :no_content
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
