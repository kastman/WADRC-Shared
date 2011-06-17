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

  validates_presence_of :appointment_id, :study_rmr
  validates_uniqueness_of :exam_number, :study_rmr, :dicom_study_uid

end
