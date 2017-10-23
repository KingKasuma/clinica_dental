class MedicalHistoriesController < ApplicationController
  before_action :set_medical_history, only: [:show, :edit, :update, :destroy]

  # GET /medical_histories
  # GET /medical_histories.json
  def index
    @medical_histories = MedicalHistory.all
  end

  # GET /medical_histories/1
  # GET /medical_histories/1.json
  def show
  end

  # GET /medical_histories/new
  def new
    @patient = Patient.find(params[:id])
    @medical_history = MedicalHistory.new
  end

  # GET /medical_histories/1/edit
  def edit

  end

  # POST /medical_histories
  # POST /medical_histories.json
  def create
    @medical_history = MedicalHistory.new(medical_history_params)
    respond_to do |format|
      if @medical_history.save
        format.html { redirect_to @medical_history, notice: 'Historial Medico creado.' }
        format.json { render :show, status: :created, location: @medical_history }
      else
        format.html { redirect_to :controller => "medical_histories", :action => "new", :id => @medical_history.patient.id }
        format.json { render json: @medical_history.errors, status: :unprocessable_entity }
        flash[:danger] = "Llenar todos los campos vacios del tratamiento."
      end
    end
  end

  # PATCH/PUT /medical_histories/1
  # PATCH/PUT /medical_histories/1.json
  def update
    respond_to do |format|
      if @medical_history.update(medical_history_params)
        format.html { redirect_to @medical_history, notice: 'Historial Medico editado.' }
        format.json { render :show, status: :ok, location: @medical_history }
      else
        format.html { render :edit }
        format.json { render json: @medical_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_histories/1
  # DELETE /medical_histories/1.json
  def destroy
    @medical_history.destroy
    respond_to do |format|
      format.html { redirect_to medical_histories_url, notice: 'Historial Medico eliminado.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medical_history
      @medical_history = MedicalHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medical_history_params
      params.require(:medical_history).permit(:tratamiento_medico, :medicamentos_actuales, :enfermo_corazon, :desmayos_frecuencia, :intervenido_quirurgicamente, :complicaciones_hemorragias, :observaciones, :patient_id,
              treatments_attributes:[:id,:nombre,:tratamiento,:costo,:diagnostico_presuntivo,:diagnostico_definitivo,:rayos_x, :employee_id, :medical_history_id ,:dental_examination_id, :fecha ,:_destroy])
    end
end
