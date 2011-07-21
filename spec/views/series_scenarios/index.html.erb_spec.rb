require 'spec_helper'

describe "series_scenarios/index.html.erb" do
  before(:each) do
    assign(:series_scenarios, [
      Factory(:series_scenario,
        :description => "Description",
        :intended_reps => 1,
        :scenario_file => "Scenario File"
      ),
      Factory(:series_scenario,
        :description => "Description",
        :intended_reps => 1,
        :scenario_file => "Scenario File"
      )
    ])
  end

  it "renders a list of series_scenarios" do
    render
    rendered.should have_selector("tr>td", :text => "Description".to_s, :count => 2)
    rendered.should have_selector("tr>td", :text => "Scenario File".to_s, :count => 2)
  end
end
