class CheckoutsController < ApplicationController
  before_filter :require_login
  before_filter :require_admin, except: [:new, :create, :checkin]

  layout :choose_layout

  helper_method :sort_column, :sort_direction

  # GET /checkouts{.json}
  # GET /bikes/1/checkouts{.json}
  # GET /bikers/amk528/checkouts{.json}
  # GET /locations/1/checkouts{.json}
  def index
    unless current_user.admin? || session[:location_id] == params[:location_id]
      redirect_to root, { status: :unauthorized }
    end

    @checkouts = Checkout
      .order("#{sort_column} #{sort_direction}")
      .limit(params[:limit] || 20)
      .offset(params[:offset].to_i)

    if params[:bike_id]
      @bike = Bike.find(params[:bike_id])
      @checkouts = @checkouts.where(bike_id: @bike.id)
    elsif params[:biker_id]
      @biker = Biker.find(params[:biker_id])
      @checkouts = @checkouts.where(biker_id: @biker.id)
    elsif params[:location_id]
      @location = Location.find(params[:location_id])
      @checkouts = @checkouts.where(location_id: @location.id)
    elsif params[:user_id]
      @staffer = User.find(params[:user_id])
      @checkouts = @checkouts.where(staffer_id: @staffer.id)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @checkouts }
    end
  end

  # GET /checkouts/1{.json}
  def show
    @checkout = Checkout.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @checkout }
    end
  end

  # GET /checkouts/new
  # GET /bikes/1/checkouts/new
  def new
    @checkout = Checkout.new

    if params[:bike_id]
      @checkout.bike_id = params[:bike_id]
    else
      @bikes = current_user.admin? ? Bike.operational : Bike.operational.find_all_by_location_id(session[:location_id])
      @bikes = @bikes.order(:id)
    end
  end

  # POST /checkouts{.json}
  # POST /bikes/1/checkouts{.json}
  def create
    @biker = Biker.find_by_netid(params[:checkout][:biker][:netid])
    @bike = Bike.find(params[:checkout][:bike][:id])

    @checkout = Checkout.new(
      bike: @bike,
      biker: @biker,
      location: @bike.location,
      staffer: current_user
    )

    respond_to do |format|
      if @checkout.save
        format.html { redirect_to @checkout, notice: "Bike was checked out to #{@biker.first_name}. Please remind them to bike safely!" }
        format.json { render json: @bike, status: :created, checkout: @checkout }
      else
        format.html { render action: "new" }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /checkouts/1/checkin{.json}
  def checkin
    @checkout = Checkout.find(params[:id])

    respond_to do |format|
      if @checkout.checkin
        format.html { redirect_to @checkout.bike, notice: "Bike has been checked in. Please thank #{@checkout.biker.first_name} for their participation!" }
        format.json { render json: @checkout.bike }
      else
        format.html { render action: "new" }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def choose_layout
    # skip app layout if requesting by xhr (for the new checkout modal)
    request.xhr? ? nil : 'application'
  end

  def sort_column
    Checkout.column_names.include?(params[:sort]) ? params[:sort] : 'created_at'
  end

  def sort_direction
    %w(asc desc).include?(params[:direction]) ? params[:direction] : "desc"
  end
end
