class Treatment < ActiveRecord::Base
  belongs_to :employee
  belongs_to :medical_history
  belongs_to :dental_examination
  has_many :prosthesis, dependent: :destroy

  #######Validaciones#######
  validates :nombre, presence: true
  validates :tratamiento, presence: true
  validates :diagnostico_presuntivo, presence: true
  validates :diagnostico_definitivo, presence: true  
  #######Validaciones#######
end
