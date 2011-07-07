require 'spec_helper'

describe "scanner_hardwares/show.html.erb" do
  before(:each) do
    @scanner_hardware = assign(:scanner_hardware, stub_model(ScannerHardware,
      :name => "Name",
      :hardware_group => "Hardware Group"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should have_content("Name".to_s)
    rendered.should have_content("Hardware Group".to_s)
  end
end
