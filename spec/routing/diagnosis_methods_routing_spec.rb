require "spec_helper"

describe DiagnosisMethodsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/diagnosis_methods" }.should route_to(:controller => "diagnosis_methods", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/diagnosis_methods/new" }.should route_to(:controller => "diagnosis_methods", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/diagnosis_methods/1" }.should route_to(:controller => "diagnosis_methods", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/diagnosis_methods/1/edit" }.should route_to(:controller => "diagnosis_methods", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/diagnosis_methods" }.should route_to(:controller => "diagnosis_methods", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/diagnosis_methods/1" }.should route_to(:controller => "diagnosis_methods", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/diagnosis_methods/1" }.should route_to(:controller => "diagnosis_methods", :action => "destroy", :id => "1")
    end

  end
end
