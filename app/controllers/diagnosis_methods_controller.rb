class DiagnosisMethodsController < ApplicationController
  # GET /diagnosis_methods
  # GET /diagnosis_methods.xml
  def index
    @diagnosis_methods = DiagnosisMethod.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @diagnosis_methods }
    end
  end

  # GET /diagnosis_methods/1
  # GET /diagnosis_methods/1.xml
  def show
    @diagnosis_method = DiagnosisMethod.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @diagnosis_method }
    end
  end

  # GET /diagnosis_methods/new
  # GET /diagnosis_methods/new.xml
  def new
    @diagnosis_method = DiagnosisMethod.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @diagnosis_method }
    end
  end

  # GET /diagnosis_methods/1/edit
  def edit
    @diagnosis_method = DiagnosisMethod.find(params[:id])
  end

  # POST /diagnosis_methods
  # POST /diagnosis_methods.xml
  def create
    @diagnosis_method = DiagnosisMethod.new(params[:diagnosis_method])

    respond_to do |format|
      if @diagnosis_method.save
        format.html { redirect_to(@diagnosis_method, :notice => 'Diagnosis method was successfully created.') }
        format.xml  { render :xml => @diagnosis_method, :status => :created, :location => @diagnosis_method }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @diagnosis_method.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /diagnosis_methods/1
  # PUT /diagnosis_methods/1.xml
  def update
    @diagnosis_method = DiagnosisMethod.find(params[:id])

    respond_to do |format|
      if @diagnosis_method.update_attributes(params[:diagnosis_method])
        format.html { redirect_to(@diagnosis_method, :notice => 'Diagnosis method was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @diagnosis_method.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /diagnosis_methods/1
  # DELETE /diagnosis_methods/1.xml
  def destroy
    @diagnosis_method = DiagnosisMethod.find(params[:id])
    @diagnosis_method.destroy

    respond_to do |format|
      format.html { redirect_to(diagnosis_methods_url) }
      format.xml  { head :ok }
    end
  end
end
