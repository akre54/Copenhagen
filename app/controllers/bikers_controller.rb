class BikersController < ApplicationController
  before_filter :require_login
  before_filter :require_admin

  # GET /bikers{.json}
  def index
    @bikers = Biker.order(:netid)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bikers.active.map{ |b| {netid: b.netid, full_name: b.to_s} }}
    end
  end

  # GET /bikers/1{.json}
  # GET /bikers/amk528{.json}
  def show
    @biker = Biker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @biker }
    end
  end

  # GET /bikers/new
  def new
    @biker = Biker.new
  end

  # GET /bikers/amk528/edit
  def edit
    @biker = Biker.find(params[:netid])
  end

  # POST /bikers{.json}
  def create
    @biker = Biker.new(biker_params.permit(:email, :netid))

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

  # PUT /bikers/1{.json}
  def update
    @biker = Biker.find(params[:id])

    respond_to do |format|
      if @biker.update_attributes(biker_params)
        format.html { redirect_to @biker, notice: 'Biker was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @biker.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def biker_params
    params.required(:bikes).permit(:remember_me, :first_name, :last_name, :affilition, :active, :year_of_graduation)
  end
end
