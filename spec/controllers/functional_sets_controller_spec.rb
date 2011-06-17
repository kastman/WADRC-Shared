require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe FunctionalSetsController do

  def mock_functional_set(stubs={})
    @mock_functional_set ||= mock_model(FunctionalSet, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all functional_sets as @functional_sets" do
      FunctionalSet.stub(:all) { [mock_functional_set] }
      get :index
      assigns(:functional_sets).should eq([mock_functional_set])
    end
  end

  describe "GET show" do
    it "assigns the requested functional_set as @functional_set" do
      FunctionalSet.stub(:find).with("37") { mock_functional_set }
      get :show, :id => "37"
      assigns(:functional_set).should be(mock_functional_set)
    end
  end

  describe "GET new" do
    it "assigns a new functional_set as @functional_set" do
      FunctionalSet.stub(:new) { mock_functional_set }
      get :new
      assigns(:functional_set).should be(mock_functional_set)
    end
  end

  describe "GET edit" do
    it "assigns the requested functional_set as @functional_set" do
      FunctionalSet.stub(:find).with("37") { mock_functional_set }
      get :edit, :id => "37"
      assigns(:functional_set).should be(mock_functional_set)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created functional_set as @functional_set" do
        FunctionalSet.stub(:new).with({'these' => 'params'}) { mock_functional_set(:save => true) }
        post :create, :functional_set => {'these' => 'params'}
        assigns(:functional_set).should be(mock_functional_set)
      end

      it "redirects to the created functional_set" do
        FunctionalSet.stub(:new) { mock_functional_set(:save => true) }
        post :create, :functional_set => {}
        response.should redirect_to(functional_set_url(mock_functional_set))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved functional_set as @functional_set" do
        FunctionalSet.stub(:new).with({'these' => 'params'}) { mock_functional_set(:save => false) }
        post :create, :functional_set => {'these' => 'params'}
        assigns(:functional_set).should be(mock_functional_set)
      end

      it "re-renders the 'new' template" do
        FunctionalSet.stub(:new) { mock_functional_set(:save => false) }
        post :create, :functional_set => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested functional_set" do
        FunctionalSet.stub(:find).with("37") { mock_functional_set }
        mock_functional_set.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :functional_set => {'these' => 'params'}
      end

      it "assigns the requested functional_set as @functional_set" do
        FunctionalSet.stub(:find) { mock_functional_set(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:functional_set).should be(mock_functional_set)
      end

      it "redirects to the functional_set" do
        FunctionalSet.stub(:find) { mock_functional_set(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(functional_set_url(mock_functional_set))
      end
    end

    describe "with invalid params" do
      it "assigns the functional_set as @functional_set" do
        FunctionalSet.stub(:find) { mock_functional_set(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:functional_set).should be(mock_functional_set)
      end

      it "re-renders the 'edit' template" do
        FunctionalSet.stub(:find) { mock_functional_set(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested functional_set" do
      FunctionalSet.stub(:find).with("37") { mock_functional_set }
      mock_functional_set.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the functional_sets list" do
      FunctionalSet.stub(:find) { mock_functional_set }
      delete :destroy, :id => "1"
      response.should redirect_to(functional_sets_url)
    end
  end

end
