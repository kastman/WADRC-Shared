class ScanTasksController < ApplicationController
  # GET /scan_tasks
  # GET /scan_tasks.xml
  def index
    @search = default_search(ScanTask)
    @scan_tasks = @search.relation.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @scan_tasks }
    end
  end

  # GET /scan_tasks/1
  # GET /scan_tasks/1.xml
  def show
    @scan_task = ScanTask.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @scan_task }
    end
  end

  # GET /scan_tasks/new
  # GET /scan_tasks/new.xml
  def new
    @scan_task = ScanTask.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @scan_task }
    end
  end

  # GET /scan_tasks/1/edit
  def edit
    @scan_task = ScanTask.find(params[:id])
  end

  # POST /scan_tasks
  # POST /scan_tasks.xml
  def create
    @scan_task = ScanTask.new(params[:scan_task])

    respond_to do |format|
      if @scan_task.save
        format.html { redirect_to(@scan_task, :notice => 'Scan task was successfully created.') }
        format.xml  { render :xml => @scan_task, :status => :created, :location => @scan_task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @scan_task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /scan_tasks/1
  # PUT /scan_tasks/1.xml
  def update
    @scan_task = ScanTask.find(params[:id])

    respond_to do |format|
      if @scan_task.update_attributes(params[:scan_task])
        format.html { redirect_to(@scan_task, :notice => 'Scan task was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @scan_task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /scan_tasks/1
  # DELETE /scan_tasks/1.xml
  def destroy
    @scan_task = ScanTask.find(params[:id])
    @scan_task.destroy

    respond_to do |format|
      format.html { redirect_to(scan_tasks_url) }
      format.xml  { head :ok }
    end
  end
end
