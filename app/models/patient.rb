class Patient < ActiveRecord::Base
  has_one :user ,dependent: :destroy
  belongs_to :role
  has_one :medical_history, dependent: :destroy
  has_many :reservations, dependent: :destroy

  def full_name
    "#{nombres} #{apellido_paterno} #{apellido_materno}"
  end

end
