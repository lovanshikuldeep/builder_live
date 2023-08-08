require 'rails_helper'

RSpec.describe "Sellers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/sellers/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/sellers/create"
      expect(response).to have_http_status(:success)
    end
  end

end
