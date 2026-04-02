class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  scope :published, -> { where("published_at <= ?", Time.current).order(published_at: :desc) }
  scope :recent, -> { order(created_at: :desc) }

  def published?
    published_at.present? && published_at <= Time.current
  end
end
