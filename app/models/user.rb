class User < ApplicationRecord
  # Password encrypting
  has_secure_password

  # Relations
  has_one :library
  has_many :comments, dependent: :delete_all

  # Data validation
  validates :username, presence: true, uniqueness: true
  validates_presence_of :library
end
