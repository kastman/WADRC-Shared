require 'pp'
class SeriesLogItemController < ApplicationController
  def index
    @search = default_search(SeriesLogItem)
    @series_log_item = @search.relation.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @series_log_item }
    end
  end

  # GET /series_log_item/1
  # GET /series_log_item/1.xml
  def show
    @series_log_item = SeriesLogItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @series_log_item }
    end
  end

  # GET /series_log_item/new
  # GET /series_log_item/new.xml
  def new
    @series_log_item = SeriesLogItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @series_log_item }
    end
  end

  # GET /series_log_item/1/edit
  def edit
    @series_log_item = SeriesLogItem.find(params[:id])
  end

  # POST /series_log_item
  # POST /series_log_item.xml
  def create
    @series_log_item = SeriesLogItem.new(params[:series_log_item])

    respond_to do |format|
      if @series_log_item.save
        format.html { redirect_to(@series_log_item, :notice => 'SeriesLogItem was successfully created.') }
        format.xml  { render :xml => @series_log_item, :status => :created, :location => @series_log_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @series_log_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /series_log_item/1
  # PUT /series_log_item/1.xml
  def update
    @series_log_item = SeriesLogItem.find(params[:id])
    preferred_series_id = params[:series_log_item][:preferred_series_id]
    preferred_series = Series.find(preferred_series_id)

    respond_to do |format|
      if preferred_series_id
        if Series.merge(preferred_series, @series_log_item.series)
          format.html { redirect_to(preferred_series, :notice => "Prefferred Series was sucessfully replaced!")}
          format.xml  { head :ok }
        else
          format.html { render :action => "edit", :flash => "Something went wrong associating prefferred series #{preferred_series_id}"}
        end
      elsif @series_log_item.update_attributes(params[:series_log_item])
        format.html { redirect_to(@series_log_item, :notice => 'SeriesLogItem was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @series_log_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /series_log_item/1
  # DELETE /series_log_item/1.xml
  def destroy
    @series_log_item = SeriesLogItem.find(params[:id])
    @series_log_item.destroy

    respond_to do |format|
      format.html { redirect_to(series_log_item_index_url) }
      format.xml  { head :ok }
    end
  end
end
