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
    rendered.should have_content("Description".to_s)
    rendered.should have_content(nil.to_s)
    rendered.should have_content(1.to_s)
    rendered.should have_content("Scenario File".to_s)
  end
end
