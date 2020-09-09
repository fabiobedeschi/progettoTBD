class Author < ApplicationRecord
  # Scopes
  scope :ordered, ->(attr) { Author.column_names.include?(attr) ? order(attr) : order(:name) }

  # Relations
  has_many :books
  has_and_belongs_to_many :libraries

  # Data validation
  validates :name, presence: true
end
