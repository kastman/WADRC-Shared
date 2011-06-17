class MriScansController < ApplicationController
  # GET /mri_scans
  # GET /mri_scans.xml
  def index
    @search = default_search(MriScan)
    @mri_scans = @search.relation.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mri_scans }
    end
  end

  # GET /mri_scans/1
  # GET /mri_scans/1.xml
  def show
    @mri_scan = MriScan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mri_scan }
    end
  end

  # GET /mri_scans/new
  # GET /mri_scans/new.xml
  def new
    @mri_scan = MriScan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mri_scan }
    end
  end

  # GET /mri_scans/1/edit
  def edit
    @mri_scan = MriScan.find(params[:id])
  end

  # POST /mri_scans
  # POST /mri_scans.xml
  def create
    @mri_scan = MriScan.new(params[:mri_scan])

    respond_to do |format|
      if @mri_scan.save
        format.html { redirect_to(@mri_scan, :notice => 'Mri scan was successfully created.') }
        format.xml  { render :xml => @mri_scan, :status => :created, :location => @mri_scan }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mri_scan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mri_scans/1
  # PUT /mri_scans/1.xml
  def update
    @mri_scan = MriScan.find(params[:id])

    respond_to do |format|
      if @mri_scan.update_attributes(params[:mri_scan])
        format.html { redirect_to(@mri_scan, :notice => 'Mri scan was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mri_scan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mri_scans/1
  # DELETE /mri_scans/1.xml
  def destroy
    @mri_scan = MriScan.find(params[:id])
    @mri_scan.destroy

    respond_to do |format|
      format.html { redirect_to(mri_scans_url) }
      format.xml  { head :ok }
    end
  end
end
