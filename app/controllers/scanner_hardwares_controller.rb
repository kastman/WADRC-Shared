class ScannerHardwaresController < ApplicationController
  # GET /scanner_hardwares
  # GET /scanner_hardwares.xml
  def index
    @scanner_hardwares = ScannerHardware.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @scanner_hardwares }
    end
  end

  # GET /scanner_hardwares/1
  # GET /scanner_hardwares/1.xml
  def show
    @scanner_hardware = ScannerHardware.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @scanner_hardware }
    end
  end

  # GET /scanner_hardwares/new
  # GET /scanner_hardwares/new.xml
  def new
    @scanner_hardware = ScannerHardware.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @scanner_hardware }
    end
  end

  # GET /scanner_hardwares/1/edit
  def edit
    @scanner_hardware = ScannerHardware.find(params[:id])
  end

  # POST /scanner_hardwares
  # POST /scanner_hardwares.xml
  def create
    @scanner_hardware = ScannerHardware.new(params[:scanner_hardware])

    respond_to do |format|
      if @scanner_hardware.save
        format.html { redirect_to(@scanner_hardware, :notice => 'Scanner hardware was successfully created.') }
        format.xml  { render :xml => @scanner_hardware, :status => :created, :location => @scanner_hardware }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @scanner_hardware.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /scanner_hardwares/1
  # PUT /scanner_hardwares/1.xml
  def update
    @scanner_hardware = ScannerHardware.find(params[:id])

    respond_to do |format|
      if @scanner_hardware.update_attributes(params[:scanner_hardware])
        format.html { redirect_to(@scanner_hardware, :notice => 'Scanner hardware was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @scanner_hardware.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /scanner_hardwares/1
  # DELETE /scanner_hardwares/1.xml
  def destroy
    @scanner_hardware = ScannerHardware.find(params[:id])
    @scanner_hardware.destroy

    respond_to do |format|
      format.html { redirect_to(scanner_hardwares_url) }
      format.xml  { head :ok }
    end
  end
end
