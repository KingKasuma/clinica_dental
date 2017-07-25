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
    if self.employee.role.nombre.downcase == rol
      resp = true
    end
    resp
  end
end
