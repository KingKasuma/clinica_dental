class Prosthesis < ActiveRecord::Base
  belongs_to :treatment
  belongs_to :medical_history
  belongs_to :employee
end
