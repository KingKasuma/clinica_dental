class Sucursal < ActiveRecord::Base
  has_one :employee

  #####Validaciones####
  validates :direccion, presence: true
  validates :telefono, presence: true, uniqueness: true, numericality: true
  #####Validaciones####
end
