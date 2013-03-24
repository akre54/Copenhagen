class CheckoutsController < ApplicationController
  before_filter :require_login

  before_filter :require_admin, only: [:update, :destroy]

  # GET /Checkouts
  # GET /Checkouts.json
  def index
    @checkouts = Checkout.all

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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @checkout }
    end
  end

  # GET /Checkouts/1/edit
  def edit
    @checkout = Checkout.find(params[:id])
  end

  # POST /Checkouts
  # POST /Checkouts.json
  def create
    @checkout = Checkout.new(params[:checkout])

    respond_to do |format|
      if @checkout.save
        format.html { redirect_to @checkout, notice: 'Checkout was successfully created.' }
        format.json { render json: @checkout, status: :created, checkout: @checkout }
      else
        format.html { render action: "new" }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /Checkouts/1
  # PUT /Checkouts/1.json
  def update
    @checkout = Checkout.find(params[:id])

    respond_to do |format|
      if @checkout.update_attributes(params[:checkout])
        format.html { redirect_to @checkout, notice: 'Checkout was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
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
