require 'spec_helper'

describe "scan_tasks/edit.html.erb" do
  before(:each) do
    @scan_task = assign(:scan_task, stub_model(ScanTask,
      :appointment => nil,
      :functional_scenario => nil,
      :scan_series => nil,
      :series_order => 1,
      :preday_order => 1,
      :pfile => "MyString",
      :has_concerns => false,
      :concerns => "MyString",
      :functional_note => "MyString"
    ))
  end

  it "renders the edit scan_task form" do
    render

    rendered.should have_selector("form", :action => scan_task_path(@scan_task), :method => "post") do |form|
      form.should have_selector("input#scan_task_appointment", :name => "scan_task[appointment]")
      form.should have_selector("input#scan_task_functional_scenario", :name => "scan_task[functional_scenario]")
      form.should have_selector("input#scan_task_scan_series", :name => "scan_task[scan_series]")
      form.should have_selector("input#scan_task_series_order", :name => "scan_task[series_order]")
      form.should have_selector("input#scan_task_preday_order", :name => "scan_task[preday_order]")
      form.should have_selector("input#scan_task_pfile", :name => "scan_task[pfile]")
      form.should have_selector("input#scan_task_has_concerns", :name => "scan_task[has_concerns]")
      form.should have_selector("input#scan_task_concerns", :name => "scan_task[concerns]")
      form.should have_selector("input#scan_task_functional_note", :name => "scan_task[functional_note]")
    end
  end
end
