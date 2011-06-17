require 'spec_helper'

describe "scanner_hardwares/edit.html.erb" do
  before(:each) do
    @scanner_hardware = assign(:scanner_hardware, stub_model(ScannerHardware,
      :name => "MyString",
      :hardware_group => "MyString"
    ))
  end

  it "renders the edit scanner_hardware form" do
    render

    rendered.should have_selector("form", :action => scanner_hardware_path(@scanner_hardware), :method => "post") do |form|
      form.should have_selector("input#scanner_hardware_name", :name => "scanner_hardware[name]")
      form.should have_selector("input#scanner_hardware_hardware_group", :name => "scanner_hardware[hardware_group]")
    end
  end
end
