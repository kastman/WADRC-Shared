require "spec_helper"

describe DiagnosesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/diagnoses" }.should route_to(:controller => "diagnoses", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/diagnoses/new" }.should route_to(:controller => "diagnoses", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/diagnoses/1" }.should route_to(:controller => "diagnoses", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/diagnoses/1/edit" }.should route_to(:controller => "diagnoses", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/diagnoses" }.should route_to(:controller => "diagnoses", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/diagnoses/1" }.should route_to(:controller => "diagnoses", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/diagnoses/1" }.should route_to(:controller => "diagnoses", :action => "destroy", :id => "1")
    end

  end
end
