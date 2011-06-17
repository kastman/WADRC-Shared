require 'spec_helper'

describe "diagnosis_methods/index.html.erb" do
  before(:each) do
    assign(:diagnosis_methods, [
      stub_model(DiagnosisMethod,
        :consensus_method => "Consensus Method"
      ),
      stub_model(DiagnosisMethod,
        :consensus_method => "Consensus Method"
      )
    ])
  end

  it "renders a list of diagnosis_methods" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Consensus Method".to_s, :count => 2
  end
end
