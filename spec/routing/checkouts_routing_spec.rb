require "spec_helper"

describe CheckoutsController do
  describe "routing" do

    context "logged in as regular user" do
      before(:all) do
        @current_user = FactoryGirl.create(:user)
      end

      after(:all) do
        @current_user.destroy
      end

      it "allows location staffers to access some routes" do
        get("/checkouts").should route_to("home#index")
        get("/checkouts/new").should route_to("checkouts#new")
        get("/checkouts/1").should route_to("home#index")
        post("/checkouts/1/checkin").should route_to("checkouts#checkin")
        post("/checkouts").should route_to("checkouts#create")
        put("/checkouts/1").should route_to("home#index")
        delete("/checkouts/1").should route_to("home#index")
      end
    end

    context "logged in as regular user" do
      before(:all) do
        @current_user = FactoryGirl.build(:admin)
      end

      after(:all) do
        @current_user.destroy
      end

      it "routes to requested pages when admin" do
        get("/checkouts").should route_to("checkouts#index")
        get("/checkouts/new").should route_to("checkouts#new")
        get("/checkouts/1").should route_to("checkouts#show", id: '1')
        post("/checkouts/1/checkin").should route_to("checkouts#checkin")
        post("/checkouts").should route_to("checkouts#create")
        put("/checkouts/1").should route_to("checkouts#update")
        delete("/checkouts/1").should route_to("checkouts#destroy")
      end
    end

  end
end
