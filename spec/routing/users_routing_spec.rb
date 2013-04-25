require "spec_helper"

describe UsersController do
  describe "routing" do

    context "logged in as regular user" do
      before(:all) do
        @current_user = FactoryGirl.build(:user)
      end

      it "should redirect to home" do
        get("/users").should route_to("home#index")
        get("/users/new").should route_to("home#index")
        get("/users/1").should route_to("home#index")
        get("/users/1/edit").should route_to("home#index")
        post("/users").should route_to("home#index")
        put("/users/1").should route_to("home#index")
        delete("/users/1").should route_to("home#index")
      end
    end

    context "logged in as admin" do
      before(:all) do
        @current_user = FactoryGirl.build(:admin)
      end

      it "should allow routing to everything" do
        get("/users").should route_to("users#index")
        get("/users/new").should route_to("users#new")
        get("/users/1").should route_to("users#show", :id => "1")
        get("/users/1/edit").should route_to("users#edit", :id => "1")
        post("/users").should route_to("users#create")
        put("/users/1").should route_to("users#update", :id => "1")
        delete("/users/1").should route_to("users#destroy", :id => "1")
      end
    end
  end
end
