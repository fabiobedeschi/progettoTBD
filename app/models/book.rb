class Book < ApplicationRecord
  # Relations
  belongs_to :author, optional: true
  has_many :comments, dependent: :delete_all

  # Data validation
  validates :title, presence: true
end
