class Treatment < ActiveRecord::Base
  belongs_to :employee
  belongs_to :medical_history
  belongs_to :dental_examination
  has_many :prosthesis
end
