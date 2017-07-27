class MedicalHistory < ActiveRecord::Base
  belongs_to :patient
  has_many :treatments, dependent: :destroy
  has_many :prosthesis, dependent: :destroy
  accepts_nested_attributes_for :treatments, allow_destroy: true
  accepts_nested_attributes_for :prosthesis, allow_destroy: true
end
