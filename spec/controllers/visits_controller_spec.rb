require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe VisitsController do

  def mock_visit(stubs={})
    @mock_visit ||= mock_model(Visit, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all visits as @visits" do
      Visit.stub_chain(:search, :relation, :page) { [mock_visit] }
      get :index
      assigns(:visits).should eq([mock_visit])
    end
  end

  describe "GET show" do
    it "assigns the requested visit as @visit" do
      Visit.stub(:find).with("37") { mock_visit }
      get :show, :id => "37"
      assigns(:visit).should be(mock_visit)
    end
  end

  describe "GET new" do
    it "assigns a new visit as @visit" do
      Visit.stub(:new) { mock_visit }
      get :new
      assigns(:visit).should be(mock_visit)
    end
  end

  describe "GET edit" do
    it "assigns the requested visit as @visit" do
      Visit.stub(:find).with("37") { mock_visit }
      get :edit, :id => "37"
      assigns(:visit).should be(mock_visit)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created visit as @visit" do
        Visit.stub(:new).with({'these' => 'params'}) { mock_visit(:save => true) }
        post :create, :visit => {'these' => 'params'}
        assigns(:visit).should be(mock_visit)
      end

      it "redirects to the created visit" do
        Visit.stub(:new) { mock_visit(:save => true) }
        post :create, :visit => {}
        response.should redirect_to(visit_url(mock_visit))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved visit as @visit" do
        Visit.stub(:new).with({'these' => 'params'}) { mock_visit(:save => false) }
        post :create, :visit => {'these' => 'params'}
        assigns(:visit).should be(mock_visit)
      end

      it "re-renders the 'new' template" do
        Visit.stub(:new) { mock_visit(:save => false) }
        post :create, :visit => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested visit" do
        Visit.stub(:find).with("37") { mock_visit }
        mock_visit.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :visit => {'these' => 'params'}
      end

      it "assigns the requested visit as @visit" do
        Visit.stub(:find) { mock_visit(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:visit).should be(mock_visit)
      end

      it "redirects to the visit" do
        Visit.stub(:find) { mock_visit(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(visit_url(mock_visit))
      end
    end

    describe "with invalid params" do
      it "assigns the visit as @visit" do
        Visit.stub(:find) { mock_visit(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:visit).should be(mock_visit)
      end

      it "re-renders the 'edit' template" do
        Visit.stub(:find) { mock_visit(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested visit" do
      Visit.stub(:find).with("37") { mock_visit }
      mock_visit.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the visits list" do
      Visit.stub(:find) { mock_visit }
      delete :destroy, :id => "1"
      response.should redirect_to(visits_url)
    end
  end

end
