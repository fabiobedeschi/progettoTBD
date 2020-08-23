class Author < ApplicationRecord
  # Relations
  has_many :books

  # Data validation
  validates :name, presence: true
end
