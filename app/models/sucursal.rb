class Sucursal < ActiveRecord::Base
  has_one :employee
  has_many :account_books

  #####Validaciones####
  validates :direccion, presence: true
  validates :telefono, presence: true, uniqueness: true, numericality: true
  #####Validaciones####
end
