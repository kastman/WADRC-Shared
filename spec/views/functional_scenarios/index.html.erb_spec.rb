require 'spec_helper'

describe "functional_scenarios/index.html.erb" do
  before(:each) do
    assign(:functional_scenarios, [
      Factory(:functional_scenario,
        :description => "Description",
        :intended_reps => 1,
        :scenario_file => "Scenario File"
      ),
      Factory(:functional_scenario,
        :description => "Description",
        :intended_reps => 1,
        :scenario_file => "Scenario File"
      )
    ])
  end

  it "renders a list of functional_scenarios" do
    render
    rendered.should have_selector("tr>td", :text => "Description".to_s, :count => 2)
    rendered.should have_selector("tr>td", :text => "Scenario File".to_s, :count => 2)
  end
end
