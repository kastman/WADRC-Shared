require "spec_helper"

describe ParticipantsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/participants" }.should route_to(:controller => "participants", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/participants/new" }.should route_to(:controller => "participants", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/participants/1" }.should route_to(:controller => "participants", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/participants/1/edit" }.should route_to(:controller => "participants", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/participants" }.should route_to(:controller => "participants", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/participants/1" }.should route_to(:controller => "participants", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/participants/1" }.should route_to(:controller => "participants", :action => "destroy", :id => "1")
    end

  end
end
