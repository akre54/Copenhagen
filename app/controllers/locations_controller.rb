class LocationsController < ApplicationController
  before_filter :require_login
  before_filter :require_admin

  # GET /locations{.json}
  def index
    @locations = Location.order(:name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @locations }
    end
  end

  # GET /locations/1{.json}
  def show
    @location = Location.find(params[:id])
    @bikes = @location.bikes

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location }
    end
  end
end
