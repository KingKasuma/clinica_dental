class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        user = User.new
        user.email = @patient.email
        user.password = @patient.CI
        user.password_confirmation = @patient.CI
        user.patient_id = @patient.id
        user.username = @patient.nombres
        user.save
        format.html { redirect_to @patient, notice: 'Paciente creado correctamente.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        user = User.find(@patient.user)
        user.email = @patient.email
        user.password = @patient.CI
        user.password_confirmation = @patient.CI
        user.username = @patient.nombres
        user.save
        format.html { redirect_to @patient, notice: 'Paciente modificado.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Paciente eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:nombres, :apellido_paterno, :apellido_materno, :edad, :ocupacion, :procedencia, :direccion, :tiempo_disponible, :telefono, :email, :CI, :role_id)
    end
end
