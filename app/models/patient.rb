class Patient < ActiveRecord::Base
  has_one :user ,dependent: :destroy
  belongs_to :role
  has_one :medical_history
  has_many :reservations
end
