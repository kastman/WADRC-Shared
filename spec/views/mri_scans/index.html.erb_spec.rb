require 'spec_helper'

describe "mri_scans/index.html.erb" do
  before(:each) do
    assign(:mri_scans, [
      Factory(:mri_scan),
      Factory(:mri_scan)
    ])
  end

  it "renders a list of mri_scans" do
    render
    rendered.should have_selector("tr>td", :text => "RMRabc", :count => 2)
    rendered.should have_selector("tr>td", :text => "Nm", :count => 2)

    # rendered.should have_selector("tr>td", :count => 2) do |cell|
    #   cell.should contain(/RMR\d*/i)
    # end

    # rendered.should have_selector("tr>td", :content => nil.to_s, :count => 2)
    # rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    # rendered.should have_selector("tr>td", :content => "Study Rmr".to_s, :count => 2)
    # rendered.should have_selector("tr>td", :content => "Radiology Outcome".to_s, :count => 2)
    # rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
    # rendered.should have_selector("tr>td", :content => "Dicom Dvd".to_s, :count => 2)
    # rendered.should have_selector("tr>td", :content => nil.to_s, :count => 2)
    # rendered.should have_selector("tr>td", :content => "Study Path".to_s, :count => 2)
    # rendered.should have_selector("tr>td", :content => nil.to_s, :count => 2)
    # rendered.should have_selector("tr>td", :content => "Dicom Study Uid".to_s, :count => 2)
    # rendered.should have_selector("tr>td", :content => nil.to_s, :count => 2)
    # rendered.should have_selector("tr>td", :content => nil.to_s, :count => 2)
    # rendered.should have_selector("tr>td", :content => nil.to_s, :count => 2)
    # rendered.should have_selector("tr>td", :content => false.to_s, :count => 2)
  end
end
