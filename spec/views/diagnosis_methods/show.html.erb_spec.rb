require 'spec_helper'

describe "diagnosis_methods/show.html.erb" do
  before(:each) do
    @diagnosis_method = assign(:diagnosis_method, stub_model(DiagnosisMethod,
      :consensus_method => "Consensus Method"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Consensus Method/)
  end
end
