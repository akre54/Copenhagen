class BikesController < ApplicationController
  before_filter :require_login
  before_filter :require_admin, except: [:index, :show]

  # GET /bikes{.json}
  def index
    @bikes = Bike.order(:id)

    unless current_user.admin?
      @bikes = @bikes.operational.where(location_id: session[:location_id])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bikes }
    end
  end

  # GET /bikes/offline
  def offline
    @bikes = Bike.offline.order(:id)
    render 'index'
  end

  # GET /bikes/fucked
  def fucked
    @bikes = Bike.fucked.order(:id)
    render 'index'
  end

  # GET /bikes/1{.json}
  def show
    @bike = Bike.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bike }
    end
  end

  # GET /bikes/new
  def new
    @bike = Bike.new
  end

  # GET /bikes/1/edit
  def edit
    @bike = Bike.find(params[:id])
  end

  # POST /bikes{.json}
  def create
    @bike = Bike.new(bike_params)

    respond_to do |format|
      if @bike.save
        format.html { redirect_to @bike, notice: 'Bike was successfully created.' }
        format.json { render json: @bike, status: :created, location: @bike }
      else
        format.html { render action: "new" }
        format.json { render json: @bike.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bikes/1{.json}
  def update
    @bike = Bike.find(params[:id])
    attrs = bike_params

    if @bike.operational? && attrs[:online] == false
      @bike.take_offline!
    elsif !@bike.operational? && attrs[:online] == true
      @bike.bring_online!
    end

    respond_to do |format|
      if @bike.update_attributes(attrs)
        format.html { redirect_to @bike, notice: 'Bike was successfully updated.' }
        format.json { render json: @bike, status: :accepted, location: @bike }
      else
        format.html { render action: "edit" }
        format.json { render json: @bike.errors, status: :unprocessable_entity }
      end
    end
  end

private
  def bike_params
    params.required(:bike).permit(:color, :condition, :location_id, :image_url, :manufacturer, :model, :notes)
  end
end
