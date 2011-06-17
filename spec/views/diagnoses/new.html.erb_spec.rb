require 'spec_helper'

describe "diagnoses/new.html.erb" do
  before(:each) do
    assign(:diagnosis, stub_model(Diagnosis,
      :characterization => "MyString"
    ).as_new_record)
  end

  it "renders new diagnosis form" do
    render

    rendered.should have_selector("form", :action => diagnoses_path, :method => "post") do |form|
      form.should have_selector("input#diagnosis_characterization", :name => "diagnosis[characterization]")
    end
  end
end
