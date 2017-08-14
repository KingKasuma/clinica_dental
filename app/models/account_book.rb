class AccountBook < ActiveRecord::Base
  belongs_to :patient
  has_many :debts, dependent: :destroy
end
