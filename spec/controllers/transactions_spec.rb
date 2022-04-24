# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  let(:user) { create(:user) }
  let(:account) { create(:account, user_id: user.id) }
  let(:category) { create(:category) }

  before do
    sign_in(user)
  end

  describe 'GET #index' do

    let(:transactions) { create_list(:transaction, 2, account_id: account.id, category_id: category.id, user_id: user.id) }

    context 'Index successfully renders' do
      before do
        get :index
      end

      it 'populates an array of all transactions' do
        expect(assigns(:transactions)).to match_array(transactions.to_a)
      end

      it 'renders index view' do
        expect(response).to render_template :index
      end
    end

    context "Index didn't renders" do
      it 'populates an array of all transactions' do
        expect(assigns(:transactions)).not_to match_array(transactions)
      end

      it 'renders index view' do
        expect(response).not_to render_template :index
      end
    end
  end

  describe 'GET show' do
    let(:user) { create(:user) }
    let(:account) { create(:account, user_id: user.id) }
    let(:transactions) { create_list(:transaction, 2, account_id: account.id, category_id: category.id, user_id: user.id) }

    context 'Method show successfully renders' do
      it 'assigns @teams' do
        get :show, params: { id: transactions[0].id }
        expect(assigns['transaction'].id).to eq(transactions[0].id)
        expect(assigns['transaction'].title).to eq(transactions[0].title)
        expect(assigns['transaction'].body).to eq(transactions[0].body)
        expect(assigns['transaction'].cost).to eq(transactions[0].cost)
      end

      it 'renders the http status ok' do
        get :show, params: { id: transactions[0].id }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'Method show not successfully renders' do
      it 'assigns @teams' do
        get :show, params: { id: transactions[1].id }

        expect(assigns['transaction'].id).not_to eq(transactions[0].id)
      end

      it 'renders the http status ok' do
        get :show, params: { id: transactions[1].id }
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'PUT update' do
    let(:user) { create(:user) }
    let(:account) { create(:account, user_id: user.id) }

    context 'valid attributes' do
      let(:transaction) { create(:transaction, account_id: account.id, category_id: category.id, user_id: user.id) }

      it 'assigns the requested transaction to @transaction' do
        patch :update, params: { transaction: attributes_for(:transaction), id: transaction.id }
        expect(assigns(:transaction)).to eq transaction
      end

      it 'changes transaction attributes' do
        patch :update,
              params: { transaction: { title: 'New', body: 'News', cost: 321 }, account_id: account.id, user_id: user.id,
                        id: transaction.id }
        transaction.reload
        expect(transaction.title).to eq 'New'
        expect(transaction.body).to eq 'News'
      end

      it 'redirects to the updated transaction' do
        patch :update, params: { transaction: attributes_for(:transaction), id: transaction.id }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'invalid attributes' do
      let(:transaction) { create(:transaction, account_id: account.id, category_id: category.id, user_id: user.id) }

      it 'does not change transaction attributes' do
        patch :update, params: { transaction: { title: 'New', body: nil, cost: 321 }, id: transaction.id }
        transaction.reload
        expect(transaction.title).to eq 'default'
        expect(transaction.body).to eq 'for_that'
      end

      it 're-renders edit view' do
        patch :update, params: { transaction: { title: 'New', body: nil, cost: 321 }, id: transaction.id }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'POST create' do
    let(:user) { create(:user) }
    let!(:account) { create(:account, user_id: user.id) }
    let!(:category) { create(:category) }

    context 'with valid attributes' do
      it 'saves the new transaction' do
        expect do
          post :create, params: { transaction: attributes_for(:transaction, category_id: category.id), account_id: account.id, user_id: user.id }
        end.to change(Transaction, :count).by(1)
      end

      it 'redirects to show view' do
        post :create,
             params: { transaction: attributes_for(:transaction), account_id: account.id, category_id: category.id, user_id: user.id }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the transaction' do
        expect do
          post :create,
               params: { transaction: attributes_for(:invalid_transaction), account_id: account.id, user_id: user.id,
                         category_id: category.id }
        end.not_to change(Transaction, :count)
      end

      it 're-renders new view' do
        post :create,
             params: { transaction: attributes_for(:invalid_transaction), account_id: account.id, user_id: user.id,
                       category_id: category.id }
        expect(response).to render_template 'accounts/show'
      end
    end
  end

  describe 'DELETE destroy' do
    let(:user) { create(:user) }
    let(:account) { create(:account, user_id: user.id) }
    let(:category) { create(:category) }
    let!(:transaction) { create(:transaction, account_id: account.id, category_id: category.id, user_id: user.id) }

    it 'assigns @teams' do
      expect { delete :destroy, params: { id: transaction.id, account_id: account.id, user_id: user.id } }.to change(Transaction, :count).by(-1)
    end
  end
end
