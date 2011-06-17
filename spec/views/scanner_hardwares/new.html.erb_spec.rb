require 'spec_helper'

describe "scanner_hardwares/new.html.erb" do
  before(:each) do
    assign(:scanner_hardware, stub_model(ScannerHardware,
      :name => "MyString",
      :hardware_group => "MyString"
    ).as_new_record)
  end

  it "renders new scanner_hardware form" do
    render

    rendered.should have_selector("form", :action => scanner_hardwares_path, :method => "post") do |form|
      form.should have_selector("input#scanner_hardware_name", :name => "scanner_hardware[name]")
      form.should have_selector("input#scanner_hardware_hardware_group", :name => "scanner_hardware[hardware_group]")
    end
  end
end
