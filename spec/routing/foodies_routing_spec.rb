require "rails_helper"

RSpec.describe FoodiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/foodies").to route_to("foodies#index")
    end

    it "routes to #new" do
      expect(:get => "/foodies/new").to route_to("foodies#new")
    end

    it "routes to #show" do
      expect(:get => "/foodies/1").to route_to("foodies#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/foodies/1/edit").to route_to("foodies#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/foodies").to route_to("foodies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/foodies/1").to route_to("foodies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/foodies/1").to route_to("foodies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/foodies/1").to route_to("foodies#destroy", :id => "1")
    end

  end
end
