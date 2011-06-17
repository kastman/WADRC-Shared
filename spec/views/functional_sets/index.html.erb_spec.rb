require 'spec_helper'

describe "functional_sets/index.html.erb" do
  before(:each) do
    assign(:functional_sets, [
      stub_model(FunctionalSet,
        :setname => "Setname"
      ),
      stub_model(FunctionalSet,
        :setname => "Setname"
      )
    ])
  end

  it "renders a list of functional_sets" do
    render
    rendered.should have_selector("tr>td", :content => "Setname".to_s, :count => 2)
  end
end
