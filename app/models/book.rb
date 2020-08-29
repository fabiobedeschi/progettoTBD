class Book < ApplicationRecord
  # Relations
  belongs_to :author, optional: true
  has_many :comments, dependent: :delete_all
  has_and_belongs_to_many :libraries

  # Data validation
  validates :title, presence: true, uniqueness: true
end
