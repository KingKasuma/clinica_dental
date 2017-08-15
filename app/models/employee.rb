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
  validates :fecha_baja, presence: true
  validates :CI, presence: true, length: {minimum: 6}, uniqueness: true
  validates :email, presence: true
  validates :cargo, presence: true
  #########Validaciones##########



  def jefe?
    resp = false
    if self.cargo.downcase == "jefe"
      resp = true
    end

    resp
  end

  def full_name
    "#{nombre} #{apellido_paterno} #{apellido_materno}"
  end

end
