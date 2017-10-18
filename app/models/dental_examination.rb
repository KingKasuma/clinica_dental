class DentalExamination < ActiveRecord::Base
  has_many :treatments, dependent: :destroy

  def posicion?
    if self.posicion.downcase == "superior derecha"
      pos = "SD"
    end
    if self.posicion.downcase == "superior izquierda"
      pos = "SI"
    end
    if self.posicion.downcase == "inferior derecha"
      pos = "ID"
    end
    if self.posicion.downcase == "inferior izquierda"
      pos = "II"
    end

    return pos
  end
end
