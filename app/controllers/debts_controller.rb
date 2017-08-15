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
      if @paciente.account_books.present?
        if @paciente.account_books.last.estado.downcase == "cancelado"
            @account = @paciente.account_books.last
        end
      end

      if params[:pago].present?
        pago = params[:pago].to_i
        if @paciente.account_books == []
          total = @paciente.tratamientos_costo + @paciente.protesis_costo
          @saldo = total - pago
          if @saldo == 0
            @account = AccountBook.new(descripcion: "Ninguna", estado: "Cancelado", patient_id: @paciente.id)
            @account.save
            @debt = Debt.new(pago: pago, saldo: @saldo, total: total, account_book_id: @account.id)
            if @debt.save
              flash.now[:success] = "Pago realizado"
            end
          else
            @account = AccountBook.new(descripcion: "Ninguna", estado: "Deuda", patient_id: @paciente.id)
            @account.save
            @debt = Debt.new(pago: pago, saldo: @saldo, total: total, account_book_id: @account.id)
            if @debt.save
              flash.now[:success] = "Pago realizado"
            end
          end
        else
          total = @paciente.tratamientos_costo + @paciente.protesis_costo
          if @paciente.account_books.last.estado.downcase == "cancelado" && @paciente.accounts == total
            flash.now[:success] = "Deudas canceladas al dia"
          else
            if @paciente.account_books.last.estado.downcase == "cancelado"
              total_account = total - @paciente.accounts
              saldo = total_account - pago
              if saldo == 0
                @account = AccountBook.new(descripcion: "Ninguna", estado: "Cancelado", patient_id: @paciente.id)
                @account.save
                @debt = Debt.new(pago: pago, saldo: saldo, total: total_account, account_book_id: @account.id)
                if @debt.save
                  flash.now[:success] = "Pago realizado"
                end
              else
                @account = AccountBook.new(descripcion: "Ninguna", estado: "Deuda", patient_id: @paciente.id)
                @account.save
                @debt = Debt.new(pago: pago, saldo: saldo, total: total_account, account_book_id: @account.id)
                if @debt.save
                  flash.now[:success] = "Pago realizado"
                end
              end
            else
              @account = @paciente.account_books.last
              total = @account.debts.last.total
              saldo = @account.debts.last.saldo
              saldo = saldo - pago
              if saldo == 0
                @debt = Debt.new(pago: pago, saldo: saldo, total: total, account_book_id: @account.id)
                if @debt.save
                  @account.update(estado: "Cancelado")
                  flash.now[:success] = "Pago realizado"
                end
              else
                @debt = Debt.new(pago: pago, saldo: saldo, total: total, account_book_id: @account.id)
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
      params.require(:debt).permit(:pago, :saldo, :total, :account_book_id)
    end
end
