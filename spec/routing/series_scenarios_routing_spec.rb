require "spec_helper"

describe SeriesScenariosController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/series_scenarios" }.should route_to(:controller => "series_scenarios", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/series_scenarios/new" }.should route_to(:controller => "series_scenarios", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/series_scenarios/1" }.should route_to(:controller => "series_scenarios", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/series_scenarios/1/edit" }.should route_to(:controller => "series_scenarios", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/series_scenarios" }.should route_to(:controller => "series_scenarios", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/series_scenarios/1" }.should route_to(:controller => "series_scenarios", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/series_scenarios/1" }.should route_to(:controller => "series_scenarios", :action => "destroy", :id => "1")
    end

  end
end
