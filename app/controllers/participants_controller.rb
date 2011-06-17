class ParticipantsController < ApplicationController
  # GET /participants
  # GET /participants.xml
  def index
    @search = default_search(Participant)
    # @search = Participant.includes(:enrollments).search(params[:search])
    @participants = @search.relation.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @participants }
      format.csv  { render :text => Participant.report_from_table.to_csv, :type => "text/csv", :disposition => "attachment", :filename => "participants.csv" }
    end
  end

  # GET /participants/1
  # GET /participants/1.xml
  def show
    @participant = Participant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @participant }
    end
  end

  # GET /participants/new
  # GET /participants/new.xml
  def new
    @participant = Participant.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @participant }
    end
  end

  # GET /participants/1/edit
  def edit
    @participant = Participant.find(params[:id])
  end

  # POST /participants
  # POST /participants.xml
  def create
    @participant = Participant.new(params[:participant])

    respond_to do |format|
      if @participant.save
        format.html { redirect_to(@participant, :notice => 'Participant was successfully created.') }
        format.xml  { render :xml => @participant, :status => :created, :location => @participant }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @participant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /participants/1
  # PUT /participants/1.xml
  def update
    @participant = Participant.find(params[:id])

    respond_to do |format|
      if @participant.update_attributes(params[:participant])
        format.html { redirect_to(@participant, :notice => 'Participant was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @participant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /participants/1
  # DELETE /participants/1.xml
  def destroy
    @participant = Participant.find(params[:id])
    @participant.destroy

    respond_to do |format|
      format.html { redirect_to(participants_url) }
      format.xml  { head :ok }
    end
  end
end
