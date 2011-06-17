require 'spec_helper'

describe "mri_scans/new.html.erb" do
  before(:each) do
    assign(:mri_scan, stub_model(MriScan,
      :appointment => nil,
      :exam_number => 1,
      :study_initials => "MyString",
      :study_rmr => "MyString",
      :radiology_outcome => "MyString",
      :notes => "MyText",
      :dicom_dvd => "MyString",
      :researcher => nil,
      :study_path => "MyString",
      :created_by => nil,
      :dicom_study_uid => "MyString",
      :study_scan_tech => nil,
      :scanner_hardware_goggles => nil,
      :scanner_hardware_buttonbox => nil,
      :completed_fast => false
    ).as_new_record)
  end

  it "renders new mri_scan form" do
    render

    rendered.should have_selector("form", :action => mri_scans_path, :method => "post") do |form|
      form.should have_selector("input#mri_scan_appointment", :name => "mri_scan[appointment]")
      form.should have_selector("input#mri_scan_exam_number", :name => "mri_scan[exam_number]")
      form.should have_selector("input#mri_scan_study_initials", :name => "mri_scan[study_initials]")
      form.should have_selector("input#mri_scan_study_rmr", :name => "mri_scan[study_rmr]")
      form.should have_selector("input#mri_scan_radiology_outcome", :name => "mri_scan[radiology_outcome]")
      form.should have_selector("textarea#mri_scan_notes", :name => "mri_scan[notes]")
      form.should have_selector("input#mri_scan_dicom_dvd", :name => "mri_scan[dicom_dvd]")
      form.should have_selector("input#mri_scan_researcher", :name => "mri_scan[researcher]")
      form.should have_selector("input#mri_scan_study_path", :name => "mri_scan[study_path]")
      form.should have_selector("input#mri_scan_created_by", :name => "mri_scan[created_by]")
      form.should have_selector("input#mri_scan_dicom_study_uid", :name => "mri_scan[dicom_study_uid]")
      form.should have_selector("input#mri_scan_study_scan_tech", :name => "mri_scan[study_scan_tech]")
      form.should have_selector("input#mri_scan_scanner_hardware_goggles", :name => "mri_scan[scanner_hardware_goggles]")
      form.should have_selector("input#mri_scan_scanner_hardware_buttonbox", :name => "mri_scan[scanner_hardware_buttonbox]")
      form.should have_selector("input#mri_scan_completed_fast", :name => "mri_scan[completed_fast]")
    end
  end
end
