class Prosthesis < ActiveRecord::Base
  belongs_to :treatment
  belongs_to :medical_history
  belongs_to :employee


  ###############Validaciones##################
  validates :nombre, presence: true
  validates :protesis, presence: true  
  validates :fecha_pedido, presence: true
  validates :fecha_entrega, presence: true
  ###############Validaciones##################
end
