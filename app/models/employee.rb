class Employee < ActiveRecord::Base
  belongs_to :role
  has_one :user, dependent: :destroy
end
