class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    @horas = [9.00,9.30,10.00,10.30,11.00,11.30,12.00,14.30,15.00,15.30,16.00,16.30,17.00,17.30,18.00,18.30,19.00,19.30,20.00]
    @hora = Reservation.new

    if params[:nombres].present?
      @patients = @patients.where("nombres LIKE ?", "%#{params[:nombres]}%")
    end

    if params[:employee_id].present?
      @doctor = Employee.find(params[:employee_id])
    end

    if params[:fecha].present?
      @fecha = params[:fecha]
      @fecha = @fecha.to_date      
      if @doctor.reservations == []
        flash.now[:danger] = "Empleado no tiene ninguna reserva para esta fecha"
        @reserva = "Reservar"
      else
        @doctor.reservations.each do |reserva|
          if reserva.fecha.to_s == params[:fecha]
            #Doctor seleccionado con alguna reservacion con fecha
            @reservas = @doctor.reservations.where("fecha LIKE ?", @fecha)
          else
            @reserva = "Reservar"
          end
        end
      end
    end
=begin
  @reserva = Reservation.all
      if @reserva.nil?
        @palabra = "Reservar"
      else
        @reserva.each do |reserva|
            if reserva.fecha.to_s == "%#{params[:fecha]}%"
              flash[:success] = "Existe fecha"
              @horas.each do |hora|
                entero = hora.to_i
                decimal = ((hora%entero)*100).to_i
                if reserva.hora.hour == entero && reserva.hora.min == decimal
                  @palabra = "Reservado"
                else
                  @palabra = "Reservar"
                end
              end
            end
        end
      end
=end
    end


  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @employee = Employee.find(params[:employee_id])
    @fecha = params[:fecha]
    texto = params[:hora]
    entero = texto.to_i
    decimal = ((texto%entero)*100).to_i
    @hora = (entero.to_s)+":"+(decimal.to_s)
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def diary
    @employee = Employee.find(params[:id])
    @reservaciones = @employee.reservations
    #@horas = [[9,00],[9,30],[10,00],[10,30],[11,00],[11,30],[12,00],[14,30],[15,00],[15,30],[16,00],[16,30],[17,00],[17,30],[18,00],[18,30],[19,00],[19,30],[20,00]]
    if params[:fecha].present?
      @reservas = @employee.reservations.where("estado LIKE ?", "%#{params[:fecha]}%")
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:employee_id, :patient_id, :estado)
    end
end
