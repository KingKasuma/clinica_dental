class TreatmentsController < ApplicationController
  before_action :set_treatment, only: [:show, :edit, :update, :destroy]

  # GET /treatments
  # GET /treatments.json
  def index
    @treatments = Treatment.all
  end

  # GET /treatments/1
  # GET /treatments/1.json
  def show
  end

  # GET /treatments/new
  def new
    @medical_history = MedicalHistory.find(params[:id])
    @treatment = Treatment.new
  end

  # GET /treatments/1/edit
  def edit

  end

  # POST /treatments
  # POST /treatments.json
  def create
    @treatment = Treatment.new(treatment_params)
    respond_to do |format|
      if @treatment.save
        format.html { redirect_to medical_history_path(@treatment.medical_history), notice: 'Tratamiento creado.' }
        format.json { render :show, status: :created, location: @treatment }
      else
        format.html { render :new }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treatments/1
  # PATCH/PUT /treatments/1.json
  def update
    respond_to do |format|
      if @treatment.update(treatment_params)
        format.html { redirect_to medical_history_path(@treatment.medical_history), notice: 'Tratamiento modificado.' }
        format.json { render :show, status: :ok, location: @treatment }
      else
        format.html { render :edit }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treatments/1
  # DELETE /treatments/1.json
  def destroy
    @treatment.destroy
    respond_to do |format|
      format.html { redirect_to treatments_url, notice: 'Tratamiento eliminado.' }
      format.json { head :no_content }
      redirect_to medical_history_path(@treatment.medical_history)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treatment
      @treatment = Treatment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def treatment_params
      params.require(:treatment).permit(:nombre, :tratamiento, :costo, :diagnostico_presuntivo, :diagnostico_definitivo, :rayos_x, :employee_id, :medical_history_id, :dental_examination_id, :fecha)
    end
end
