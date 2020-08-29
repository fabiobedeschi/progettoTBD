class Author < ApplicationRecord
  # Relations
  has_many :books
  has_and_belongs_to_many :libraries

  # Data validation
  validates :name, presence: true
end
