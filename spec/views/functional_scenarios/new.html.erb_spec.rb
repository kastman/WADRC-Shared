require 'spec_helper'

describe "functional_scenarios/new.html.erb" do
  before(:each) do
    assign(:functional_scenario, stub_model(FunctionalScenario,
      :description => "MyString",
      :functional_set => nil,
      :intended_reps => 1,
      :scenario_file => "MyString"
    ).as_new_record)
  end

  it "renders new functional_scenario form" do
    render

    rendered.should have_selector("form", :action => functional_scenarios_path, :method => "post") do |form|
      form.should have_selector("input#functional_scenario_description", :name => "functional_scenario[description]")
      form.should have_selector("input#functional_scenario_functional_set", :name => "functional_scenario[functional_set]")
      form.should have_selector("input#functional_scenario_intended_reps", :name => "functional_scenario[intended_reps]")
      form.should have_selector("input#functional_scenario_scenario_file", :name => "functional_scenario[scenario_file]")
    end
  end
end
