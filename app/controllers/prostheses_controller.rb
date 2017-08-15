class ProsthesesController < ApplicationController
  before_action :set_prosthesis, only: [:show, :edit, :update, :destroy]

  # GET /prostheses
  # GET /prostheses.json
  def index
    @prostheses = Prosthesis.where("treatment_id = ?", params[:id])
    @treatment = Treatment.find(params[:id])
  end

  # GET /prostheses/1
  # GET /prostheses/1.json
  def show
  end

  # GET /prostheses/new
  def new
    @treatment = Treatment.find(params[:id])
    @medical_history = @treatment.medical_history
    @prosthesis = Prosthesis.new
  end

  # GET /prostheses/1/edit
  def edit
  end

  # POST /prostheses
  # POST /prostheses.json
  def create
    @prosthesis = Prosthesis.new(prosthesis_params)

    respond_to do |format|
      if @prosthesis.save
        format.html { redirect_to medical_history_path(@prosthesis.medical_history), notice: 'Prostesis creado exitosamente.' }
        format.json { render :show, status: :created, location: @prosthesis }
      else
        format.html { render :new }
        format.json { render json: @prosthesis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prostheses/1
  # PATCH/PUT /prostheses/1.json
  def update
    respond_to do |format|
      if @prosthesis.update(prosthesis_params)
        format.html { redirect_to @prosthesis, notice: 'Prostesis ha sido modificado.' }
        format.json { render :show, status: :ok, location: @prosthesis }
      else
        format.html { render :edit }
        format.json { render json: @prosthesis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prostheses/1
  # DELETE /prostheses/1.json
  def destroy
    @prosthesis.destroy
    respond_to do |format|
      format.html { redirect_to prostheses_url, notice: 'Prostesis fue eliminado.' }
      format.json { head :no_content }
    end
  end

  def lista
    @prostheses = current_user.employee.prosthesis
  end

  def entregado
    @prosthesis = Prosthesis.find(params[:id])
    if @prosthesis.update(estado:"entregado")
      flash[:success] = "Protesis Entregada"
      redirect_to lista_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prosthesis
      @prosthesis = Prosthesis.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prosthesis_params
      params.require(:prosthesis).permit(:nombre, :protesis, :costo, :treatment_id, :medical_history_id, :fecha_pedido ,:fecha_entrega,:employee_id,:estado)
    end
end
