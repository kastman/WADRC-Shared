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
    rendered.should have_content(nil.to_s)
    rendered.should have_content(1.to_s)
    rendered.should have_content("Study Initials".to_s)
    rendered.should have_content("Study Rmr".to_s)
    rendered.should have_content("Radiology Outcome".to_s)
    rendered.should have_content("MyText".to_s)
    rendered.should have_content("Dicom Dvd".to_s)
    rendered.should have_content(nil.to_s)
    rendered.should have_content("Study Path".to_s)
    rendered.should have_content(nil.to_s)
    rendered.should have_content("Dicom Study Uid".to_s)
    rendered.should have_content(nil.to_s)
    rendered.should have_content(nil.to_s)
    rendered.should have_content(nil.to_s)
    rendered.should have_content(false.to_s)
  end
end
