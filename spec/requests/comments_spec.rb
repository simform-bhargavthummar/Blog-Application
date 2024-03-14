require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user) }
  let(:blog) { create(:blog, user_id: user.id) }

  before do
    sign_in user
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:valid_attributes) { { blog_id: blog.id, comment: { content: 'Comment 1' } } }

      it "creates a new comment" do
        expect {
          post :create, params: valid_attributes
        }.to change(Comment, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { { blog_id: blog.id, comment: { content: nil } } }

      it 'will not create a comment' do
        expect {
          post :create, params: invalid_attributes
        }.to change(Comment, :count).by(0)
      end
    end
  end

  describe 'PATCH #update' do
    let(:comment) { create(:comment, user_id: user.id, blog_id: blog.id) }

    context "with valid attributes" do
      let(:valid_attributes) { { id: comment.id, blog_id: blog.id, comment: { content: "comment 1 updated" } } }

      it "will update the comment" do
        patch :update, params: valid_attributes
        comment.reload
        expect(comment.content).to eq("comment 1 updated")
      end
    end

    context "with invalid attributes" do
      let(:invalid_attributes) { { id: comment.id, blog_id: blog.id, comment: { content: nil } } }

      it "will not update comment" do
        patch :update, params: invalid_attributes
        comment.reload
        expect(comment.content).not_to eq(nil)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:comment) { create(:comment, user_id: user.id, blog_id: blog.id) }

    it "deletes the comment" do
      expect {
        delete :destroy, params: { id: comment.id, blog_id: blog.id }
      }.to change(Comment, :count).by(0)
    end
  end
end
