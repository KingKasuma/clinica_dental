class Role < ActiveRecord::Base
  has_one :employee
  has_one :patient
end
