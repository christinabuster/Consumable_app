require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  describe "GET #cuisine" do
    it "returns http success" do
      get :cuisine
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #rating" do
    it "returns http success" do
      get :rating
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #price" do
    it "returns http success" do
      get :price
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #location" do
    it "returns http success" do
      get :location
      expect(response).to have_http_status(:success)
    end
  end

end
