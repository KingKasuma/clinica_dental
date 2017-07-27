class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :employee
  belongs_to :patient

  def has_rol(rol)
    rol.downcase!
    resp = false
    unless self.employee.nil?
      if self.employee.role.nombre.downcase == rol
        resp = true
      end
    end
    
    unless self.patient.nil?
      if self.patient.role.nombre.downcase == rol
        resp = true
      end
    end

    resp
  end
end
