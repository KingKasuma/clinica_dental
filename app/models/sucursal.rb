class Sucursal < ActiveRecord::Base
  has_one :employee, dependent: :destroy
  has_many :account_books, dependent: :destroy

  #####Validaciones####
  validates :direccion, presence: true
  validates :telefono, presence: true, uniqueness: true, numericality: true
  #####Validaciones####
end
