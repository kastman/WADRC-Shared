class SeriesScenariosController < ApplicationController
  # GET /series_scenarios
  # GET /series_scenarios.xml
  def index
    @series_scenarios = SeriesScenario.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @series_scenarios }
    end
  end

  # GET /series_scenarios/1
  # GET /series_scenarios/1.xml
  def show
    @series_scenario = SeriesScenario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @series_scenario }
    end
  end

  # GET /series_scenarios/new
  # GET /series_scenarios/new.xml
  def new
    @series_scenario = SeriesScenario.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @series_scenario }
    end
  end

  # GET /series_scenarios/1/edit
  def edit
    @series_scenario = SeriesScenario.find(params[:id])
  end

  # POST /series_scenarios
  # POST /series_scenarios.xml
  def create
    @series_scenario = SeriesScenario.new(params[:series_scenario])

    respond_to do |format|
      if @series_scenario.save
        format.html { redirect_to(@series_scenario, :notice => 'Functional scenario was successfully created.') }
        format.xml  { render :xml => @series_scenario, :status => :created, :location => @series_scenario }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @series_scenario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /series_scenarios/1
  # PUT /series_scenarios/1.xml
  def update
    @series_scenario = SeriesScenario.find(params[:id])

    respond_to do |format|
      if @series_scenario.update_attributes(params[:series_scenario])
        format.html { redirect_to(@series_scenario, :notice => 'Functional scenario was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @series_scenario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /series_scenarios/1
  # DELETE /series_scenarios/1.xml
  def destroy
    @series_scenario = SeriesScenario.find(params[:id])
    @series_scenario.destroy

    respond_to do |format|
      format.html { redirect_to(series_scenarios_url) }
      format.xml  { head :ok }
    end
  end
end
