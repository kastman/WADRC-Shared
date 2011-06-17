require "spec_helper"

describe ScanTasksController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/scan_tasks" }.should route_to(:controller => "scan_tasks", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/scan_tasks/new" }.should route_to(:controller => "scan_tasks", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/scan_tasks/1" }.should route_to(:controller => "scan_tasks", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/scan_tasks/1/edit" }.should route_to(:controller => "scan_tasks", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/scan_tasks" }.should route_to(:controller => "scan_tasks", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/scan_tasks/1" }.should route_to(:controller => "scan_tasks", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/scan_tasks/1" }.should route_to(:controller => "scan_tasks", :action => "destroy", :id => "1")
    end

  end
end
