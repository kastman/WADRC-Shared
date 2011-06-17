require 'spec_helper'

describe "diagnosis_methods/edit.html.erb" do
  before(:each) do
    @diagnosis_method = assign(:diagnosis_method, stub_model(DiagnosisMethod,
      :consensus_method => "MyString"
    ))
  end

  it "renders the edit diagnosis_method form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => diagnosis_methods_path(@diagnosis_method), :method => "post" do
      assert_select "input#diagnosis_method_consensus_method", :name => "diagnosis_method[consensus_method]"
    end
  end
end
