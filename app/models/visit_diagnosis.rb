class VisitDiagnosis < ActiveRecord::Base
  belongs_to :diagnosis
  belongs_to :visit
  belongs_to :diagnosis_method
  belongs_to :diagnoser, :class_name => "Researcher"
  
  validates_presence_of :diagnosis, :visit, :diagnosis_method, :diagnoser, :diagnosis_date
  
  delegate :characterization, :to => :diagnosis
  delegate :consensus_method, :to => :diagnosis_method
end
