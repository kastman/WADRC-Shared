require 'spec_helper'

describe "series_scenarios/new.html.erb" do
  before(:each) do
    assign(:series_scenario, stub_model(SeriesScenario,
      :description => "MyString",
      :functional_set => nil,
      :intended_reps => 1,
      :scenario_file => "MyString"
    ).as_new_record)
  end

  it "renders new series_scenario form" do
    render

    rendered.should have_selector("form", :action => series_scenarios_path, :method => "post") do |form|
      form.should have_selector("input#series_scenario_description", :name => "series_scenario[description]")
      form.should have_selector("input#series_scenario_functional_set", :name => "series_scenario[functional_set]")
      form.should have_selector("input#series_scenario_intended_reps", :name => "series_scenario[intended_reps]")
      form.should have_selector("input#series_scenario_scenario_file", :name => "series_scenario[scenario_file]")
    end
  end
end
