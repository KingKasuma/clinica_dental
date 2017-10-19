class AccountBook < ActiveRecord::Base
  belongs_to :patient
  belongs_to :sucursal
  has_many :debts, dependent: :destroy
end
