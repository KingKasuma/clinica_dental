class Prosthesis < ActiveRecord::Base
  belongs_to :treatment
  belongs_to :medical_history
end
