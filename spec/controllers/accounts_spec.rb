# frozen_string_literal: true

RSpec.describe AccountsController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe 'GET #index' do
    let(:accounts) { create_list(:account, 2, user_id: user.id) }

    context 'Index successfully renders' do
      before do
        get :index
      end

      it 'populates an array of all accounts' do
        expect(assigns(:accounts)).to match_array(accounts)
      end

      it 'renders index view' do
        expect(response).to render_template :index
      end
    end

    context "Index didn't renders" do
      it 'populates an array of all accounts' do
        expect(assigns(:accounts)).not_to match_array(accounts)
      end

      it 'renders index view' do
        expect(response).not_to render_template :index
      end
    end
  end

  describe 'GET show' do
    let(:accounts) { create_list(:account, 2, user_id: user.id) }

    context 'Method show successfully renders' do
      it 'assigns @teams' do
        get :show, params: { id: accounts[0].id }
        expect(assigns['account'].id).to eq(accounts[0].id)
        expect(assigns['account'].title).to eq(accounts[0].title)
        expect(assigns['account'].for_what).to eq(accounts[0].for_what)
        expect(assigns['account'].total_count).to eq(accounts[0].total_count)
      end

      it 'renders the http status ok' do
        get :show, params: { id: accounts[0].id }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'Method show not successfully renders' do
      it 'assigns @teams' do
        get :show, params: { id: accounts[1].id }

        expect(assigns['account'].id).not_to eq(accounts[0].id)
      end

      it 'renders the http status ok' do
        get :show, params: { id: accounts[1].id }
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'PUT update' do
    context 'valid attributes' do
      let(:account) { create(:account, user_id: user.id) }

      it 'assigns the requested account to @account' do
        patch :update, params: { account: attributes_for(:account), id: account.id }
        expect(assigns(:account)).to eq account
      end

      it 'changes account attributes' do
        patch :update, params: { account: { title: 'New', for_what: 'News', total_count: 321 }, id: account.id }
        account.reload
        expect(account.title).to eq 'New'
        expect(account.for_what).to eq 'News'
      end

      it 'redirects to the updated account' do
        patch :update, params: { account: attributes_for(:account), id: account.id }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'invalid attributes' do
      let(:account) { create(:account, user_id: user.id) }

      it 'does not change account attributes' do
        patch :update, params: { account: { title: 'New', for_what: nil, total_count: 321 }, id: account.id }
        account.reload
        expect(account.title).to eq 'default'
        expect(account.for_what).to eq 'for_that'
      end

      it 're-renders edit view' do
        patch :update, params: { account: { title: 'New', for_what: nil, total_count: 321 }, id: account.id }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'POST create' do
    context 'with valid attributes' do
      it 'saves the new account' do
        expect do
          post :create, params: { account: attributes_for(:account) }
        end.to change(Account, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { account: attributes_for(:account) }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the account' do
        expect do
          post :create, params: { account: attributes_for(:invalid_account) }
        end.not_to change(Account, :count)
      end

      it 're-renders new view' do
        post :create, params: { account: attributes_for(:invalid_account) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'DELETE destroy' do
    let!(:account) { create(:account, user_id: user.id) }

    it 'assigns @teams' do
      expect { delete :destroy, params: { id: account.id } }.to change(Account, :count).by(-1)
    end
  end
end
