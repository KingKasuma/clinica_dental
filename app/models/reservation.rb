class Reservation < ActiveRecord::Base
  belongs_to :employee
  belongs_to :patient
end
