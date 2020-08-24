class User < ApplicationRecord
  has_secure_password

  # Data validation
  validates :username, presence: true, uniqueness: true
end
