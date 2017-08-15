class Role < ActiveRecord::Base
  has_one :employee
  has_one :patient

  #############Validaciones############
  validates :nombre, presence: true
  validates :descripcion, presence: true
  #############Validaciones############
end
