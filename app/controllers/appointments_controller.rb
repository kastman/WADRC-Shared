class AppointmentsController < ApplicationController
  # GET /appointments
  # GET /appointments.xml
  def index
    @search = default_search(Appointment)
    @appointments = @search.relation.includes(:visit, :series => [:series_metainfo, {:series_log_items => :functional_scenario}]).page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @appointments }
    end
  end

  # GET /appointments/1
  # GET /appointments/1.xml
  def show
    @appointment = Appointment.find(params[:id])
    # @series = @appointment.series.includes(:series_metainfo, :series_log_item => {:functional_scenario => :functional_set}).order("`functional_sets`.`setname` ASC, `order` ASC") # => {:functional_scenario => :functional_set})#.order("functional_sets.setname, series.order")
    @series = @appointment.series.with_pulses_or_tasks.includes(:series_metainfo, :series_log_items => {:functional_scenario => :functional_set}).order("`pfile` ASC, `order` ASC") # => {:functional_scenario => :functional_set})#.order("functional_sets.setname, series.order")
    # logger.info @series = @appointment.series.joins("LEFT OUTER JOIN `series_log_items` ON `series_log_items`.`series_id` = `series`.`id`") #LEFT OUTER JOIN `functional_scenarios` ON `functional_scenarios`.`id` = `series_log_items`.`functional_scenario_id` LEFT OUTER JOIN `functional_sets` ON `functional_sets`.`id` = `functional_scenarios`.`functional_set_id`").order("functional_sets.setname, series.order")
    logger.info @series.to_sql
    logger.info @series.count
    

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @appointment }
    end
  end

  # GET /appointments/new
  # GET /appointments/new.xml
  def new
    @appointment = Appointment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @appointment }
    end
  end

  # GET /appointments/1/edit
  def edit
    @appointment = Appointment.find(params[:id])
  end

  # POST /appointments
  # POST /appointments.xml
  def create
    @appointment = Appointment.new(params[:appointment])

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to(@appointment, :notice => 'Appointment was successfully created.') }
        format.xml  { render :xml => @appointment, :status => :created, :location => @appointment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @appointment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /appointments/1
  # PUT /appointments/1.xml
  def update
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      if @appointment.update_attributes(params[:appointment])
        format.html { redirect_to(@appointment, :notice => 'Appointment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @appointment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.xml
  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to(appointments_url) }
      format.xml  { head :ok }
    end
  end
end
