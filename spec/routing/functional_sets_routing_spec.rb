require "spec_helper"

describe FunctionalSetsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/functional_sets" }.should route_to(:controller => "functional_sets", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/functional_sets/new" }.should route_to(:controller => "functional_sets", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/functional_sets/1" }.should route_to(:controller => "functional_sets", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/functional_sets/1/edit" }.should route_to(:controller => "functional_sets", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/functional_sets" }.should route_to(:controller => "functional_sets", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/functional_sets/1" }.should route_to(:controller => "functional_sets", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/functional_sets/1" }.should route_to(:controller => "functional_sets", :action => "destroy", :id => "1")
    end

  end
end
