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

    context 'valid attributes' do
      let(:check) { FactoryBot.create(:check, total_sum_id: total_sum.id) }
      it 'assigns the requested check to @check' do
        patch :update, params: { check: FactoryBot.attributes_for(:check), id: check.id }
        expect(assigns(:check)).to eq check
      end

      it 'changes check attributes' do
        patch :update, params: { check: { title: 'New', body: 'News', cost: 321 }, total_sum_id: total_sum.id, id: check.id }
        check.reload
        expect(check.title).to eq 'New'
        expect(check.body).to eq 'News'
      end

      it 'redirects to the updated check' do
        patch :update, params: { check: FactoryBot.attributes_for(:check), id: check.id }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'invalid attributes' do
      let(:check) { FactoryBot.create(:check, total_sum_id: total_sum.id) }
      it 'does not change check attributes' do
        patch :update, params: { check: { title: 'New', body: nil, cost: 321 }, id: check.id }
        check.reload
        expect(check.title).to eq 'default'
        expect(check.body).to eq 'for_that'
      end

      it 're-renders edit view' do
        patch :update, params: { check: { title: 'New', body: nil, cost: 321 }, id: check.id }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'POST create' do
    let!(:total_sum) { FactoryBot.create(:total_sum) }

    context 'with valid attributes' do
      it 'saves the new check' do
        expect { post :create, params: { check: FactoryBot.attributes_for(:check), total_sum_id: total_sum.id } }.to change { Check.count }.by(1)
      end

      it 'redirects to show view' do
        post :create, params: { check: FactoryBot.attributes_for(:check), total_sum_id: total_sum.id }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the check' do
        expect { post :create, params: { check: FactoryBot.attributes_for(:invalid_check), total_sum_id: total_sum.id } }.to_not change { Check.count }
      end

      it 're-renders new view' do
        post :create, params: { check: FactoryBot.attributes_for(:invalid_check), total_sum_id: total_sum.id }
        expect(response).to render_template "total_sums/show"
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
