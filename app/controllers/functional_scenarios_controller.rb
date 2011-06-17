class FunctionalScenariosController < ApplicationController
  # GET /functional_scenarios
  # GET /functional_scenarios.xml
  def index
    @functional_scenarios = FunctionalScenario.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @functional_scenarios }
    end
  end

  # GET /functional_scenarios/1
  # GET /functional_scenarios/1.xml
  def show
    @functional_scenario = FunctionalScenario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @functional_scenario }
    end
  end

  # GET /functional_scenarios/new
  # GET /functional_scenarios/new.xml
  def new
    @functional_scenario = FunctionalScenario.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @functional_scenario }
    end
  end

  # GET /functional_scenarios/1/edit
  def edit
    @functional_scenario = FunctionalScenario.find(params[:id])
  end

  # POST /functional_scenarios
  # POST /functional_scenarios.xml
  def create
    @functional_scenario = FunctionalScenario.new(params[:functional_scenario])

    respond_to do |format|
      if @functional_scenario.save
        format.html { redirect_to(@functional_scenario, :notice => 'Functional scenario was successfully created.') }
        format.xml  { render :xml => @functional_scenario, :status => :created, :location => @functional_scenario }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @functional_scenario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /functional_scenarios/1
  # PUT /functional_scenarios/1.xml
  def update
    @functional_scenario = FunctionalScenario.find(params[:id])

    respond_to do |format|
      if @functional_scenario.update_attributes(params[:functional_scenario])
        format.html { redirect_to(@functional_scenario, :notice => 'Functional scenario was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @functional_scenario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /functional_scenarios/1
  # DELETE /functional_scenarios/1.xml
  def destroy
    @functional_scenario = FunctionalScenario.find(params[:id])
    @functional_scenario.destroy

    respond_to do |format|
      format.html { redirect_to(functional_scenarios_url) }
      format.xml  { head :ok }
    end
  end
end
