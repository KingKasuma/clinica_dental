class Employee < ActiveRecord::Base
  belongs_to :role
  belongs_to :sucursal
  has_one :user, dependent: :destroy
  has_many :treatments, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :prosthesis, dependent: :destroy

  #########Validaciones##########
  validates :nombre, presence: true
  validates :apellido_paterno, presence: true
  validates :apellido_materno, presence: true
  validates :fecha_nacimiento, presence: true
  validates :genero, presence: true
  validates :nacionalidad, presence: true
  validates :profesion, presence: true
  validates :especialidad, presence: true
  validates :fecha_alta, presence: true
  validates :CI, presence: true, length: {minimum: 6}, uniqueness: true
  validates :email, presence: true
  #########Validaciones##########



  def jefe?
    resp = false
    if self.cargo.downcase == "jefe"
      resp = true
    end

    resp
  end

  def protesista?
    resp = false
    if self.role.nombre.downcase == "protesista"
      resp = true
    end
    resp
  end

  def normal?
    resp = false
    if self.cargo.downcase == "normal"
      resp = true
    end
    resp
  end

  def secretaria?
    resp = false
    if self.role.nombre.downcase == "secretaria"
      resp = true
    end
    resp
  end

  def full_name
    "#{nombre} #{apellido_paterno} #{apellido_materno}"
  end

  def reservaciones_empleado
    cont = 0
    self.reservations.each do |reservation|
       if reservation.tipo.downcase == "especial"
         cont = cont + 1
       end
    end
    return cont
  end

  def reservaciones_empleado_sin_atender
    cont = 0
    reservas_especiales = self.reservations.where(tipo:"Especial")
    reservas_especiales.each do |especial|
      if especial.estado.downcase == "reservado"
        cont = cont + 1
      end
    end
    return cont
  end

end
