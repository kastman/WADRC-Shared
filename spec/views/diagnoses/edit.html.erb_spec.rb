require 'spec_helper'

describe "diagnoses/edit.html.erb" do
  before(:each) do
    @diagnosis = assign(:diagnosis, stub_model(Diagnosis,
      :characterization => "MyString"
    ))
  end

  it "renders the edit diagnosis form" do
    render

    rendered.should have_selector("form", :action => diagnosis_path(@diagnosis), :method => "post") do |form|
      form.should have_selector("input#diagnosis_characterization", :name => "diagnosis[characterization]")
    end
  end
end
