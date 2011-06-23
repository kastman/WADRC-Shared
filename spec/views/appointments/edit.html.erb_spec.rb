require 'spec_helper'

describe "appointments/edit.html.erb" do
  before(:each) do
    @appointment = assign(:appointment, stub_model(Appointment,
      :visit => nil,
      :appointment_comment => "MyText",
      :researcher => nil
    ))
  end

  it "renders the edit appointment form" do
    render

    rendered.should have_selector("form", :action => appointment_path(@appointment), :method => "post") do |form|
      form.should have_selector("select#appointment_visit_id", :name => "appointment[visit_id]")
      form.should have_selector("textarea#appointment_appointment_comment", :name => "appointment[appointment_comment]")
      form.should have_selector("select#appointment_researcher_id", :name => "appointment[researcher_id]")
    end
  end
end
