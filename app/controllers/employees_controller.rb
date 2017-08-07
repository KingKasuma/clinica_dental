class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        user = User.new
        user.email = @employee.email
        user.password = @employee.CI
        user.password_confirmation = @employee.CI
        user.employee_id = @employee.id
        user.username = @employee.nombre
        user.save
        format.html { redirect_to @employee, notice: 'Empleado creado exitosamente.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        user = User.find(@employee.user)
        user.email = @employee.email
        user.password = @employee.CI
        user.password_confirmation = @employee.CI
        user.username = @employee.nombre
        user.save
        format.html { redirect_to @employee, notice: 'Empleado modificado.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Empleado fue borrado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:nombre, :apellido_paterno, :apellido_materno, :fecha_nacimiento, :genero, :nacionalidad, :profesion, :especialidad, :fecha_alta, :fecha_baja, :CI, :email, :sucursal_id, :role_id, :cargo)
    end
end
