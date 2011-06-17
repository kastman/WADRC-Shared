require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe DiagnosisMethodsController do

  def mock_diagnosis_method(stubs={})
    @mock_diagnosis_method ||= mock_model(DiagnosisMethod, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all diagnosis_methods as @diagnosis_methods" do
      DiagnosisMethod.stub(:all) { [mock_diagnosis_method] }
      get :index
      assigns(:diagnosis_methods).should eq([mock_diagnosis_method])
    end
  end

  describe "GET show" do
    it "assigns the requested diagnosis_method as @diagnosis_method" do
      DiagnosisMethod.stub(:find).with("37") { mock_diagnosis_method }
      get :show, :id => "37"
      assigns(:diagnosis_method).should be(mock_diagnosis_method)
    end
  end

  describe "GET new" do
    it "assigns a new diagnosis_method as @diagnosis_method" do
      DiagnosisMethod.stub(:new) { mock_diagnosis_method }
      get :new
      assigns(:diagnosis_method).should be(mock_diagnosis_method)
    end
  end

  describe "GET edit" do
    it "assigns the requested diagnosis_method as @diagnosis_method" do
      DiagnosisMethod.stub(:find).with("37") { mock_diagnosis_method }
      get :edit, :id => "37"
      assigns(:diagnosis_method).should be(mock_diagnosis_method)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created diagnosis_method as @diagnosis_method" do
        DiagnosisMethod.stub(:new).with({'these' => 'params'}) { mock_diagnosis_method(:save => true) }
        post :create, :diagnosis_method => {'these' => 'params'}
        assigns(:diagnosis_method).should be(mock_diagnosis_method)
      end

      it "redirects to the created diagnosis_method" do
        DiagnosisMethod.stub(:new) { mock_diagnosis_method(:save => true) }
        post :create, :diagnosis_method => {}
        response.should redirect_to(diagnosis_method_url(mock_diagnosis_method))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved diagnosis_method as @diagnosis_method" do
        DiagnosisMethod.stub(:new).with({'these' => 'params'}) { mock_diagnosis_method(:save => false) }
        post :create, :diagnosis_method => {'these' => 'params'}
        assigns(:diagnosis_method).should be(mock_diagnosis_method)
      end

      it "re-renders the 'new' template" do
        DiagnosisMethod.stub(:new) { mock_diagnosis_method(:save => false) }
        post :create, :diagnosis_method => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested diagnosis_method" do
        DiagnosisMethod.stub(:find).with("37") { mock_diagnosis_method }
        mock_diagnosis_method.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :diagnosis_method => {'these' => 'params'}
      end

      it "assigns the requested diagnosis_method as @diagnosis_method" do
        DiagnosisMethod.stub(:find) { mock_diagnosis_method(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:diagnosis_method).should be(mock_diagnosis_method)
      end

      it "redirects to the diagnosis_method" do
        DiagnosisMethod.stub(:find) { mock_diagnosis_method(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(diagnosis_method_url(mock_diagnosis_method))
      end
    end

    describe "with invalid params" do
      it "assigns the diagnosis_method as @diagnosis_method" do
        DiagnosisMethod.stub(:find) { mock_diagnosis_method(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:diagnosis_method).should be(mock_diagnosis_method)
      end

      it "re-renders the 'edit' template" do
        DiagnosisMethod.stub(:find) { mock_diagnosis_method(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested diagnosis_method" do
      DiagnosisMethod.stub(:find).with("37") { mock_diagnosis_method }
      mock_diagnosis_method.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the diagnosis_methods list" do
      DiagnosisMethod.stub(:find) { mock_diagnosis_method }
      delete :destroy, :id => "1"
      response.should redirect_to(diagnosis_methods_url)
    end
  end

end
