# frozen_string_literal: true

RSpec.describe CategoriesController, type: :controller do
  describe 'GET #index' do
    let(:categories) { create_list(:category, 2) }

    context 'Index successfully renders' do
      before do
        get :index
      end

      it 'populates an array of all categories' do
        expect(assigns(:categories)).to match_array(categories)
      end

      it 'renders index view' do
        expect(response).to render_template :index
      end
    end

    context "Index didn't renders" do
      it 'populates an array of all categories' do
        expect(assigns(:categories)).not_to match_array(categories)
      end

      it 'renders index view' do
        expect(response).not_to render_template :index
      end
    end
  end

  describe 'GET show' do
    let(:categories) { create_list(:category, 2) }

    context 'Method show successfully renders' do
      it 'assigns @teams' do
        get :show, params: { id: categories[0].id }
        expect(assigns['category'].id).to eq(categories[0].id)
        expect(assigns['category'].name).to eq(categories[0].name)
        expect(assigns['category'].description).to eq(categories[0].description)
      end

      it 'renders the http status ok' do
        get :show, params: { id: categories[0].id }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'Method show not successfully renders' do
      it 'assigns @teams' do
        get :show, params: { id: categories[1].id }

        expect(assigns['category'].id).not_to eq(categories[0].id)
      end

      it 'renders the http status ok' do
        get :show, params: { id: categories[1].id }
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'PUT update' do
    context 'valid attributes' do
      let(:category) { create(:category) }

      it 'assigns the requested category to @category' do
        patch :update, params: { category: attributes_for(:category), id: category.id }
        expect(assigns(:category)).to eq category
      end

      it 'changes category attributes' do
        patch :update, params: { category: { name: 'New', description: 'News' }, id: category.id }
        category.reload
        expect(category.name).to eq 'default'
        expect(category.description).to eq 'About that'
      end

      it 'redirects to the updated category' do
        patch :update, params: { category: attributes_for(:category), id: category.id }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'invalid attributes' do
      let(:category) { create(:category) }

      it 'does not change category attributes' do
        patch :update, params: { category: { name: 'New', description: nil }, id: category.id }
        category.reload
        expect(category.name).to eq 'default'
        expect(category.description).to eq 'About that'
      end

      it 're-renders edit view' do
        patch :update, params: { category: { name: 'New', description: nil }, id: category.id }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'POST create' do
    context 'with valid attributes' do
      it 'saves the new category' do
        expect do
          post :create, params: { category: attributes_for(:category) }
        end.to change(Category, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { category: attributes_for(:category) }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the category' do
        expect do
          post :create, params: { category: attributes_for(:invalid_category) }
        end.not_to change(Category, :count)
      end

      it 're-renders new view' do
        post :create, params: { category: attributes_for(:invalid_category) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'DELETE destroy' do
    let!(:category) { create(:category) }

    it 'assigns @teams' do
      expect { delete :destroy, params: { id: category.id } }.to change(Category, :count).by(-1)
    end
  end
end
