class Visit < ActiveRecord::Base
  has_many :enrollment_visit_memberships
  has_many :enrollments, :through => :enrollment_visit_memberships
  has_many :appointments
  has_many :visit_diagnoses
  has_many :diagnoses, :through => :visit_diagnoses
  
  # Rejection Validation: If _all_ the values are the same (i.e. empty strings), then
  # inverting the array will give a size of 1, gt than 1 if they're different.
  # This occurs when you don't want to put in a diagnosis but want to update
  # the visit.
  accepts_nested_attributes_for :visit_diagnoses, :reject_if => lambda { |a| a.invert.size == 1 }
  
  scope :without_appointments, where("id NOT IN (SELECT visit_id FROM appointments)")

  acts_as_reportable :except => [:created_at, :updated_at]
  
  # Pretty list of enumber(s)
  def enumbers
    enrollments.collect{|e| e.enumber}.join(', ')
  end
  
  # Visit date is just first appointment date
  def visit_date
    unless appointments.blank?
      appointments.sort_by(&:appointment_date).first.appointment_date
    else
      ''
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
