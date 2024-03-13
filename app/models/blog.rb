class Blog < ApplicationRecord
  belongs_to :user

  validates :title, uniqueness: true
  validates :title, :content, presence: true

  after_create_commit :set_publication_date

  def set_publication_date
    update_column(:publication_date, DateTime.now)
  end
end
