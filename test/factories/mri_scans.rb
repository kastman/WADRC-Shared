# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :mri_scan do |f|
  f.association :appointment
  f.sequence(:exam_number) {|n| n}
  # f.study_initials "MyString"
  f.sequence(:study_rmr) {|n| "RMRabc#{n}"}
  f.radiology_outcome "Nm"
  # f.notes "MyText"
  # f.dicom_dvd "MyString"
  # f.researcher 1
  # f.study_scan_tech 1
  f.association :researcher
  # f.study_path "MyString"
  # f.association :created_by
  f.sequence(:dicom_study_uid) {|n| "00-H1-#{n}"}
  f.association :study_scan_tech
  # f.study_start_time DateTime.now - 1.hour
  # f.study_end_time DateTime.now - 5.minutes
  # f.scanner_hardware_goggles 1
  # f.scanner_hardware_buttonbox 1
  # f.completed_fast false
end