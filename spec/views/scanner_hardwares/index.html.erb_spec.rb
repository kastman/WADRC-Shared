require 'spec_helper'

describe "scanner_hardwares/index.html.erb" do
  before(:each) do
    assign(:scanner_hardwares, [
      stub_model(ScannerHardware,
        :name => "Name",
        :hardware_group => "Hardware Group"
      ),
      stub_model(ScannerHardware,
        :name => "Name",
        :hardware_group => "Hardware Group"
      )
    ])
  end

  it "renders a list of scanner_hardwares" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Hardware Group".to_s, :count => 2)
  end
end
