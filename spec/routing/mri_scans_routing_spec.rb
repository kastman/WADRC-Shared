require "spec_helper"

describe MriScansController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/mri_scans" }.should route_to(:controller => "mri_scans", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/mri_scans/new" }.should route_to(:controller => "mri_scans", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/mri_scans/1" }.should route_to(:controller => "mri_scans", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/mri_scans/1/edit" }.should route_to(:controller => "mri_scans", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/mri_scans" }.should route_to(:controller => "mri_scans", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/mri_scans/1" }.should route_to(:controller => "mri_scans", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/mri_scans/1" }.should route_to(:controller => "mri_scans", :action => "destroy", :id => "1")
    end

  end
end
