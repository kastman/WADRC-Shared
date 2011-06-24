class SeriesSetsController < ApplicationController
  # GET /series_sets
  # GET /series_sets.xml
  def index
    @series_sets = SeriesSet.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @series_sets }
    end
  end

  # GET /series_sets/1
  # GET /series_sets/1.xml
  def show
    @series_set = SeriesSet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @series_set }
    end
  end

  # GET /series_sets/new
  # GET /series_sets/new.xml
  def new
    @series_set = SeriesSet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @series_set }
    end
  end

  # GET /series_sets/1/edit
  def edit
    @series_set = SeriesSet.find(params[:id])
  end

  # POST /series_sets
  # POST /series_sets.xml
  def create
    @series_set = SeriesSet.new(params[:series_set])

    respond_to do |format|
      if @series_set.save
        format.html { redirect_to(@series_set, :notice => 'Series set was successfully created.') }
        format.xml  { render :xml => @series_set, :status => :created, :location => @series_set }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @series_set.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /series_sets/1
  # PUT /series_sets/1.xml
  def update
    @series_set = SeriesSet.find(params[:id])

    respond_to do |format|
      if @series_set.update_attributes(params[:series_set])
        format.html { redirect_to(@series_set, :notice => 'Series set was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @series_set.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /series_sets/1
  # DELETE /series_sets/1.xml
  def destroy
    @series_set = SeriesSet.find(params[:id])
    @series_set.destroy

    respond_to do |format|
      format.html { redirect_to(series_sets_url) }
      format.xml  { head :ok }
    end
  end
end
