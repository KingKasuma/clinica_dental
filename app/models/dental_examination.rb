class DentalExamination < ActiveRecord::Base
  has_many :treatments
end
