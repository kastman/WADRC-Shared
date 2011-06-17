class FunctionalSetsController < ApplicationController
  # GET /functional_sets
  # GET /functional_sets.xml
  def index
    @functional_sets = FunctionalSet.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @functional_sets }
    end
  end

  # GET /functional_sets/1
  # GET /functional_sets/1.xml
  def show
    @functional_set = FunctionalSet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @functional_set }
    end
  end

  # GET /functional_sets/new
  # GET /functional_sets/new.xml
  def new
    @functional_set = FunctionalSet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @functional_set }
    end
  end

  # GET /functional_sets/1/edit
  def edit
    @functional_set = FunctionalSet.find(params[:id])
  end

  # POST /functional_sets
  # POST /functional_sets.xml
  def create
    @functional_set = FunctionalSet.new(params[:functional_set])

    respond_to do |format|
      if @functional_set.save
        format.html { redirect_to(@functional_set, :notice => 'Functional set was successfully created.') }
        format.xml  { render :xml => @functional_set, :status => :created, :location => @functional_set }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @functional_set.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /functional_sets/1
  # PUT /functional_sets/1.xml
  def update
    @functional_set = FunctionalSet.find(params[:id])

    respond_to do |format|
      if @functional_set.update_attributes(params[:functional_set])
        format.html { redirect_to(@functional_set, :notice => 'Functional set was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @functional_set.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /functional_sets/1
  # DELETE /functional_sets/1.xml
  def destroy
    @functional_set = FunctionalSet.find(params[:id])
    @functional_set.destroy

    respond_to do |format|
      format.html { redirect_to(functional_sets_url) }
      format.xml  { head :ok }
    end
  end
end
