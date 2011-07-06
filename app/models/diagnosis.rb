class Diagnosis < ActiveRecord::Base
  has_many :visit_diagnoses
  has_many :visits, :through => :visit_diagnoses
  
  validates :characterization,
    :uniqueness => true
end
