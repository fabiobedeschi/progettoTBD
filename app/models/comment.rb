class Comment < ApplicationRecord
  default_scope { order(:created_at) }

  belongs_to :book, optional: false
  belongs_to :user, optional: false

  validates :text, presence: true
end
