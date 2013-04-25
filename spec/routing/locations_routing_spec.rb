require "spec_helper"

describe LocationsController do
  describe "routing" do

    context "logged in as regular user" do
      before(:all) do
        @current_user = FactoryGirl.build(:user)
      end

      it "routes to home" do
        get("/locations").should route_to("home#index")
        get("/locations/1").should route_to("home#index")
        get("/locations/1/checkouts").should route_to("home#index")
      end
    end

    context "logged in as admin" do
      before(:all) do
        @current_user = FactoryGirl.build(:admin)
      end

      it "routes to requested pages" do
        get("/locations").should route_to("locations#index")
        get("/locations/1").should route_to("locations#show", id: '1')
        get("/locations/1/checkouts").should route_to("checkouts#index", location_id: '1')
      end
    end

  end
end
