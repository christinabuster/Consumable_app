require 'rails_helper'

RSpec.describe "Foodies", type: :request do
  describe "GET /foodies" do
    it "works! (now write some real specs)" do
      get foodies_path
      expect(response).to have_http_status(200)
    end
  end
end
