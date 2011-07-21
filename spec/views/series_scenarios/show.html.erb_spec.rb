require 'spec_helper'

describe "series_scenarios/show.html.erb" do
  before(:each) do
    @series_scenario = assign(:series_scenario, Factory(:series_scenario,
      :description => "Description",
      :scenario_file => "Scenario File"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should have_content("Description".to_s)
    rendered.should have_content("Scenario File".to_s)
  end
end
