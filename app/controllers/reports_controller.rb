class ReportsController < ApplicationController
  def index
#################Ingresos por sucursal###################

  if params[:sucursal].present?
    @ingreso_total = 0
    @pagos = 0
    @sucursal = Sucursal.find(params[:sucursal])
    @sucursal.account_books.each do |account|
      account.debts.each do |debt|
       @pagos = @pagos + debt.pago
      end
    end

  end

  if params[:fecha_inicio] && params[:fecha_fin]
    fecha_fin = params[:fecha_fin]
    fecha_inicio = params[:fecha_inicio]
    @accounts = Debt.where('created_at BETWEEN ? AND ?',fecha_inicio,fecha_fin)
  else
    fecha_fin = params[:fecha_fin]
    fecha_inicio = params[:fecha_inicio]
    if params[:fecha_inicio].present?
      @accounts = Debt.where('created_at = ?',fecha_inicio)
    end
    if params[:fecha_fin].present?
      @accounts = Debt.where('created_at = ?',fecha_fin)
    end
  end

#################Ingresos por sucursal###################


#################Tratamientos por paciente################
  if params[:CI].present?
    @paciente = Patient.find_by(CI: params[:CI])
    @medical_history = @paciente.medical_history
  end
#################Tratamientos por paciente################


################Historiales Clinicos######################
    if params[:fecha_inicio] && params[:fecha_fin]
      fecha_fin = params[:fecha_fin]
      fecha_inicio = params[:fecha_inicio]
      @accounts = Debt.where('created_at BETWEEN ? AND ?',fecha_inicio,fecha_fin)
    else
      fecha_fin = params[:fecha_fin]
      fecha_inicio = params[:fecha_inicio]
      if params[:fecha_inicio].present?
        @accounts = Debt.where('created_at = ?',fecha_inicio)
      end
      if params[:fecha_fin].present?
        @accounts = Debt.where('created_at = ?',fecha_fin)
      end
    end
################Historiales Clinicos######################

###############Deudas########################
@pacientes = Patient.all
###############Deudas########################

  end
end
