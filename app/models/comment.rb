class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validates :content, presence: true

  default_scope { order(created_at: :desc) }

  # after_create_commit  { broadcast_prepend_to [blog, :comments], partial: 'comments/comment', locals: { blog: blog, comment: self }, target: "#{dom_id(@blog)}_comments" }
  # after_update_commit -> { broadcast_replace_to [blog, :comments], partial: 'comments/comment', locals: { blog: blog, comment: self }, target: "#{dom_id(blog)}_comments"  }
  after_destroy_commit { broadcast_remove_to [blog, :comments], target: "blog_comment_#{id}" }
end
