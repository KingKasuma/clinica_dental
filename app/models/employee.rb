class Employee < ActiveRecord::Base
  belongs_to :role
  belongs_to :sucursal
  has_one :user, dependent: :destroy
  has_many :treatments, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :prosthesis, dependent: :destroy

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
