class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true

  scope :admins, -> { where(admin: true) }
end
