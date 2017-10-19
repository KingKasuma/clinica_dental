class DentalExaminationsController < ApplicationController
  before_action :set_dental_examination, only: [:show, :edit, :update, :destroy]

  # GET /dental_examinations
  # GET /dental_examinations.json
  def index
    @dental_examinations = DentalExamination.all
  end

  # GET /dental_examinations/1
  # GET /dental_examinations/1.json
  def show
  end

  # GET /dental_examinations/new
  def new
    @dental_examination = DentalExamination.new
  end

  # GET /dental_examinations/1/edit
  def edit
  end

  # POST /dental_examinations
  # POST /dental_examinations.json
  def create
    @dental_examination = DentalExamination.new(dental_examination_params)

    respond_to do |format|
      if @dental_examination.save
        format.html { redirect_to @dental_examination, notice: 'Dental examination was successfully created.' }
        format.json { render :show, status: :created, location: @dental_examination }
      else
        format.html { render :new }
        format.json { render json: @dental_examination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dental_examinations/1
  # PATCH/PUT /dental_examinations/1.json
  def update
    respond_to do |format|
      if @dental_examination.update(dental_examination_params)
        format.html { redirect_to @dental_examination, notice: 'Dental examination was successfully updated.' }
        format.json { render :show, status: :ok, location: @dental_examination }
      else
        format.html { render :edit }
        format.json { render json: @dental_examination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dental_examinations/1
  # DELETE /dental_examinations/1.json
  def destroy
    @dental_examination.destroy
    respond_to do |format|
      format.html { redirect_to dental_examinations_url, notice: 'Dental examination was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dental_examination
      @dental_examination = DentalExamination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dental_examination_params
      params.require(:dental_examination).permit(:posicion, :numero_diente)
    end
end
