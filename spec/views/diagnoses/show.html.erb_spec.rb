require 'spec_helper'

describe "diagnoses/show.html.erb" do
  before(:each) do
    @diagnosis = assign(:diagnosis, stub_model(Diagnosis,
      :characterization => "Characterization"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should have_content("Characterization".to_s)
  end
end
