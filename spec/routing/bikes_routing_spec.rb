require "spec_helper"

describe BikesController do
  describe "routing" do

    context "logged in as staffer" do
      before(:all) do
        @current_user = FactoryGirl.build(:user)
      end

      it "allows staffers to perform permitted actions" do
        get("/bikes").should route_to("bikes#index")
        get("/bikes/new").should route_to("home#index")
        get("/bikes/1").should route_to("bikes#show", id: '1')
        get("/bikes/1/edit").should route_to("home#index", id: '1')
        get("/bikes/1/checkouts").should route_to("home#index")
        get("/bikes/1/checkouts/new").should route_to("checkouts#new", bike_id: '1')
        post("/bikes/1/checkouts").should route_to("checkouts#create", bike_id: '1')
        post("/bikes").should route_to("home#index")
        put("/bikes/1").should route_to("home#index")
        delete("/bikes/1").should route_to("home#index")
      end
    end

    context "as admin" do
      before(:all) do
        @current_user = FactoryGirl.build(:user)
      end

      it "allows admins to perform all actions" do
        get("/bikes").should route_to("bikes#index")
        get("/bikes/new").should route_to("bikes#new")
        get("/bikes/1").should route_to("bikes#show", id: '1')
        get("/bikes/1/edit").should route_to("bikes#edit", id: '1')
        get("/bikes/1/checkouts").should route_to("checkouts#index", bike_id: '1')
        get("/bikes/1/checkouts/new").should route_to("checkouts#new", bike_id: '1')
        post("/bikes/1/checkouts").should route_to("checkouts#create", bike_id: '1')
        post("/bikes").should route_to("bikes#create")
        put("/bikes/1").should route_to("bikes#update", id: '1')
        delete("/bikes/1").should route_to("bikes#destroy", id: '1')
      end
    end
  end
end
