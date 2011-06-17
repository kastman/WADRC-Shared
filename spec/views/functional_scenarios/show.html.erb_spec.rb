require 'spec_helper'

describe "functional_scenarios/show.html.erb" do
  before(:each) do
    @functional_scenario = assign(:functional_scenario, Factory(:functional_scenario,
      :description => "Description",
      :intended_reps => 1,
      :scenario_file => "Scenario File"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Description".to_s)
    rendered.should contain(nil.to_s)
    rendered.should contain(1.to_s)
    rendered.should contain("Scenario File".to_s)
  end
end
