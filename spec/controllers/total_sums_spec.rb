# frozen_string_literal: true
require 'rails_helper'

RSpec.describe TotalSumsController, type: :controller do
  describe 'GET #index' do
    let(:total_sums) { FactoryBot.create_list(:total_sum, 2) }

    before do
      get :index
    end

    it 'populates an array of all total_sums' do
      expect(assigns(:total_sums)).to match_array(total_sums)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe "GET show" do
    let!(:total_sum) { FactoryBot.create(:total_sum) }
    it "assigns @teams" do
      get :show, params: { id: total_sum.id }

      expect(assigns["total_sum"].id).to eq(total_sum.id)
      expect(assigns["total_sum"].title).to eq(total_sum.title)
      expect(assigns["total_sum"].for_what).to eq(total_sum.for_what)
      expect(assigns["total_sum"].count).to eq(total_sum.count)
    end

    it "renders the http status ok" do
      get :show, params: { id: total_sum.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "PUT update" do
    let!(:total_sum) { FactoryBot.create(:total_sum) }
    it "assigns @teams" do
      post :update, params: { id: total_sum.id, total_sum: { title: "default1" } }
      expect(assigns["total_sum"].title).to eq("default1")
    end

    it "renders the http status ok" do
      post :update, params: { id: total_sum.id, total_sum: { title: "default1" } }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST create" do
    it "assigns @teams" do
      post :create, params: { total_sum: { title: "default", for_what: "default", count: 111 } }
      expect(assigns["total_sum"].id).to eq(1)
      expect(assigns["total_sum"].title).to eq("default")
      expect(assigns["total_sum"].for_what).to eq("default")
      expect(assigns["total_sum"].count).to eq(111)
    end

    it "renders the http status ok" do
      post :create, params: { total_sum: { title: "default", for_what: "default", count: 111 } }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE destroy" do
    let!(:total_sum) { FactoryBot.create(:total_sum) }
    it "assigns @teams" do
      expect { delete :destroy, params: { id: total_sum.id } }.to change { TotalSum.count }.by(-1)
    end

    it "renders the http status no content" do
      delete :destroy, params: { id: total_sum.id }
      expect(response).to have_http_status(:no_content)
    end
  end
end
