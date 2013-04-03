class CheckoutsController < ApplicationController
  before_filter :require_login

  before_filter :require_admin, except: [:new]

  # GET /Checkouts
  # GET /Checkouts.json
  def index
    if params[:bike_id]
      @checkouts = Bike.find(params[:bike_id]).checkouts.order('created_at DESC')
    else
      @checkouts = Checkout.order('created_at DESC')
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @checkouts }
    end
  end

  # GET /Checkouts/1
  # GET /Checkouts/1.json
  def show
    @checkout = Checkout.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @checkout }
    end
  end

  # GET /Checkouts/new
  # GET /Checkouts/new.json
  def new
    @checkout = Checkout.new

    if params[:bike_id]
      @bike = Bike.find(params[:bike_id])
    else
      @bikes = current_user.admin? ? Bike.all : Bike.find_all_by_location_id(session[:location_id])
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @checkout }
    end
  end

  # POST /Checkouts
  # POST /Checkouts.json
  def create
    @biker = Biker.find_by_netid(params[:checkout][:biker_netid])
    @bike = Bike.find(params[:checkout][:bike_id])

    respond_to do |format|
      if @bike.checkout_to(@biker)
        format.html { redirect_to @bike.last_checkout, notice: 'Checkout was successfully created.' }
        format.json { render json: @bike, status: :created, checkout: @checkout }
      else
        format.html { render action: "new" }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Checkouts/1
  # DELETE /Checkouts/1.json
  def destroy
    @checkout = Checkout.find(params[:id])

    @checkout.destroy

    respond_to do |format|
      format.html { redirect_to Checkouts_url }
      format.json { head :no_content }
    end
  end
end
