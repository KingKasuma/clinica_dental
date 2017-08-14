class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    @horas = [9.00,9.30,10.00,10.30,11.00,11.30,12.00,14.30,15.00,15.30,16.00,16.30,17.00,17.30,18.00,18.30,19.00,19.30,20.00]
    @hora = Reservation.new
    @reservations = Reservation.where("patient_id = ?", current_user.patient.id).order("id DESC")

    if params[:sucursal].present?
      @sucursal = Sucursal.find(params[:sucursal])
    end

    if params[:employee_id].present?
      @doctor = Employee.find(params[:employee_id])
    end

    if params[:fecha].present?
      @fecha = params[:fecha]
      @fecha = @fecha.to_date
      if @doctor.reservations == []
        flash.now[:danger] = "Doctor nunca ha tenido ninguna reserva"
        @reserva = Reservation.new
      else
        @doctor.reservations.each do |reserva|
          if reserva.fecha.to_s == params[:fecha]
            #Doctor seleccionado con alguna reservacion con fecha
            @reservas = @doctor.reservations.where("fecha = ?", @fecha)
          end
        end
      end
    end
  end


  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new

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
        format.html { redirect_to reservations_path, notice: 'Reservation was successfully created.' }
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
      format.html { redirect_to reservations_url, notice: 'Reservacion anterior eliminada, porfavor elija una nueva fecha.' }
      format.json { head :no_content }
    end
  end

  def diary

    @horas = [9.00,9.30,10.00,10.30,11.00,11.30,12.00,14.30,15.00,15.30,16.00,16.30,17.00,17.30,18.00,18.30,19.00,19.30,20.00]
    @hora = Reservation.new
    @reservations = Reservation.where("employee_id = ?", current_user.employee.id).order("id DESC")

    #Buscador de nombre y apellido
    @patients = Patient.order("nombres DESC")
    if params[:nombres].present?
      @patient = @patients.where("nombres LIKE ?", "%#{params[:nombres]}%")
      unless @patient.present?
          flash.now[:danger] = "No existe paciente con ese nombre"
      end
      bandera_nombre = 1
    end
    if params[:apellido_paterno].present?
      @patient = @patients.where("apellido_paterno LIKE ?","%#{params[:apellido_paterno]}%")
      unless @patient.present?
          flash.now[:danger] = "No existe paciente ese apellido"
      end
      bandera_apellido = 1
    end
    if params[:nombres].present? and params[:apellido_paterno].present?
        flash.now[:success] = "Existe el paciente."
        @bandera= bandera_nombre + bandera_apellido
    end
    #Buscador de nombre y apellido

    #Buscador de fecha
    if params[:fecha].present?
      @fecha = params[:fecha]
      @fecha = @fecha.to_date
      if @doctor.reservations == []
        flash.now[:danger] = "Doctor nunca ha tenido ninguna reserva"
        @reserva = Reservation.new
      else
        @doctor.reservations.each do |reserva|
          if reserva.fecha.to_s == params[:fecha]
            #Doctor seleccionado con alguna reservacion con fecha
            @reservas = @doctor.reservations.where("fecha = ?", @fecha)
          end
        end
      end
    end

    if params[:fecha].present?
      @fecha = params[:fecha]
      @fecha = @fecha.to_date
    if current_user.reservations == []
      flash.now[:danger] = "Doctor nunca ha tenido reservas"
    else

    end
    end
    #Buscador de fecha
  end

  def diary_secretary
    @horas = [9.00,9.30,10.00,10.30,11.00,11.30,12.00,14.30,15.00,15.30,16.00,16.30,17.00,17.30,18.00,18.30,19.00,19.30,20.00]
    @hora = Reservation.new

    if params[:CI].present?
      @paciente = Patient.find_by(CI: params[:CI])
      @reservations = Reservation.where("patient_id = ?", @paciente.id).order("id DESC")
    end

    if params[:sucursal].present?
      @sucursal = Sucursal.find(params[:sucursal])
    end

    if params[:employee_id].present?
      @doctor = Employee.find(params[:employee_id])
      @reservations = @reservations.where("employee_id = ?", @doctor.id).order("id DESC")
    end

    if params[:fecha].present?
      @fecha = params[:fecha]
      @fecha = @fecha.to_date
      if @doctor.reservations == []
        flash.now[:danger] = "Doctor nunca ha tenido ninguna reserva"
        @reserva = Reservation.new
      else
        @doctor.reservations.each do |reserva|
          if reserva.fecha.to_s == params[:fecha]
            #Doctor seleccionado con alguna reservacion con fecha
            @reservas = @doctor.reservations.where("fecha = ?", @fecha)
          end
        end
      end
    end
  end

  def reservacion
    employee = Employee.find(params[:employee_id])
    fecha = params[:fecha]
    hora = params[:hora]
    entero = hora.to_i
    decimal = ((hora.to_f % entero)*100).to_i
    hora = entero.to_s + ":" + decimal.to_s
    @reservation = Reservation.new(employee_id: employee.id, patient_id: current_user.patient.id, fecha: fecha, hora: hora, estado: "Reservado")
    @duple = Reservation.where(employee_id:employee.id, fecha: fecha, hora: hora)
    if (@duple.present?)
      flash[:danger] = "Fecha ya reservada, porfavor seleccione otra fecha"
      redirect_to reservations_path
    else
      if @reservation.save
        redirect_to reservations_path
        flash[:success] = "Reserva registrada exitosamente"
      end
    end
  end

  def reservacion_secretaria
    patient = patient.find(params[:patient_id])
    employee = Employee.find(params[:employee_id])
    fecha = params[:fecha]
    hora = params[:hora]
    entero = hora.to_i
    decimal = ((hora.to_f % entero)*100).to_i
    hora = entero.to_s + ":" + decimal.to_s
    @reservation = Reservation.new(employee_id: employee.id, patient_id: patient.id, fecha: fecha, hora: hora, estado: "Reservado")
    @duple = Reservation.where(employee_id: employee.id, fecha: fecha, hora:hora)
    if (@duple.present?)
      flash.now[:danger] = "Fecha ya reservada, porqfavor seleccione otra fecha"
      redirect_to diary_secretary_path
    else
      if @reservation.save
        redirect_to diary_secretary_path
        flash.now[:success] = "Reserva registrada exitosamente"
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:employee_id, :patient_id,:fecha,:hora ,:estado)
    end
end
