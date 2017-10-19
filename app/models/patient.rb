class Patient < ActiveRecord::Base
  has_one :user ,dependent: :destroy
  belongs_to :role
  has_one :medical_history, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :account_books, dependent: :destroy

  ###################Validaciones################
  validates :nombres, presence: true
  validates :apellido_paterno, presence: true
  validates :apellido_materno, presence: true
  validates :edad, presence: true
  validates :ocupacion, presence: true
  validates :procedencia, presence: true
  validates :direccion, presence: true
  validates :tiempo_disponible, presence: true
  validates :telefono, presence: true
  validates :email, presence: true
  validates :CI, presence: true, uniqueness: true, length: {minimum: 6}
  ###################Validaciones################

  def full_name
    "#{nombres} #{apellido_paterno} #{apellido_materno}"
  end

  def tratamientos_costo
    suma_tratamientos = 0
    tratamientos_costos = self.medical_history.treatments.where.not(costo:nil)
    tratamientos_costos.each do |treatment|
      suma_tratamientos = treatment.costo + suma_tratamientos
    end
    return suma_tratamientos
  end

  def protesis_costo
    suma_protesis = 0
    protesis_costos = self.medical_history.prosthesis.where.not(costo:nil)
    protesis_costos.each do |pro|
      suma_protesis = pro.costo + suma_protesis
    end
    return suma_protesis
  end

  def total
    suma = tratamientos_costo + protesis_costo
    return suma
  end

  def accounts
    suma = 0
    self.account_books.each do |account|
      suma = account.debts.last.total + suma
    end
    return suma
  end

  def total_nuevo
    suma = 0
    total_nuevo = 0
    self.account_books.each do |account|
      suma = account.debts.last.total + suma
    end
     total_nuevo = total - suma
  end

end
