require 'spec_helper'

describe "mri_scans/show.html.erb" do
  before(:each) do
    @mri_scan = assign(:mri_scan, stub_model(MriScan,
      :appointment => nil,
      :exam_number => 1,
      :study_initials => "Study Initials",
      :study_rmr => "Study Rmr",
      :radiology_outcome => "Radiology Outcome",
      :notes => "MyText",
      :dicom_dvd => "Dicom Dvd",
      :researcher => nil,
      :study_path => "Study Path",
      :created_by => nil,
      :dicom_study_uid => "Dicom Study Uid",
      :study_scan_tech => nil,
      :scanner_hardware_goggles => nil,
      :scanner_hardware_buttonbox => nil,
      :completed_fast => false
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(nil.to_s)
    rendered.should contain(1.to_s)
    rendered.should contain("Study Initials".to_s)
    rendered.should contain("Study Rmr".to_s)
    rendered.should contain("Radiology Outcome".to_s)
    rendered.should contain("MyText".to_s)
    rendered.should contain("Dicom Dvd".to_s)
    rendered.should contain(nil.to_s)
    rendered.should contain("Study Path".to_s)
    rendered.should contain(nil.to_s)
    rendered.should contain("Dicom Study Uid".to_s)
    rendered.should contain(nil.to_s)
    rendered.should contain(nil.to_s)
    rendered.should contain(nil.to_s)
    rendered.should contain(false.to_s)
  end
end
