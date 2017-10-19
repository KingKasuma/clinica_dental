class ReportsController < ApplicationController
  def index
#################Ingresos por sucursal###################

  if params[:sucursal].present?
    @ingreso_total = 0
    @pagos = 0
    @sucursal = Sucursal.find(params[:sucursal])
    @sucursal.account_books.each do |account|
        if params[:fecha_inicio_sucursal].present? && params[:fecha_fin_sucursal]
          @fecha_inicio_sucursal = params[:fecha_inicio_sucursal].to_date
          @fecha_fin_sucursal = params[:fecha_fin_sucursal].to_date
          account.debts.where('fecha BETWEEN ? AND ?', @fecha_inicio_sucursal, @fecha_fin_sucursal).each do |debt|
            @pagos = @pagos + debt.pago
          end
        else
          account.debts.each do |debt|
            @pagos = @pagos + debt.pago
          end
        end
      end
    end


#################Ingresos por sucursal###################


#################Tratamientos por paciente################
  if params[:CI].present?
    @paciente = Patient.find_by(CI: params[:CI])
    @medical_history = @paciente.medical_history
    @tratamientos = @medical_history.treatments
    @protesis = @medical_history.prosthesis
    if params[:fecha_inicio].present? && params[:fecha_fin].present?
      @fecha_fin = params[:fecha_fin]
      @fecha_fin = @fecha_fin.to_date
      @fecha_inicio = params[:fecha_inicio]
      @fecha_inicio = @fecha_inicio.to_date
      if @medical_history.treatments == []
        flash.now[:danger] = "Paciente no tiene ningun tratamiento"
      else
        @medical_history.treatments.each do |tratamiento|
            @tratamientos = @medical_history.treatments.where('fecha BETWEEN ? AND ?',@fecha_inicio,@fecha_fin)
        end
      end
    else
      if params[:fecha_inicio].present?
        @fecha_inicio = params[:fecha_inicio].to_date
        @tratamientos = @medical_history.treatments.where('fecha = ?',@fecha_inicio)
      end
      if params[:fecha_fin].present?
        @fecha_fin = params[:fecha_fin].to_date
        @tratamientos = @medical_history.treatments.where('fecha = ?',@fecha_fin)
      end
    end
  end
#################Tratamientos por paciente################


###############Deudas########################
@pacientes = Patient.all
###############Deudas########################

########################Pacientes al dia####################
@reservations_today = Reservation.where(fecha:Date.today).order("hora ASC")
########################Pacientes al dia####################

  end
end
