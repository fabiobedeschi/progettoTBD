class Comment < ApplicationRecord
  belongs_to :book, optional: false
  belongs_to :user, optional: false

  validates :text, presence: true
end
