class Book < ApplicationRecord
  # Data validation
  validates :title, :plot, presence: true
end
