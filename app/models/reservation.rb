class Reservation < ActiveRecord::Base
  belongs_to :employee
  belongs_to :patient

  def digital(hora)
    entero = hora.to_i
    decimal = ((hora%entero)*100).to_i
    if decimal == 0
        hora_total = entero.to_s + ":" +decimal.to_s+ "0"
    else
      hora_total = entero.to_s + ":" +decimal.to_s
    end
    return hora_total
  end

  def today
    resp = false
    a = Date.today
    if self.fecha == a
      resp = true
    end
    resp
  end  

end
