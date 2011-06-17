require 'spec_helper'

describe "appointments/new.html.erb" do
  before(:each) do
    assign(:appointment, stub_model(Appointment,
      :visit => nil,
      :appointment_comment => "MyText",
      :researcher => nil
    ).as_new_record)
  end

  it "renders new appointment form" do
    render

    rendered.should have_selector("form", :action => appointments_path, :method => "post") do |form|
      form.should have_selector("input#appointment_visit", :name => "appointment[visit]")
      form.should have_selector("textarea#appointment_appointment_comment", :name => "appointment[appointment_comment]")
      form.should have_selector("input#appointment_researcher", :name => "appointment[researcher]")
    end
  end
end
