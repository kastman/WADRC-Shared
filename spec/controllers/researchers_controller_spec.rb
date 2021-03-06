require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe ResearchersController do

  def mock_researcher(stubs={})
    @mock_researcher ||= mock_model(Researcher, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all researchers as @researchers" do
      Researcher.stub_chain(:search, :relation, :page) { [mock_researcher] }
      get :index
      assigns(:researchers).should eq([mock_researcher])
    end
  end

  describe "GET show" do
    it "assigns the requested researcher as @researcher" do
      Researcher.stub(:find).with("37") { mock_researcher }
      get :show, :id => "37"
      assigns(:researcher).should be(mock_researcher)
    end
  end

  describe "GET new" do
    it "assigns a new researcher as @researcher" do
      Researcher.stub(:new) { mock_researcher }
      get :new
      assigns(:researcher).should be(mock_researcher)
    end
  end

  describe "GET edit" do
    it "assigns the requested researcher as @researcher" do
      Researcher.stub(:find).with("37") { mock_researcher }
      get :edit, :id => "37"
      assigns(:researcher).should be(mock_researcher)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created researcher as @researcher" do
        Researcher.stub(:new).with({'these' => 'params'}) { mock_researcher(:save => true) }
        post :create, :researcher => {'these' => 'params'}
        assigns(:researcher).should be(mock_researcher)
      end

      it "redirects to the created researcher" do
        Researcher.stub(:new) { mock_researcher(:save => true) }
        post :create, :researcher => {}
        response.should redirect_to(researcher_url(mock_researcher))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved researcher as @researcher" do
        Researcher.stub(:new).with({'these' => 'params'}) { mock_researcher(:save => false) }
        post :create, :researcher => {'these' => 'params'}
        assigns(:researcher).should be(mock_researcher)
      end

      it "re-renders the 'new' template" do
        Researcher.stub(:new) { mock_researcher(:save => false) }
        post :create, :researcher => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested researcher" do
        Researcher.stub(:find).with("37") { mock_researcher }
        mock_researcher.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :researcher => {'these' => 'params'}
      end

      it "assigns the requested researcher as @researcher" do
        Researcher.stub(:find) { mock_researcher(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:researcher).should be(mock_researcher)
      end

      it "redirects to the researcher" do
        Researcher.stub(:find) { mock_researcher(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(researcher_url(mock_researcher))
      end
    end

    describe "with invalid params" do
      it "assigns the researcher as @researcher" do
        Researcher.stub(:find) { mock_researcher(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:researcher).should be(mock_researcher)
      end

      it "re-renders the 'edit' template" do
        Researcher.stub(:find) { mock_researcher(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested researcher" do
      Researcher.stub(:find).with("37") { mock_researcher }
      mock_researcher.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the researchers list" do
      Researcher.stub(:find) { mock_researcher }
      delete :destroy, :id => "1"
      response.should redirect_to(researchers_url)
    end
  end

end
