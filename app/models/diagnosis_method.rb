class DiagnosisMethod < ActiveRecord::Base
  has_many :visit_diagnoses
  has_many :visits, :through => :visit_diagnoses
  
  validates :consensus_method,
    :uniqueness => true,
    :presence => true
end
