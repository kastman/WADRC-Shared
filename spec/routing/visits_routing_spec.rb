require "spec_helper"

describe VisitsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/visits" }.should route_to(:controller => "visits", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/visits/new" }.should route_to(:controller => "visits", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/visits/1" }.should route_to(:controller => "visits", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/visits/1/edit" }.should route_to(:controller => "visits", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/visits" }.should route_to(:controller => "visits", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/visits/1" }.should route_to(:controller => "visits", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/visits/1" }.should route_to(:controller => "visits", :action => "destroy", :id => "1")
    end

  end
end
