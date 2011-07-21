require 'spec_helper'

describe "series_scenarios/edit.html.erb" do
  before(:each) do
    @series_scenario = assign(:series_scenario, stub_model(SeriesScenario,
      :description => "MyString",
      :functional_set => nil,
      :intended_reps => 1,
      :scenario_file => "MyString"
    ))
  end

  it "renders the edit series_scenario form" do
    render

    rendered.should have_selector("form", :action => series_scenario_path(@series_scenario), :method => "post") do |form|
      form.should have_selector("input#series_scenario_description", :name => "series_scenario[description]")
      form.should have_selector("input#series_scenario_functional_set", :name => "series_scenario[functional_set]")
      form.should have_selector("input#series_scenario_intended_reps", :name => "series_scenario[intended_reps]")
      form.should have_selector("input#series_scenario_scenario_file", :name => "series_scenario[scenario_file]")
    end
  end
end
