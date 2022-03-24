# frozen_string_literal: true

RSpec.describe TotalSumsController, type: :controller do
  describe 'GET #index' do
    let(:total_sums) { FactoryBot.create_list(:total_sum, 2) }

    context 'Index successfully renders' do
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

    context "Index didn't renders" do
      it 'populates an array of all total_sums' do
        expect(assigns(:total_sums)).not_to match_array(total_sums)
      end

      it 'renders index view' do
        expect(response).not_to render_template :index
      end
    end
  end

  describe 'GET show' do
    let(:total_sums) { FactoryBot.create_list(:total_sum, 2) }

    context 'Method show successfully renders' do
      it 'assigns @teams' do
        get :show, params: { id: total_sums[0].id }
        expect(assigns['total_sum'].id).to eq(total_sums[0].id)
        expect(assigns['total_sum'].title).to eq(total_sums[0].title)
        expect(assigns['total_sum'].for_what).to eq(total_sums[0].for_what)
        expect(assigns['total_sum'].count).to eq(total_sums[0].count)
      end

      it 'renders the http status ok' do
        get :show, params: { id: total_sums[0].id }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'Method show not successfully renders' do
      it 'assigns @teams' do

        get :show, params: { id: total_sums[1].id }

        expect(assigns['total_sum'].id).not_to eq(total_sums[0].id)
      end

      it 'renders the http status ok' do
        get :show, params: { id: total_sums[1].id }
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'PUT update' do
    context 'valid attributes' do
      let(:total_sum) { FactoryBot.create(:total_sum) }
      it 'assigns the requested total_sum to @total_sum' do
        patch :update, params: { total_sum: FactoryBot.attributes_for(:total_sum), id: total_sum.id }
        expect(assigns(:total_sum)).to eq total_sum
      end

      it 'changes total_sum attributes' do
        patch :update, params: { total_sum: { title: 'New', for_what: 'News', count: 321 }, id: total_sum.id }
        total_sum.reload
        expect(total_sum.title).to eq 'New'
        expect(total_sum.for_what).to eq 'News'
      end

      it 'redirects to the updated total_sum' do
        patch :update, params: { total_sum: FactoryBot.attributes_for(:total_sum), id: total_sum.id }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'invalid attributes' do
      let(:total_sum) { FactoryBot.create(:total_sum) }
      it 'does not change total_sum attributes' do
        patch :update, params: { total_sum: { title: 'New', for_what: nil, count: 321 }, id: total_sum.id }
        total_sum.reload
        expect(total_sum.title).to eq 'default'
        expect(total_sum.for_what).to eq 'for_that'
      end

      it 're-renders edit view' do
        patch :update, params: { total_sum: { title: 'New', for_what: nil, count: 321 }, id: total_sum.id }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'POST create' do
  context 'with valid attributes' do
    it 'saves the new total_sum' do
      expect { post :create, params: { total_sum: FactoryBot.attributes_for(:total_sum) } }.to change { TotalSum.count }.by(1)
    end

    it 'redirects to show view' do
      post :create, params: { total_sum: FactoryBot.attributes_for(:total_sum) }
      expect(response).to have_http_status(:ok)
    end
  end

  context 'with invalid attributes' do
    it 'does not save the total_sum' do
      expect { post :create, params: { total_sum: FactoryBot.attributes_for(:invalid_total_sum) } }.to_not change { TotalSum.count }
    end

    it 're-renders new view' do
      post :create, params: { total_sum: FactoryBot.attributes_for(:invalid_total_sum) }
      expect(response).to render_template :new
    end
  end
  end

  describe 'DELETE destroy' do
    let!(:total_sum) { FactoryBot.create(:total_sum) }

    it 'assigns @teams' do
      expect { delete :destroy, params: { id: total_sum.id } }.to change(TotalSum, :count).by(-1)
    end

    it 'renders the http status no content' do
      delete :destroy, params: { id: total_sum.id }
      expect(response).to have_http_status(:no_content)
    end
  end
end
