class Author < ApplicationRecord
  # Relations
  has_many :author_books
  has_many :books, through: :author_books

  # Data validation
  validates :name, presence: true
end
