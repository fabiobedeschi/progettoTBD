class Library < ApplicationRecord
  # Relations
  belongs_to :user, optional: false
  has_and_belongs_to_many :books
  # has_and_belongs_to_many :authors

  # Data validation
  validates_presence_of :user
end
