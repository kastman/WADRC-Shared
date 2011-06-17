class Appointment < ActiveRecord::Base
  belongs_to :visit
  belongs_to :researcher
  
  validates_presence_of :visit, :researcher, :appointment_date
  
  delegate :initials, :to => :researcher, :prefix => true
  delegate :visit_number, :to => :visit
  delegate :enumbers, :to => :visit
  
  has_one :mri_scan
  has_many :scan_tasks
  
  acts_as_reportable :except => [:created_at, :updated_at]
end
