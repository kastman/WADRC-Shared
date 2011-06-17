require "spec_helper"

describe ScannerHardwaresController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/scanner_hardwares" }.should route_to(:controller => "scanner_hardwares", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/scanner_hardwares/new" }.should route_to(:controller => "scanner_hardwares", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/scanner_hardwares/1" }.should route_to(:controller => "scanner_hardwares", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/scanner_hardwares/1/edit" }.should route_to(:controller => "scanner_hardwares", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/scanner_hardwares" }.should route_to(:controller => "scanner_hardwares", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/scanner_hardwares/1" }.should route_to(:controller => "scanner_hardwares", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/scanner_hardwares/1" }.should route_to(:controller => "scanner_hardwares", :action => "destroy", :id => "1")
    end

  end
end
