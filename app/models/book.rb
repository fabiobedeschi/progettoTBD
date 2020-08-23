class Book < ApplicationRecord
  # Relations
  belongs_to :author, optional: true

  # Data validation
  validates :title, presence: true
end
