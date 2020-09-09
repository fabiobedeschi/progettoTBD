class Comment < ApplicationRecord
  # Scopes
  scope :from_last, -> { order('created_at desc') }

  # Relations
  belongs_to :book, optional: false
  belongs_to :user, optional: false

  # Validation
  validates :text, presence: true
end
