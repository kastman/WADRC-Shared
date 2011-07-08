class Visit < ActiveRecord::Base
  has_many :enrollment_visit_memberships
  has_many :enrollments, :through => :enrollment_visit_memberships
  has_many :appointments
  has_many :visit_diagnoses
  has_many :diagnoses, :through => :visit_diagnoses
  
  accepts_nested_attributes_for :visit_diagnoses, :reject_if => :all_blank
  
  scope :without_appointments, where("id NOT IN (SELECT visit_id FROM appointments)")

  acts_as_reportable :except => [:created_at, :updated_at]
  
  # TODO: ActsAsList seems to have some incompatibility with factory_girl
  # acts_as_list :scope => :enrollment, :column => :visit_number
  
  
  def participant
    enrollments.first.participant unless enrollments.empty?
  end
  
  # Pretty list of enumber(s)
  def enumbers
    enrollments.collect{|e| e.enumber}.join(', ') unless enrollments.empty?
  end
  
  # Visit date is just first appointment date
  def visit_date
    unless appointments.blank?
      appointments.sort_by(&:appointment_date).first.appointment_date
    else
      '<no date>'
    end
  end
  
  # Most recent diagnosis
  def current_diagnosis
    unless visit_diagnoses.blank?
      visit_diagnoses.sort_by(&:diagnosis_date).first.characterization
    else
      'No Dx'
    end
  end
  
end
