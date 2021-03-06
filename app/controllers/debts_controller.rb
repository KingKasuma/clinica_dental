class DebtsController < ApplicationController
  before_action :set_debt, only: [:show, :edit, :update, :destroy]

  # GET /debts
  # GET /debts.json
  def patient
    @paciente = current_user.patient
    @account = @paciente.account_books.last
  end

  def index

    if params[:CI].present?
      @paciente = Patient.find_by(CI: params[:CI])
      if @paciente.nil?
        flash.now[:danger] = "Paciente no encontrado"
      else

      if @paciente.account_books.present?
        total_nuevo = @paciente.tratamientos_costo + @paciente.protesis_costo
        total = 0
        @paciente.account_books.each do |libro|
          total = total + libro.debts.last.total
        end
        @total_nuevo = total_nuevo - total
        if @paciente.account_books.last.estado.downcase == "cancelado"
          @account = @paciente.account_books.last
          if @total_nuevo > 0
            flash.now[:danger] = "Nuevas deudas."
          else
            @account = @paciente.account_books.last
            flash.now[:success] = "Deudas canceladas al dia"
          end

        else
          @account = @paciente.account_books.last
          flash.now[:danger] = "Deudas pendientes"
        end
      end

      if params[:pago].present?
        pago = params[:pago].to_i
        if @paciente.account_books == []
          total = @paciente.tratamientos_costo + @paciente.protesis_costo
          if pago > total
            flash.now[:danger] = "El pago debe de ser menor que el total de la deuda"
          else
              @saldo = total - pago
              if @saldo == 0
                @account = AccountBook.new(descripcion: "Ninguna", estado: "Cancelado", patient_id: @paciente.id, sucursal_id: current_user.employee.sucursal.id)
                @account.save
                @debt = Debt.new(pago: pago, saldo: @saldo, total: total, account_book_id: @account.id, fecha: Date.today)
                if @debt.save
                  flash.now[:success] = "Pago realizado"
                end
              else
                @account = AccountBook.new(descripcion: "Ninguna", estado: "Deuda", patient_id: @paciente.id,sucursal_id: current_user.employee.sucursal.id)
                @account.save
                @debt = Debt.new(pago: pago, saldo: @saldo, total: total, account_book_id: @account.id, fecha: Date.today)
                if @debt.save
                  flash.now[:success] = "Pago realizado"
                end
              end
          end



        else
          total = @paciente.tratamientos_costo + @paciente.protesis_costo
          if @paciente.account_books.last.estado.downcase == "cancelado" && @paciente.accounts == total
            flash.now[:success] = "Deudas canceladas al dia"
          else
            if @paciente.account_books.last.estado.downcase == "cancelado"
              total_account = total - @paciente.accounts
              if pago > total_account
                flash.now[:danger] = "Pago debe de ser menor al total de la deuda."
              else
                saldo = total_account - pago
                if saldo == 0
                  @account = AccountBook.new(descripcion: "Ninguna", estado: "Cancelado", patient_id: @paciente.id, sucursal_id: current_user.employee.sucursal.id)
                  @account.save
                  @debt = Debt.new(pago: pago, saldo: saldo, total: total_account, account_book_id: @account.id, fecha: Date.today)
                  if @debt.save
                    flash.now[:success] = "Pago realizado"
                  end
                else
                  @account = AccountBook.new(descripcion: "Ninguna", estado: "Deuda", patient_id: @paciente.id, sucursal_id: current_user.employee.sucursal.id)
                  @account.save
                  @debt = Debt.new(pago: pago, saldo: saldo, total: total_account, account_book_id: @account.id, fecha: Date.today)
                  if @debt.save
                    flash.now[:success] = "Pago realizado"
                  end
                end
              end

            else
              @account = @paciente.account_books.last
              total = @account.debts.last.total
              saldo = @account.debts.last.saldo
              if pago > saldo
                flash.now[:danger] = "Pago debe ser menor al total de la deuda."
              else
                saldo = saldo - pago
                if saldo == 0
                  @debt = Debt.new(pago: pago, saldo: saldo, total: total, account_book_id: @account.id, fecha: Date.today)
                  if @debt.save
                    @account.update(estado: "Cancelado")
                    flash.now[:success] = "Pago realizado"
                  end
                else
                  @debt = Debt.new(pago: pago, saldo: saldo, total: total, account_book_id: @account.id, fecha: Date.today)
                  if @debt.save
                    flash.now[:success] = "Pago realizado"
                  end
                end
              end

            end
          end
        end
      end
      end
    end

  respond_to do |format|
    format.html
    format.json
    format.pdf { render template: 'debts/pagos', pdf: 'Pagos', layout: 'pdf.html'}
  end

  end

  # GET /debts/1
  # GET /debts/1.json
  def show
  end

  # GET /debts/new
  def new
    @debt = Debt.new
  end

  # GET /debts/1/edit
  def edit
  end

  # POST /debts
  # POST /debts.json
  def create
    @debt = Debt.new(debt_params)

    respond_to do |format|
      if @debt.save
        format.html { redirect_to @debt, notice: 'Debt was successfully created.' }
        format.json { render :show, status: :created, location: @debt }
      else
        format.html { render :new }
        format.json { render json: @debt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /debts/1
  # PATCH/PUT /debts/1.json
  def update
    respond_to do |format|
      if @debt.update(debt_params)
        format.html { redirect_to @debt, notice: 'Debt was successfully updated.' }
        format.json { render :show, status: :ok, location: @debt }
      else
        format.html { render :edit }
        format.json { render json: @debt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /debts/1
  # DELETE /debts/1.json
  def destroy
    @debt.destroy
    respond_to do |format|
      format.html { redirect_to debts_url, notice: 'Debt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debt
      @debt = Debt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def debt_params
      params.require(:debt).permit(:pago, :saldo, :total, :account_book_id, :fecha)
    end
end
