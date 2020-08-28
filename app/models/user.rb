class User < ApplicationRecord
  has_secure_password

  # Relations
  has_many :comments, dependent: :delete_all

  # Data validation
  validates :username, presence: true, uniqueness: true
end
