class Patient < ActiveRecord::Base
  has_one :user
end
