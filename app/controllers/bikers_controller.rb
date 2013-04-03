class BikersController < ApplicationController
  before_filter :require_login
  before_filter :require_admin

  # GET /bikers
  # GET /bikers.json
  def index
    @bikers = Biker.order(:netid)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bikers.map{ |b| {netid: b.netid, full_name: b.full_name} }}
    end
  end

  # GET /bikers/1
  # GET /bikers/1.json
  def show
    @biker = Biker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @biker }
    end
  end

  # GET /bikers/new
  # GET /bikers/new.json
  def new
    @biker = Biker.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @biker }
    end
  end

  # GET /bikers/1/edit
  def edit
    @biker = Biker.find(params[:id])
  end

  # POST /bikers
  # POST /bikers.json
  def create
    @biker = Biker.new(params[:biker])

    respond_to do |format|
      if @biker.save
        format.html { redirect_to @biker, notice: 'Biker was successfully created.' }
        format.json { render json: @biker, status: :created, location: @biker }
      else
        format.html { render action: "new" }
        format.json { render json: @biker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bikers/1
  # PUT /bikers/1.json
  def update
    @biker = Biker.find(params[:id])

    respond_to do |format|
      if @biker.update_attributes(params[:biker])
        format.html { redirect_to @biker, notice: 'Biker was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @biker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bikers/1
  # DELETE /bikers/1.json
  def destroy
    @biker = Biker.find(params[:id])
    @biker.destroy

    respond_to do |format|
      format.html { redirect_to bikers_url }
      format.json { head :no_content }
    end
  end
end
