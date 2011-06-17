require "spec_helper"

describe FunctionalScenariosController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/functional_scenarios" }.should route_to(:controller => "functional_scenarios", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/functional_scenarios/new" }.should route_to(:controller => "functional_scenarios", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/functional_scenarios/1" }.should route_to(:controller => "functional_scenarios", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/functional_scenarios/1/edit" }.should route_to(:controller => "functional_scenarios", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/functional_scenarios" }.should route_to(:controller => "functional_scenarios", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/functional_scenarios/1" }.should route_to(:controller => "functional_scenarios", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/functional_scenarios/1" }.should route_to(:controller => "functional_scenarios", :action => "destroy", :id => "1")
    end

  end
end
