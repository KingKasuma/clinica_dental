class Employee < ActiveRecord::Base
  belongs_to :role
  has_one :user, dependent: :destroy
  has_one :treatment, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :prosthesis, dependent: :destroy

  def jefe?
    resp = false
    if self.cargo.downcase == "jefe"
      resp = true
    end

    resp
  end

end
