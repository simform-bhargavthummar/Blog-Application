require 'rails_helper'

RSpec.describe BlogsController, type: :controller do
  let(:user) { create(:user) }
  let(:invalid_params) { { title: nil, content: 'Test post.', user_id: user.id } }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index

      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new blog post' do
        params = { blog: attributes_for(:blog, title: 'Test Blog', content: 'Test post 1') }
        post :create, params: params

        expect(response).to have_http_status(:found)
      end
    end

    context 'with invalid params' do
      it 'does not create a new blog post' do
        expect {
          post :create, params: { blog: invalid_params }
        }.to_not change(Blog, :count)
      end
    end
  end

  describe 'PUT #update' do
    let(:blog) { create(:blog, user_id: user.id) }

    context 'with valid parameters' do
      it 'updates the requested blog post' do
        put :update, params: { id: blog.to_param, blog: { title: 'New Title' , user_id: user.id } }

        blog.reload

        expect(blog.title).to eq('New Title')
      end
    end

    context 'with invalid parameters' do
      it 'does not update the blog post' do
        put :update, params: { id: blog.to_param, blog: { title: nil , user_id: user.id } }
        expect(blog.reload.title).not_to eq(nil)
      end
    end
  end

  describe 'GET #edit' do
    let(:blog) { create(:blog, user_id: user.id) }

    it 'returns a success response' do
      get :edit, params: { id: blog.to_param }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end
  
  describe 'DELETE #destroy' do
    let!(:blog) { create(:blog, user_id: user.id) }

    it 'destroys the requested blog post' do
      expect {
        delete :destroy, params: { id: blog.to_param }
      }.to change(Blog, :count).by(-1)
    end
  end
end
