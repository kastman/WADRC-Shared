class MriScan < ActiveRecord::Base
  belongs_to :appointment
  belongs_to :researcher
  belongs_to :created_by
  belongs_to :study_scan_tech, :class_name => "Researcher"
  belongs_to :scanner_hardware_goggles, :class_name => "ScannerHardware"
  belongs_to :scanner_hardware_buttonbox, :class_name => "ScannerHardware"
  
  delegate :initials, :to => :researcher, :prefix => true
  delegate :initials, :to => :study_scan_tech, :prefix => true
  delegate :appointment_date, :to => :appointment
  
  validates :study_rmr,       :presence => true
  validates :appointment_id,  :uniqueness => true, :presence => true
  validates :exam_number,     :uniqueness => true, :allow_nil => true
  validates :dicom_study_uid, :uniqueness => true, :allow_nil => true
  validates :exam_number,     :uniqueness => true, :allow_nil => true

end
