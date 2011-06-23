require "spec_helper"

describe SeriesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/series" }.should route_to(:controller => "series", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/series/new" }.should route_to(:controller => "series", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/series/1" }.should route_to(:controller => "series", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/series/1/edit" }.should route_to(:controller => "series", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/series" }.should route_to(:controller => "series", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/series/1" }.should route_to(:controller => "series", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/series/1" }.should route_to(:controller => "series", :action => "destroy", :id => "1")
    end

  end
end
