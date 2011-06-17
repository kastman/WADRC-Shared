class ResearchersController < ApplicationController
  # GET /researchers
  # GET /researchers.xml
  def index
    @search = Researcher.search(params[:search])
    @researchers = @search.relation.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @researchers }
    end
  end

  # GET /researchers/1
  # GET /researchers/1.xml
  def show
    @researcher = Researcher.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @researcher }
    end
  end

  # GET /researchers/new
  # GET /researchers/new.xml
  def new
    @researcher = Researcher.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @researcher }
    end
  end

  # GET /researchers/1/edit
  def edit
    @researcher = Researcher.find(params[:id])
  end

  # POST /researchers
  # POST /researchers.xml
  def create
    @researcher = Researcher.new(params[:researcher])

    respond_to do |format|
      if @researcher.save
        format.html { redirect_to(@researcher, :notice => 'Researcher was successfully created.') }
        format.xml  { render :xml => @researcher, :status => :created, :location => @researcher }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @researcher.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /researchers/1
  # PUT /researchers/1.xml
  def update
    @researcher = Researcher.find(params[:id])

    respond_to do |format|
      if @researcher.update_attributes(params[:researcher])
        format.html { redirect_to(@researcher, :notice => 'Researcher was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @researcher.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /researchers/1
  # DELETE /researchers/1.xml
  def destroy
    @researcher = Researcher.find(params[:id])
    @researcher.destroy

    respond_to do |format|
      format.html { redirect_to(researchers_url) }
      format.xml  { head :ok }
    end
  end
end
