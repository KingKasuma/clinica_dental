class Patient < ActiveRecord::Base
  has_one :user ,dependent: :destroy
  belongs_to :role
end
