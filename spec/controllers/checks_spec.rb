# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChecksController, type: :controller do
  describe 'GET #index' do
    let(:total_sum) { FactoryBot.create(:total_sum) }
    let(:checks) { FactoryBot.create_list(:check, 2, total_sum_id: total_sum.id) }

    context 'Index successfully renders' do
      before do
        get :index
      end

      it 'populates an array of all checks' do
        expect(assigns(:checks)).to match_array(checks)
      end

      it 'renders index view' do
        expect(response).to render_template :index
      end
    end

    context "Index didn't renders" do
      it 'populates an array of all checks' do
        expect(assigns(:checks)).not_to match_array(checks)
      end

      it 'renders index view' do
        expect(response).not_to render_template :index
      end
    end
  end

  describe 'GET show' do
    let(:total_sum) { FactoryBot.create(:total_sum) }
    let(:checks) { FactoryBot.create_list(:check, 2, total_sum_id: total_sum.id) }

    context 'Method show successfully renders' do
      it 'assigns @teams' do
        get :show, params: { id: checks[0].id }
        expect(assigns['check'].id).to eq(checks[0].id)
        expect(assigns['check'].title).to eq(checks[0].title)
        expect(assigns['check'].body).to eq(checks[0].body)
        expect(assigns['check'].cost).to eq(checks[0].cost)
      end

      it 'renders the http status ok' do
        get :show, params: { id: checks[0].id }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'Method show not successfully renders' do
      it 'assigns @teams' do

        get :show, params: { id: checks[1].id }

        expect(assigns['check'].id).not_to eq(checks[0].id)
      end

      it 'renders the http status ok' do
        get :show, params: { id: checks[1].id }
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'PUT update' do
    let(:total_sum) { FactoryBot.create(:total_sum) }
    let(:check) { FactoryBot.create(:check, total_sum_id: total_sum.id) }

    context 'Method update successfully renders' do
      it 'assigns @teams' do
        post :update, params: { id: check.id, check: { title: 'default1' } }
        expect(assigns['check'].title).to eq('default1')
      end

      it 'renders the http status ok' do
        post :update, params: { id: check.id, check: { title: 'default1' } }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'Method update not successfully renders' do
      it 'assigns @teams' do
        post :update, params: { id: check.id, check: { title: 'default' } }
        expect(assigns['check'].title).not_to eq('default1')
      end

      it 'renders the http status ok' do
        post :update, params: { id: check.id, check: { title: 'default' } }
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'POST create' do
    let!(:total_sum) { FactoryBot.create(:total_sum) }

    context 'Method create successfully renders' do
      it 'assigns @teams' do
        post :create, params: { check: { title: 'default', body: 'default', cost: 111 }, total_sum_id: total_sum.id }
        expect(assigns['check'].id).to eq(1)
        expect(assigns['check'].title).to eq('default')
        expect(assigns['check'].body).to eq('default')
        expect(assigns['check'].cost).to eq(111)
      end

      it 'renders the http status ok' do
        post :create, params: { check: { title: 'default', body: 'default', cost: 111 }, total_sum_id: total_sum.id }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'Method create not successfully renders' do
      it 'assigns @teams' do
        post :create, params: { check: { title: 'default', body: 'default', cost: 'fe' }, total_sum_id: total_sum.id }

        expect(assigns['check'].cost).not_to eq('fe')
      end

      it 'renders the http status ok' do
        post :create, params: { check: { title: 'default', body: 'default', cost: 'adw' }, total_sum_id: total_sum.id }
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'DELETE destroy' do
    let(:total_sum) { FactoryBot.create(:total_sum) }
    let!(:check) { FactoryBot.create(:check, total_sum_id: total_sum.id) }

      it 'assigns @teams' do
        expect { delete :destroy, params: { id: check.id } }.to change { Check.count }.by(-1)
      end

      it 'renders the http status no content' do
        delete :destroy, params: { id: check.id }
        expect(response).to have_http_status(:no_content)
    end
  end
end
