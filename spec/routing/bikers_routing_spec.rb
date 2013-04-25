require "spec_helper"

describe BikersController do
  describe "routing" do

    context "logged in as staff" do
      before(:all) do
        @current_user = FactoryGirl.create(:user)
      end

      it "disallows viewing biker pages" do
        get("/bikers").should route_to("home#index")
        get("/bikers/new").should route_to("home#index")
        get("/bikers/1").should route_to("home#index")
        get("/bikers/1/checkouts").should route_to("home#index")
        get("/bikers/1/edit").should route_to("home#index")
        post("/bikers").should route_to("home#index")
        put("/bikers/1").should route_to("home#index")
        delete("/bikers/1").should route_to("home#index")
      end
    end

    context "logged in as admin" do
      before(:all) do
        @current_user = FactoryGirl.create(:user)
      end

      it "allows all routes" do
        get("/bikers").should route_to("bikers#index")
        get("/bikers/new").should route_to("bikers#new")
        get("/bikers/1").should route_to("bikers#show", id: '1')
        get("/bikers/1/checkouts").should route_to("bikers#show", biker_id: '1')
        get("/bikers/1/edit").should route_to("bikers#edit", id: '1')
        post("/bikers").should route_to("bikers#create")
        put("/bikers/1").should route_to("bikers#update", id: '1')
        delete("/bikers/1").should route_to("bikers#destroy", id: '1')
      end
    end

  end
end
