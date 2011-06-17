class Diagnosis < ActiveRecord::Base
  has_many :visit_diagnoses
  has_many :visits, :through => :visit_diagnoses
  
  validates_presence_of :characterization
end
