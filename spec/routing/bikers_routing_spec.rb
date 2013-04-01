require "spec_helper"

describe BikersController do
  describe "routing" do

    it "routes to #index" do
      get("/bikers").should route_to("bikers#index")
    end

    it "routes to #new" do
      get("/bikers/new").should route_to("bikers#new")
    end

    it "routes to #show" do
      get("/bikers/1").should route_to("bikers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bikers/1/edit").should route_to("bikers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/bikers").should route_to("bikers#create")
    end

    it "routes to #update" do
      put("/bikers/1").should route_to("bikers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bikers/1").should route_to("bikers#destroy", :id => "1")
    end

  end
end
