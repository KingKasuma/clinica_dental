class Employee < ActiveRecord::Base
  belongs_to :role
  has_one :user, dependent: :destroy
  has_one :treatment, dependent: :destroy
  has_many :reservations
end
