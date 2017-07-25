class Role < ActiveRecord::Base
  has_one :employee
end
