class Book < ApplicationRecord
  has_many :author_books
  has_many :authors, through: :author_books

  # Data validation
  validates :title, presence: true
end
