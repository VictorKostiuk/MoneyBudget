require 'rails_helper'
require 'pry'

RSpec.describe TotalSumsController do

  describe "GET index" do
    let!(:total_sums) {FactoryBot.create_list(:total_sum, 5) }
    it "assigns @teams" do
      get :index
      expect(assigns(:total_sums)).to eq(total_sums)
    end

    it "renders the http status ok" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

end
