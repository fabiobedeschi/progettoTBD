class Book < ApplicationRecord
  # Scopes
  scope :ordered, lambda { |attr, ad|
    if Book.column_names.include?(attr)
      order(ad.nil? || !(%w[asc desc].include? ad) ? attr : "#{attr} #{ad}")
    else
      order(ad.nil? || !(%w[asc desc].include? ad) ? :title : "title #{ad}")
    end
  }

  # Relations
  belongs_to :author, optional: true
  has_many :comments, dependent: :delete_all
  has_and_belongs_to_many :libraries

  # Data validation
  validates :title, presence: true, uniqueness: true
end
