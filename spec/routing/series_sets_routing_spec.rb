require "spec_helper"

describe SeriesSetsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/series_sets" }.should route_to(:controller => "series_sets", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/series_sets/new" }.should route_to(:controller => "series_sets", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/series_sets/1" }.should route_to(:controller => "series_sets", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/series_sets/1/edit" }.should route_to(:controller => "series_sets", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/series_sets" }.should route_to(:controller => "series_sets", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/series_sets/1" }.should route_to(:controller => "series_sets", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/series_sets/1" }.should route_to(:controller => "series_sets", :action => "destroy", :id => "1")
    end

  end
end
