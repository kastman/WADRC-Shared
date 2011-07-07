require 'spec_helper'

describe "diagnoses/index.html.erb" do
  before(:each) do
    assign(:diagnoses, [
      stub_model(Diagnosis,
        :characterization => "Characterization"
      ),
      stub_model(Diagnosis,
        :characterization => "Characterization"
      )
    ])
  end

  it "renders a list of diagnoses" do
    render
    rendered.should have_selector("tr>td", :text => "Characterization".to_s, :count => 2)
  end
end
