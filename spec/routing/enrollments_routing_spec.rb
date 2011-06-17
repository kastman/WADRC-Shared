require "spec_helper"

describe EnrollmentsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/enrollments" }.should route_to(:controller => "enrollments", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/enrollments/new" }.should route_to(:controller => "enrollments", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/enrollments/1" }.should route_to(:controller => "enrollments", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/enrollments/1/edit" }.should route_to(:controller => "enrollments", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/enrollments" }.should route_to(:controller => "enrollments", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/enrollments/1" }.should route_to(:controller => "enrollments", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/enrollments/1" }.should route_to(:controller => "enrollments", :action => "destroy", :id => "1")
    end

  end
end
