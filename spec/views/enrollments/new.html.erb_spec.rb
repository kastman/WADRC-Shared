require 'spec_helper'

describe "enrollments/new.html.erb" do
  before(:each) do
    assign(:enrollment, stub_model(Enrollment,
      :participant => nil,
      :enumber => "MyString",
      :recruitment_source => "MyString",
      :withdrawl_reason => "MyText"
    ).as_new_record)
  end

  it "renders new enrollment form" do
    render

    rendered.should have_selector("form", :action => enrollments_path, :method => "post") do |form|
      form.should have_selector("select#enrollment_participant_id", :name => "enrollment[participant_id]")
      form.should have_selector("input#enrollment_enumber", :name => "enrollment[enumber]")
      form.should have_selector("input#enrollment_recruitment_source", :name => "enrollment[recruitment_source]")
      form.should have_selector("textarea#enrollment_withdrawl_reason", :name => "enrollment[withdrawl_reason]")
    end
  end
end
