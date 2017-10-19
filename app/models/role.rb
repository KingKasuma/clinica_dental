class Role < ActiveRecord::Base
  has_one :employee, dependent: :destroy
  has_one :patient, dependent: :destroy

  #############Validaciones############
  validates :nombre, presence: true
  validates :descripcion, presence: true
  #############Validaciones############
end
